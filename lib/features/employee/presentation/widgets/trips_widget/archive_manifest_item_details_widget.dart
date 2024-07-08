
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/archive_trip_invoice_screen.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_manifest_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArchivedManifestItem extends StatelessWidget {
  final ShippingData data;
  const ArchivedManifestItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
           ManifestItemDetail(value: data.id.toString()),
          // const ManifestItemDetail(value: '5478'),
           ManifestItemDetail(value: data.sourceName),
           ManifestItemDetail(value: data.content),
           ManifestItemDetail(value: data.numOfPackages.toString()),
           ManifestItemDetail(value: data.sender),
           ManifestItemDetail(value: data.receiver),
           ManifestItemDetail(value: data.againstShipping ?? " - "),
           ManifestItemDetail(value:data.miscellaneous ?? " - "),
           ManifestItemDetail(value: data.prepaid ?? " - "),
           ManifestItemDetail(value: data.discount ?? " - "),
           ManifestItemDetail(value: data.collection ?? " - "),
           ManifestItemDetail(value: data.adapter ?? " - "),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                           ArchiveTripInvoiceScreen(   destinationId: data.destinationId.toString(),
                    sourceName: data.sourceName,
                    prePaid: data.prepaid ?? " - ",
                    destionationName: data.destinationName,
                    size:data.size,
                    senderName: data.sender,
                    receiverName: data.receiver,
                    notes: data.notes ?? " - ",
                    numOfPackages: data.numOfPackages?.toString() ?? " - ",
                    // type: data.type,
                    content: data.content,
                    weight: data.weight.toString(),
                    marks: data.marks,
                    discount: data.discount ?? " - ",
                    shippingCost: data.shippingCost,
                    againstShipping: data.againstShipping ?? " - ",
                    adaptar: data.adapter ??  " - ",
                    miscllaneous: data.miscellaneous ??  " - ",
                    // quantity: data.quantity,
                    )));
            },
            icon: const Icon(Icons.remove_red_eye, color: AppColors.darkBlue),
          ),
        ],
      ),
    );
  }
}



class ManifestItemDetail extends StatelessWidget {
  final String value;

  const ManifestItemDetail({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        value,
        style: TextStyle(
            color: AppColors.pureBlack,
            fontFamily: 'bahnschrift',
            fontSize: 16.sp),
      ),
    );
  }
}