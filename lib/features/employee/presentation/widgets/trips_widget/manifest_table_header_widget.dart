
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManifestTableHeader extends StatelessWidget {
  const ManifestTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HeaderItem(label: '#'),
          HeaderItem(label: 'Receipt'),
          HeaderItem(label: 'Source'),
          HeaderItem(label: 'Type'),
          HeaderItem(label: 'Quantity'),
          HeaderItem(label: 'Sender'),
          HeaderItem(label: 'Consignee'),
          HeaderItem(label: 'Against Shipping'),
          HeaderItem(label: 'Miscellaneous'),
          HeaderItem(label: 'Prepaid'),
          HeaderItem(label: 'Discount'),
          HeaderItem(label: 'Collection'),
          HeaderItem(label: 'Adapter'),
          HeaderItem(label: ''),
        ],
      ),
    );
  }
}

class HeaderItem extends StatelessWidget {
  final String label;

  const HeaderItem({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        label,
        style: TextStyle(
            color: AppColors.yellow,
            fontFamily: 'bahnschrift',
            fontWeight: FontWeight.bold,
            fontSize: 17.sp),
      ),
    );
  }
}
