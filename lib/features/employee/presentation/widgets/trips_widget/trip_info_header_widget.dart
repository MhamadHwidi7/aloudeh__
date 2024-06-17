
import 'dart:ui';

import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/logo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripInfoHeader extends StatelessWidget {
  final String manifestId;

  const TripInfoHeader({super.key, required this.manifestId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Manifest $manifestId',
              style: TextStyle(
                  color: AppColors.pureBlack,
                  fontFamily: 'bahnschrift',
                  fontSize: 18.sp),
            ),
          ),
          const LogoWidget(),
        ],
      ),
    );
  }
}
