
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/branch_widgets/branch_details_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BranchItemTileWidget extends StatelessWidget {
  final String branchName;
  final int branchId;

  const BranchItemTileWidget({super.key, required this.branchName, required this.branchId});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.h,
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            branchName,
            style: TextStyle(
              color: AppColors.yellow,
              fontFamily: 'bahnschrift',
              fontSize: 18.sp,
            ),
          ),
          SizedBox(width: 20.w,),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>ViewBranchInformationScreen(branchId:branchId)));
            },
            icon: const Icon(
              Icons.directions,
              color: AppColors.darkBlue,
            ),
          ),
        ],
      ),
    );
  }
}
