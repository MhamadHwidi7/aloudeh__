
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback? onTap;

  const TripDetailRow(
      {super.key, required this.label, required this.value, this.onTap});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Row(
        children: [
          SizedBox(
            width: 85.w,
            child: Text(label,
                style: TextStyle(
                    fontFamily: 'bahnschrift',
                    color: AppColors.darkBlue,
                    fontSize: 16.sp)),
          ),
          SizedBox(width: screenWidth / 7),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                 decoration: BoxDecoration(
                color: AppColors.mediumBlue,
                borderRadius: BorderRadius.circular(10.0),
              ),
                height: 40.h,
                child: Center(
                  child: Text(value,
                      style: TextStyle(
                          fontFamily: 'bahnschrift', fontSize: 16.sp)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
