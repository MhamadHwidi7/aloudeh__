
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/archive_eye_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/archive_table_mainfest_list_view_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/custom_appbar_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/manifest_table_header_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/trip_info_header_widget.dart';
import 'package:flutter/material.dart';

class ArchivedManifestScreen extends StatelessWidget {
  final String manifestId;

  const ArchivedManifestScreen({super.key, required this.manifestId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Manifest',
        onBackPress: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 75),
          TripInfoHeader(manifestId: manifestId),
          const Divider(),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                border: Border.all(color: AppColors.darkBlue),
              ),
              margin: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Row(
                children: [
                  const ManifestTableHeader(),
                  const VerticalDivider(color: AppColors.darkBlue),
                   Expanded(child: ArchivedManifestListViewTableWidget(manifestNumber: manifestId,)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
