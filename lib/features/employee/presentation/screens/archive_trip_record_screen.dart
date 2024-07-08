
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/archive_manifest_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/custom_appbar_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/show_archive_trip_details_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/trip_info_header_widget.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_trip_information_entity.dart';
import 'package:aloudeh_company/features/shared/data/params/trip_information_params.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_trip_information_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ArchivedTripRecordScreen extends StatefulWidget {
  final String tripNumber;

  const ArchivedTripRecordScreen({super.key, required this.tripNumber});

  @override
  State<ArchivedTripRecordScreen> createState() =>
      _ArchivedTripRecordScreenState();
}

class _ArchivedTripRecordScreenState extends State<ArchivedTripRecordScreen> {
  @override
  void initState() {
    context.read<GetTripInformationSharedCubit>().emitGetTripInformation(
        tripInformationSharedParams:
            TripInformationSharedParams(tripNumber: widget.tripNumber));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Trip Record',
        onBackPress: () => Navigator.pop(context),
      ),
      body: BlocConsumer<GetTripInformationSharedCubit, GetState<GetTripInformationSharedEntity>>(
        listener: (context, state) {
          state.whenOrNull(
            error: (networkExceptions) => Fluttertoast.showToast(
                msg: NetworkExceptions.getErrorMessage(networkExceptions),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: CupertinoColors.systemRed,
                textColor: Colors.white,
                fontSize: 16.0),
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Text("No "),
            loading: () => const Center(child: CupertinoActivityIndicator()),
            success: (data) => ListView(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 75),
                TripInfoHeader(manifestId: widget.tripNumber),
                const Divider(),
                ArchivedTripDetails(
                  getTripInformationEntity: data,
                ),
                const Divider(),
                ArchivedTripFinancialDetails(getTripInformationEntity: data),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ArchivedManifestScreen(manifestId: widget.tripNumber),
            ),
          );
        },
        backgroundColor: AppColors.darkBlue,
        shape: const CircleBorder(),
        child: const Icon(Icons.read_more_rounded, color: AppColors.mediumBlue),
      ),
    );
  }
}