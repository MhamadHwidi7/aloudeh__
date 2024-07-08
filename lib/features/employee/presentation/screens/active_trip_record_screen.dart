
import 'dart:math';

import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/employee/data/params/archive_trip_params.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/archive_trip_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_trips_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/add_invoice_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/archive_eye_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/archive_manifest_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/tracking_trip_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/trip_list_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/branch_widgets/branch_details_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/custom_appbar_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/trip_detail_row_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/trip_info_header_widget.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_trip_information_entity.dart';
import 'package:aloudeh_company/features/shared/data/params/trip_information_params.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_trip_information_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ActiveTripRecordScreen extends StatefulWidget {
  final String tripNumber;

  const ActiveTripRecordScreen({super.key, required this.tripNumber});

  @override
  State<ActiveTripRecordScreen> createState() =>
      _ActiveTripRecordScreenState();
}

class _ActiveTripRecordScreenState extends State<ActiveTripRecordScreen> {
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
            orElse: () => const Text("No "),
            loading: () => const Center(child: CupertinoActivityIndicator()),
            success: (data) => ListView(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 75),
                TripInfoHeader(manifestId: widget.tripNumber),
                const Divider(),
                                TripActionButtons(data: data,),
                const Divider(),

                ActiveTripDetails(
                  getTripInformationEntity: data,
                ),
                const Divider(),
                ActiveTripFinancialDetails(getTripInformationEntity: data),
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

//!Check the archive trip api 

class TripActionButtons extends StatelessWidget {
  final GetTripInformationSharedEntity data;
  const TripActionButtons({super.key, required this.data});

  void _archiveTrip(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return BlocConsumer<ArchiveTripCubit, PostState<BaseEntity>>(
          listener: (context, state) {
            state.whenOrNull(
              success: (dataApi) {
                context.read<GetTripInformationSharedCubit>().emitGetTripInformation(
                    tripInformationSharedParams: TripInformationSharedParams(
                        tripNumber: data.data.number));
                // context.read<GetAllTripsPaginatedCubit>().emitGetAllTrips();
               //!Check this 
                Navigator.pop(context);
                                Navigator.pop(context);

              },
              error: (error) {
                Fluttertoast.showToast(
                  msg: NetworkExceptions.getErrorMessage(error),
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
            );
          },
          builder: (context, state) {
            return CupertinoAlertDialog(
              title: Text(
                "Archive Trip",
                style: TextStyle(
                  fontFamily: 'Bahnschrift',
                  color: AppColors.darkBlue,
                  fontSize: 16.sp,
                ),
              ),
              content: Text(
                "Do you want to archive this trip ${data.data.number}?",
                style: TextStyle(
                  fontFamily: 'Bahnschrift',
                  color: AppColors.darkBlue,
                  fontSize: 14.sp,
                ),
              ),
              actions: [
                CupertinoDialogAction(
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontFamily: 'Bahnschrift',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    context.read<ArchiveTripCubit>().emitArchiveTrip(
                          archiveTripParams:
                              ArchiveTripParams(tripId: data.data.id),
                        );
                  },
                ),
                CupertinoDialogAction(
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontFamily: 'Bahnschrift',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showDialog(BuildContext context, String title, String message) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'Bahnschrift',
              color: AppColors.darkBlue,
              fontSize: 16.sp,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(
              fontFamily: 'Bahnschrift',
              color: AppColors.darkBlue,
              fontSize: 14.sp,
            ),
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text(
                'OK',
                style: TextStyle(
                  color: AppColors.yellow,
                  fontFamily: 'Bahnschrift',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionButton(
            context,
            icon: Icons.archive,
            onPressed: () {
              if (data.data.status == 'closed') {
                _showDialog(
                    context, 'Archive Trip', 'This trip is closed and cannot be archived.');
              } else {
                _archiveTrip(context);
              }
            },
            heroTag: "archive",
          ),
          _buildActionButton(
            context,
            icon: Icons.print,
            onPressed: () {
              if (data.data.status == 'closed') {
                _showDialog(
                    context, 'Add Invoice Trip', 'This trip is closed and cannot be added invoice.');
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddInvoiceScreen(manifestNumber: data.data.number),
                  ),
                );
              }
            },
            heroTag: "print",
          ),
          _buildActionButton(
            context,
            icon: Icons.location_on,
            onPressed: () {
              if (data.data.status == 'active') {
                _showDialog(
                    context, 'Location Tracking', 'This trip is active and tracking is not allowed.');
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmployeeTrackingScreen(
                        branchId: data.data.branchId,
                        tripNumber: data.data.number),
                  ),
                );
              }
            },
            heroTag: "location",
          ),
        ],
      ),
    );
  }


  Widget _buildActionButton(BuildContext context, {required IconData icon, required VoidCallback onPressed, required String heroTag}) {
    return Container(
      height: 50.0,
      width: 50.0,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: FloatingActionButton(
        onPressed: onPressed,
        child: Icon(
          icon,
          color: AppColors.yellow,
        ),
        elevation: 2.0,
        backgroundColor: AppColors.darkBlue,
        heroTag: heroTag,
      ),
    );
  }
}
class ActiveTripDetails extends StatelessWidget {
  final GetTripInformationSharedEntity getTripInformationEntity;
  const ActiveTripDetails(
      {super.key, required this.getTripInformationEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TripDetailRow(
            label: 'Date',
            value: getTripInformationEntity.data.date,
            onTap: null),
        const Divider(),
        TripDetailRow(
            label: 'Status',
            value: getTripInformationEntity.data.status,
            onTap: null),
        const Divider(),
        TripDetailRow(
            label: 'Truck',
            value: getTripInformationEntity.data.truckName,
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ViewTruckScreen()));
            }),
        const Divider(),
        TripDetailRow(
            label: 'Driver',
            value: getTripInformationEntity.data.driverName,
            onTap: null),
        const Divider(),
        TripDetailRow(
            label: 'Branch',
            value: getTripInformationEntity.data.branchName,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewBranchInformationScreen(branchId: getTripInformationEntity.data.branchId,)));
            }),
        const Divider(),
        TripDetailRow(
            label: 'Destination',
            value: getTripInformationEntity.data.destinationName,
            onTap: null),
        const Divider(),
        TripDetailRow(
            label: 'Created by',
            value: getTripInformationEntity.data.createdBy,
            onTap: null),
        const Divider(),
        TripDetailRow(
            label: 'Edited by',
            value: getTripInformationEntity.data.editedBy ?? " - ",
            onTap: null),
      ],
    );
  }
}



class ActiveTripFinancialDetails extends StatelessWidget {
  final GetTripInformationSharedEntity getTripInformationEntity;
  const ActiveTripFinancialDetails(
      {super.key, required this.getTripInformationEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
           SpaceItem(),
          FinancialDetailRow(
            label: 'General Total',
            value: getTripInformationEntity.data.manifestData?.generalTotal
                    ?.toString() ??
                " - ",
          ),
           SpaceItem(),
          FinancialDetailRow(
              label: 'Against Shipping',
              value: getTripInformationEntity.data.manifestData?.againstShipping
                      ?.toString() ??
                  " - "),
           SpaceItem(),
          FinancialDetailRow(
              label: 'Discount',
              value: getTripInformationEntity.data.manifestData?.discount ??
                  " - "),
           SpaceItem(),
          FinancialDetailRow(
              label: 'Adapter',
              value:
                  getTripInformationEntity.data.manifestData?.adapter ?? " - "),
           SpaceItem(),
          FinancialDetailRow(
              label: 'Net Total',
              value: getTripInformationEntity.data.manifestData?.netTotal
                      .toString() ??
                  " - "),
           SpaceItem(),
          FinancialDetailRow(
              label: 'Advance',
              value:
                  getTripInformationEntity.data.manifestData?.adapter ?? " - "),
           SpaceItem(),
          FinancialDetailRow(
              label: 'Misc. Paid',
              value: getTripInformationEntity.data.manifestData?.miscPaid ??
                  " - "),
           SpaceItem(),
          FinancialDetailRow(
              label: 'Collection',
              value: getTripInformationEntity.data.manifestData?.collection ??
                  " - "),
           SpaceItem(),
        ],
      ),
    );
  }
}
