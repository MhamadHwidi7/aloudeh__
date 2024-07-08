
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/branch_widgets/branch_list_header_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/branch_widgets/branch_list_view_paginated_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowAllBranchesScreen extends StatefulWidget {
  const ShowAllBranchesScreen({super.key});

  @override
  State<ShowAllBranchesScreen> createState() => _ShowAllBranchesScreenState();
}

class _ShowAllBranchesScreenState extends State<ShowAllBranchesScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.darkBlue,
        body: Stack(
          children: [
            Container(
              height: screenHeight,
              decoration: BoxDecoration(
                color: AppColors.pureWhite,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(400.r),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BranchesListHeader(),
                  Expanded(child: BranchesListViewPaginatedWidget()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

