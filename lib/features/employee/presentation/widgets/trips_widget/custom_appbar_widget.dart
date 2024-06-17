import 'dart:ui';

import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackPress;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onBackPress,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Align(
        alignment: Alignment.centerRight,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 23.sp,
            fontFamily: 'ScriptMT',
            color: AppColors.yellow,
          ),
        ),
      ),
      leading: IconButton(
        onPressed: onBackPress,
        icon: const Icon(Icons.chevron_left, color: AppColors.darkBlue),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: const Divider(color: AppColors.darkBlue),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1.0);
}
