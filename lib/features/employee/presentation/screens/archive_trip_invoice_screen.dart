
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/archive_eye_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/custom_appbar_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/trip_invoice_all_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArchiveTripInvoiceScreen extends StatelessWidget {
  final String destinationId;
  final String sourceName;
  final String destionationName;
  final String senderName;
  final String receiverName;
  final String notes;
  final String numOfPackages;
  final String content;
  final String weight;
  final String marks;
  final String discount;
  final String shippingCost;
  final String againstShipping;
  final String adaptar;
  final String miscllaneous;
  final String prePaid;
  final String size;

  const ArchiveTripInvoiceScreen({
    Key? key,
    required this.destinationId,
    required this.sourceName,
    required this.destionationName,
    required this.senderName,
    required this.receiverName,
    required this.notes,
    required this.numOfPackages,
    required this.content,
    required this.weight,
    required this.marks,
    required this.discount,
    required this.shippingCost,
    required this.againstShipping,
    required this.adaptar,
    required this.miscllaneous,
    required this.size,
    required this.prePaid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
       appBar: CustomAppBar(
    title: 'Trip Invoice',
    onBackPress: () => Navigator.pop(context),
  ),
      body: ListView(
        children: [
          const SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: InfoColumn(
                    label: 'Source',
                    value: sourceName,
                    backgroundColor: AppColors.darkBlue,
                    textColor: AppColors.pureWhite,
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: InfoColumn(
                    label: 'Destination',
                    value: destionationName,
                    backgroundColor: AppColors.yellow,
                    textColor: AppColors.darkBlue,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                InfoRow(
                  label: 'Sender',
                  value: senderName,
                  widthFactor: screenWidth / 11.3,
                  backgroundColor: AppColors.mediumBlue,
                ),
                const SizedBox(height: 10.0),
                InfoRow(
                  label: 'Recipient',
                  value: receiverName,
                  widthFactor: screenWidth / 22,
                  backgroundColor: AppColors.mediumBlue,
                ),
                const SizedBox(height: 10.0),
                InfoRow(
                  label: 'Notes',
                  value: notes,
                  widthFactor: screenWidth / 8.9,
                  backgroundColor: AppColors.mediumBlue,
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InfoHeader(label: 'Package Information'),
                const SizedBox(height: 20.0),
                InfoRow(
                  label: 'Num Of Packages',
                  value: numOfPackages,
                  widthFactor: screenWidth / 20,
                  backgroundColor: AppColors.darkBlue,
                  textColor: AppColors.pureWhite,
                ),
                const SizedBox(height: 10.0),
                InfoRow(
                  label: 'Content',
                  value: content,
                  widthFactor: screenWidth / 4.2,
                  backgroundColor: AppColors.darkBlue,
                  textColor: AppColors.pureWhite,
                ),
                const SizedBox(height: 10.0),
                InfoRow(
                  label: 'Weight',
                  value: weight,
                  widthFactor: screenWidth / 3.85,
                  backgroundColor: AppColors.yellow,
                  textColor: AppColors.pureBlack,
                ),
                const SizedBox(height: 10.0),
                InfoRow(
                  label: 'Marks',
                  value: marks,
                  widthFactor: screenWidth / 3.7,
                  backgroundColor: AppColors.darkBlue,
                  textColor: AppColors.pureWhite,
                ),
                const SizedBox(height: 10.0),
                InfoRow(
                  label: 'Size',
                  value: size,
                  widthFactor: screenWidth / 3.23,
                  backgroundColor: AppColors.yellow,
                  textColor: AppColors.pureBlack,
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InfoHeader(label: 'Costs'),
                
                const SizedBox(height: 10.0),
                const CostHeaderRow(),
                const SizedBox(height: 10.0),
                CostDetailRow(
                  label: 'Shipping Costs',
                  prepaidValue: prePaid.isNotEmpty ? prePaid : null,
                  collectionValue: shippingCost,
                ),
                const SizedBox(height: 10.0),
                CostDetailRow(
                  label: 'Against Shipping',
                  prepaidValue: againstShipping.isNotEmpty ? againstShipping : null,
                  collectionValue: againstShipping,
                ),
                const SizedBox(height: 10.0),
                CostDetailRow(
                  label: 'Miscellaneous \\ Adapter',
                  collectionValue: miscllaneous,
                ),
                const SizedBox(height: 10.0),
                CostDetailRow(
                  label: 'Discount',
                  collectionValue: discount,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
