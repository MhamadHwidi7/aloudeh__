
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage('assets/images/Logo2.png'),
      width: 39.w,
      height: 40.h,
    );
  }
}