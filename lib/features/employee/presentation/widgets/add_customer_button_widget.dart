import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCustomerButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const AddCustomerButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: _buttonDecoration(),
      child: FloatingActionButton(
        onPressed:onPressed,
        backgroundColor: AppColors.darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(37.r),
            topLeft: Radius.circular(37.r),
          ),
        ),
        child: Text(
          'Add Customer',
          style: _buttonTextStyle(),
        ),
      ),
    );
  }

  BoxDecoration _buttonDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(37.r),
      color: AppColors.darkBlue,
    );
  }

  TextStyle _buttonTextStyle() {
    return TextStyle(
      fontFamily: 'Bahnschrift',
      fontWeight: FontWeight.bold,
      fontSize: 17.0.sp,
      color: AppColors.mediumBlue,
    );
  }
}
