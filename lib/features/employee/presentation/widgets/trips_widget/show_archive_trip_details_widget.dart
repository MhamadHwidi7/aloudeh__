import 'package:aloudeh_company/features/employee/data/entity/get_trip_information_entity.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/archive_eye_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/trip_brfore_invoice_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/trip_list_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/branch_widgets/branch_details_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/trip_detail_row_widget.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_trip_information_entity.dart';
import 'package:flutter/material.dart';
//!Note: this file is all the screen of show trip record 
class ArchivedTripDetails extends StatelessWidget {
  final GetTripInformationSharedEntity getTripInformationEntity;
  const ArchivedTripDetails(
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



class ArchivedTripFinancialDetails extends StatelessWidget {
  final GetTripInformationSharedEntity getTripInformationEntity;
  const ArchivedTripFinancialDetails(
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
