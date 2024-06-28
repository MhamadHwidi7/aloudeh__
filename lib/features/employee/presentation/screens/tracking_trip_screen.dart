import 'dart:async';
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/getx/location_controller.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_branch_location_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/tracking_entity.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_branch_location_employee_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/tracking_driver_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/employee/data/params/get_branch_location_params.dart';
import 'package:aloudeh_company/features/employee/data/params/tracking_params.dart';

class EmployeeTrackingScreen extends StatefulWidget {
  final int branchId;
  final String tripNumber;

  const EmployeeTrackingScreen({
    Key? key,
    required this.branchId,
    required this.tripNumber,
  }) : super(key: key);

  @override
  _EmployeeTrackingScreenState createState() => _EmployeeTrackingScreenState();
}

class _EmployeeTrackingScreenState extends State<EmployeeTrackingScreen> {
  GoogleMapController? _mapController;
  final LocationController locationController = Get.put(LocationController());
  LatLng? _branchLatLng;
  Marker? _branchMarker;
  Marker? _driverMarker;
  Set<Marker> _markers = {};
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initializeBranchLocation();
    _startTrackingDriver();
  }

  @override
  void dispose() {
    _timer?.cancel();
    Get.delete<LocationController>(); // Properly dispose of the GetX controller
    super.dispose();
  }

  void _initializeBranchLocation() {
    final branchCubit = context.read<GetBranchLocationEmployeeCubit>();
    branchCubit.emitGetBranchLocation(
      getBranchLocationParams: GetBranchLocationParams(branchId: widget.branchId.toString()),
    );
  }

  void _startTrackingDriver() {
    _timer = Timer.periodic(Duration(seconds: 20), (timer) {
      _fetchDriverLocation();
    });
  }

  void _fetchDriverLocation() {
    final trackingCubit = context.read<TrackingDriverCubit>();
    trackingCubit.emitTrackingDriver(
      trackingParams: TrackingParams(tripNumber: widget.tripNumber),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Tracking Screen', style: TextStyle(color: AppColors.yellow)),
        backgroundColor: AppColors.darkBlue,
      ),
      body: Stack(
        children: [
          _buildBody(context),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocListener<GetBranchLocationEmployeeCubit, GetState<GetBranchLocationEntity>>(
      listener: (context, branchState) {
        branchState.whenOrNull(
          success: (branchData) {
            final branchLatLng = LatLng(double.parse(branchData.data.branchLat), double.parse(branchData.data.branchLng));
            setState(() {
              _branchLatLng = branchLatLng;
              _branchMarker = Marker(
                markerId: MarkerId('branch'),
                position: branchLatLng,
                infoWindow: InfoWindow(title: 'Branch Location'),
              );
              _markers.add(_branchMarker!);
              _mapController?.animateCamera(CameraUpdate.newLatLng(branchLatLng));
            });
          },
          error: (error) => Fluttertoast.showToast(msg: NetworkExceptions.getErrorMessage(error)),
        );
      },
      child: BlocListener<TrackingDriverCubit, PostState<BaseTrackingEntity>>(
        listener: (context, trackingState) {
          trackingState.whenOrNull(
            success: (trackingData) {
              if (trackingData.data.driverCurrentLat == 0 && trackingData.data.driverCurrentLng == 0) {
                Fluttertoast.showToast(
                  msg: "This Trip has not started yet",
                  toastLength: Toast.LENGTH_SHORT,
                );
              }
              final driverLatLng = LatLng(trackingData.data.driverCurrentLat, trackingData.data.driverCurrentLng);
              setState(() {
                _driverMarker = Marker(
                  markerId: MarkerId('driver'),
                  position: driverLatLng,
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                  infoWindow: InfoWindow(title: 'Driver Location'),
                );
                _markers.removeWhere((marker) => marker.markerId == MarkerId('driver'));
                _markers.add(_driverMarker!);
              });
            },
            error: (error) => Fluttertoast.showToast(msg: NetworkExceptions.getErrorMessage(error)),
          );
        },
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _branchLatLng ?? LatLng(0, 0),
            zoom: _branchLatLng != null ? 15.0 : 2.0,
          ),
          markers: _markers,
          onMapCreated: (controller) {
            _mapController = controller;
            if (_branchLatLng != null) {
              _mapController?.animateCamera(CameraUpdate.newLatLng(_branchLatLng!));
            }
          },
        ),
      ),
    );
  }
}
