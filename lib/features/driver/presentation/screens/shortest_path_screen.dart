import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/getx/location_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/driver/data/entity/get_branch_location_entity.dart';
import 'package:aloudeh_company/features/driver/data/params/get_branch_location_params.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/get_branch_location_cubit.dart';

class ShortestPathScreen extends StatefulWidget {
  @override
  _ShortestPathScreenState createState() => _ShortestPathScreenState();
}

class _ShortestPathScreenState extends State<ShortestPathScreen> {
 GoogleMapController? _mapController;
  final LocationController locationController = Get.put(LocationController());
  LatLng? _branchLatLng;
  Marker? _branchMarker;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<GetBranchLocationCubit>();
    cubit.emitGetBranchLocation(getBranchLocationParams: GetBranchLocationParams(branchId: '1'));
  }

  void _animateToLocation(LatLng location) {
    _mapController?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: location, zoom: 15.0),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shortest Path Screen'),
        backgroundColor: AppColors.darkBlue,
      ),
      body: BlocConsumer<GetBranchLocationCubit, GetState<GetBranchLocationEntity>>(
        listener: (context, state) {
          state.whenOrNull(
            success: (data) {
              final branchLatLng = LatLng(data.data.branchLat, data.data.branchLng);
              setState(() {
                _branchLatLng = branchLatLng;
                _branchMarker = Marker(
                  markerId: MarkerId('branch'),
                  position: branchLatLng,
                  infoWindow: InfoWindow(title: 'Branch Location'),
                );
                _animateToLocation(branchLatLng);
                print('Branch Location: $_branchLatLng');
              });
            },
            error: (error) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${NetworkExceptions.getDioException(error)}')),
            ),
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            success: (data) => GoogleMap(
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(0, 0),
                zoom: 2.0,
              ),
              markers: {
                if (_branchMarker != null) _branchMarker!,
              },
              onMapCreated: (controller) {
                _mapController = controller;
                if (_branchLatLng != null) {
                  _animateToLocation(_branchLatLng!);
                }
              },
            ),
            orElse: () => const Center(child: CupertinoActivityIndicator()),
          );
        },
      ),
    );
  }
}
