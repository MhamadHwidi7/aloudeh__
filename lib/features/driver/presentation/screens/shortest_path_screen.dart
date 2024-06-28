import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/features/driver/data/params/shortest_path_params.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/getx/location_controller.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/driver/data/entity/get_branch_location_entity.dart';
import 'package:aloudeh_company/features/driver/data/params/get_branch_location_params.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/get_branch_location_cubit.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/get_shortest_path_cubit.dart';
import 'package:aloudeh_company/features/driver/data/entity/base_place_directions_entity.dart';
import 'package:aloudeh_company/features/driver/data/params/update_location_driver_params.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/update_location_driver_cubit.dart';

class ShortestPathScreen extends StatefulWidget {
  final int branchId;
  final Color polylineColor;
  final int polylineWidth;
  final String tripNumber;

  const ShortestPathScreen({
    Key? key,
    required this.branchId,
    this.polylineColor = Colors.blue,
    this.polylineWidth = 5,
    required this.tripNumber,
  }) : super(key: key);

  @override
  _ShortestPathScreenState createState() => _ShortestPathScreenState();
}

class _ShortestPathScreenState extends State<ShortestPathScreen> {
  GoogleMapController? _mapController;
  final LocationController locationController = Get.put(LocationController());
  LatLng? _branchLatLng;
  Marker? _branchMarker;
  Set<Polyline> _polylines = {};
  PolylinePoints polylinePoints = PolylinePoints();
  String? _totalDistance;
  String? _totalDuration;
  Timer? _locationUpdateTimer;

  @override
  void initState() {
    super.initState();
    _initializeBranchLocation();
    _waitForInitialLocationFetch();
  }

  @override
  void dispose() {
    _locationUpdateTimer?.cancel();
    Get.delete<LocationController>(); // Properly dispose of the GetX controller
    super.dispose();
  }

  void _waitForInitialLocationFetch() async {
    await locationController.initialLocationFetchCompleted;
    _startLocationUpdateTimer();
    _fetchInitialRoute();
  }

  void _startLocationUpdateTimer() {
    _locationUpdateTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      final currentLocation = locationController.currentLocation;
      if (currentLocation != null) {
        _updateDriverLocation(LatLng(currentLocation.latitude!, currentLocation.longitude!));
      }
    });
  }

  void _updateDriverLocation(LatLng location) {
    final updateLocationDriverCubit = context.read<UpdateLocationDriverCubit>();
    updateLocationDriverCubit.emitUpdateLocationDriver(
      updateLocationDriverParams: UpdateLocationDriverParams(
        driverCurrentLat: location.latitude,
        driverCurrentLng: location.longitude,
        tripNumber: widget.tripNumber,
      ),
    );
  }

  void _initializeBranchLocation() {
    final branchCubit = context.read<GetBranchLocationCubit>();
    branchCubit.emitGetBranchLocation(
      getBranchLocationParams: GetBranchLocationParams(branchId: widget.branchId.toString()),
    );
  }

  void _animateToLocation(LatLng location) {
    _mapController?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: location, zoom: 15.0),
    ));
  }

  void _drawRoute(BasePlaceDirectionsEntity directions) {
    List<LatLng> polylineCoordinates = directions.polylinePoints
        .map((point) => LatLng(point.latitude, point.longitude))
        .toList();

    final polylineId = PolylineId('route_${_polylines.length}');

    setState(() {
      _polylines.add(Polyline(
        polylineId: polylineId,
        points: polylineCoordinates,
        color: widget.polylineColor,
        width: widget.polylineWidth,
      ));
      _totalDistance = directions.totalDistance;
      _totalDuration = directions.totalDuration;
    });

    // Adjust the camera to fit the polyline bounds
    final bounds = directions.bounds;
    _mapController?.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
  }

  void _fetchInitialRoute() {
    final currentLocation = locationController.currentLocation;
    if (currentLocation != null && _branchLatLng != null) {
      _fetchShortestPath(LatLng(currentLocation.latitude!, currentLocation.longitude!), _branchLatLng!);
    }
  }

  void _fetchShortestPath(LatLng origin, LatLng destination) {
    final shortestPathCubit = context.read<GetShortestPathCubit>();
    shortestPathCubit.emitGetShortestPath(
      shortestPathParams: ShortestPathParams(
        origin: origin,
        destination: destination,
      ),
    );
  }

  void _showErrorToast(NetworkExceptions error) {
    Fluttertoast.showToast(
      msg: NetworkExceptions.getErrorMessage(error),
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBody(context),
          if (_totalDistance != null && _totalDuration != null)
            _buildDistanceInfo(context),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocConsumer<GetBranchLocationCubit, GetState<GetBranchLocationEntity>>(
      listener: (context, branchState) {
        branchState.whenOrNull(
          success: (branchData) {
            _handleBranchLocationSuccess(branchData);
          },
          error: (error) => _showErrorToast(error),
        );
      },
      builder: (context, branchState) {
        return branchState.maybeWhen(
          success: (branchData) => _buildShortestPathConsumer(),
          orElse: () => const Center(child: CupertinoActivityIndicator()),
        );
      },
    );
  }

  void _handleBranchLocationSuccess(GetBranchLocationEntity branchData) {
    final branchLatLng = LatLng(double.parse(branchData.data.branchLat), double.parse(branchData.data.branchLng));
    setState(() {
      _branchLatLng = branchLatLng;
      _branchMarker = Marker(
        markerId: MarkerId('branch'),
        position: branchLatLng,
        infoWindow: InfoWindow(title: 'Branch Location'),
      );
      _animateToLocation(branchLatLng);
    });

    _fetchInitialRoute();
  }

  Widget _buildShortestPathConsumer() {
    return BlocConsumer<GetShortestPathCubit, GetState<BasePlaceDirectionsEntity>>(
      listener: (context, shortestPathState) {
        shortestPathState.whenOrNull(
          error: (error) => _showErrorToast(error),
          success: (data) => _drawRoute(data),
        );
      },
      builder: (context, shortestPathState) {
        return shortestPathState.maybeWhen(
          success: (directions) => _buildMap(),
          orElse: () => _buildMap(),
        );
      },
    );
  }

  Widget _buildMap() {
    return GoogleMap(
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(
        target: _branchLatLng ?? LatLng(0, 0),
        zoom: _branchLatLng != null ? 15.0 : 2.0,
      ),
      markers: {
        if (_branchMarker != null) _branchMarker!,
      },
      polylines: _polylines,
      onMapCreated: (controller) {
        _mapController = controller;
        if (_branchLatLng != null) {
          _animateToLocation(_branchLatLng!);
        }
      },
    );
  }

  Widget _buildDistanceInfo(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Distance',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(_totalDistance!),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Duration',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(_totalDuration!),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
