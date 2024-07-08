
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final double widthFactor;
  final Color backgroundColor;
  final Color textColor;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    required this.widthFactor,
    required this.backgroundColor,
    this.textColor = AppColors.pureBlack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
              fontFamily: 'bahnschrift',
              color: AppColors.pureBlack,
              fontSize: 16.sp),
        ),
        SizedBox(width: widthFactor),
        Expanded(
          child: Container(
            height: 40.h,
             decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
            child: Center(
              child: Text(
                value,
                style: TextStyle(
                    fontFamily: 'bahnschrift',
                    color: textColor,
                    fontSize: 16.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
class InfoColumn extends StatelessWidget {
  final String label;
  final String value;
  final Color backgroundColor;
  final Color textColor;

  const InfoColumn({
    super.key,
    required this.label,
    required this.value,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
              fontFamily: 'bahnschrift',
              color: AppColors.pureBlack,
              fontSize: 16.sp),
        ),
        Container(
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: backgroundColor,
          ),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                  fontFamily: 'bahnschrift', color: textColor, fontSize: 16.sp),
            ),
          ),
        ),
      ],
    );
  }
}

class InfoHeader extends StatelessWidget {
  final String label;

  const InfoHeader({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontFamily: 'bahnschrift',
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: AppColors.pureBlack,
      ),
    );
  }
}

class CostHeaderRow extends StatelessWidget {
  const CostHeaderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: Container()),
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              'Prepaid',
              style: const TextStyle(
                fontFamily: 'bahnschrift',
                color: AppColors.darkBlue,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              'Collection',
              style: const TextStyle(
                fontFamily: 'bahnschrift',
                color: AppColors.darkBlue,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CostDetailRow extends StatelessWidget {
  final String label;
  final String? prepaidValue;
  final String collectionValue;

  const CostDetailRow({
    super.key,
    required this.label,
    this.prepaidValue,
    required this.collectionValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'bahnschrift',
              color: AppColors.pureBlack,
              fontSize: 16.0,
            ),
          ),
        ),
        if (prepaidValue != null)
          Expanded(
            flex: 1,
            child: CostContainer(value: prepaidValue!),
          ),
        if (prepaidValue != null)
          const SizedBox(width: 10.0),
        Expanded(
          flex: 1,
          child: CostContainer(value: collectionValue),
        ),
      ],
    );
  }
}

class CostContainer extends StatelessWidget {
  final String value;

  const CostContainer({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      // elevation: 1.0,
      child: Container(
        height: 35.0,
        decoration: BoxDecoration(
          color: AppColors.mediumBlue,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(
              fontFamily: 'bahnschrift',
              color: AppColors.darkBlue,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
