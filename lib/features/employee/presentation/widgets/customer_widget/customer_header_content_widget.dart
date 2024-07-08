import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/add_customer_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/add_customer_button_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/customer_widget/customer_list_view_paginated_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomersListScreenContent extends StatelessWidget {
  const CustomersListScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: CustomersListTitle(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: AppColors.darkBlue,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Divider(color: AppColors.darkBlue, height: 1.h),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight / 75),
          const CustomersListIntroText(),
          _dividerWithSpacing(screenHeight),
          const CustomersSearchField(),
          _dividerWithSpacing(screenHeight),
          const Expanded(
            child: CustomersListViewPaginatedWidget(),
          ),
          AddCustomerButtonWidget(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => AddCustomerScreen()));
          }),
        ],
      ),
    );
  }

  Widget _dividerWithSpacing(double screenHeight) {
    return Column(
      children: [
        SizedBox(height: screenHeight / 75),
        Divider(color: AppColors.darkBlue, height: 1.h),
        SizedBox(height: screenHeight / 75),
      ],
    );
  }
}


class CustomersListIntroText extends StatelessWidget {
  const CustomersListIntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello!',
            style: _textStyle(AppColors.yellow, FontWeight.bold),
          ),
          Text(
            'Here We will show Our Customers List',
            style: _textStyle(AppColors.darkBlue, FontWeight.bold),
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle(Color color, FontWeight fontWeight) {
    return TextStyle(
      color: color,
      fontFamily: 'Bahnschrift',
      fontSize: 16.sp,
      fontWeight: fontWeight,
    );
  }
}

class CustomersSearchField extends StatelessWidget {
  const CustomersSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        cursorColor: AppColors.darkBlue,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: AppColors.lightBlue,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColors.darkBlue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColors.darkBlue),
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.darkBlue),
          hintText: 'Search',
          hintStyle: const TextStyle(
            color: AppColors.darkBlue,
            fontFamily: 'Bahnschrift',
          ),
        ),
      ),
    );
  }
}

class CustomersListTitle extends StatelessWidget {
  const CustomersListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Custo',
            style: _titleTextStyle(AppColors.yellow),
          ),
          TextSpan(
            text: 'mers ',
            style: _titleTextStyle(AppColors.darkBlue),
          ),
          TextSpan(
            text: 'Li',
            style: _titleTextStyle(AppColors.darkBlue),
          ),
          TextSpan(
            text: 'st',
            style: _titleTextStyle(AppColors.yellow),
          ),
        ],
      ),
    );
  }

  TextStyle _titleTextStyle(Color color) {
    return TextStyle(
      fontSize: 23.sp,
      fontFamily: 'ScriptMT',
      color: color,
    );
  }
}