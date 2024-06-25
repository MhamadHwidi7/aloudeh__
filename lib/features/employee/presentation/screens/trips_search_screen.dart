
// Search screen for trips
import 'dart:ui';

import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/trip_list_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/sizing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TripsSearchScreen extends StatefulWidget {
  @override
  _TripsSearchScreenState createState() => _TripsSearchScreenState();
}

class _TripsSearchScreenState extends State<TripsSearchScreen> {
  var tripIdController = TextEditingController();
  var deskController = TextEditingController();
  var destinationController = TextEditingController();
  var tripStatus = ["temporary", "locked", ""];
  var selectedStatus = "";
  DateTime selectedDateFrom = DateTime.now();
  DateTime selectedDateTo = DateTime.now();
  var dateFrom = '';
  var dateTo = '';
  bool showDate = false;

  void datePicker(BuildContext context, bool isFrom) {
    showDatePicker(
      context: context,
      initialDate: isFrom ? selectedDateFrom : selectedDateTo,
      firstDate: DateTime(2018),
      lastDate: DateTime(2100),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        if (isFrom) {
          selectedDateFrom = value;
          dateFrom = DateFormat('yyyy-MM-dd').format(selectedDateFrom);
        } else {
          selectedDateTo = value;
          dateTo = DateFormat('yyyy-MM-dd').format(selectedDateTo);
        }
        showDate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            buildTextField('Trip ID', tripIdController),
            SpaceItem(),
            buildTextField('Desk', deskController),
            SpaceItem(),
            buildTextField('Destination', destinationController),
            SpaceItem(),
            buildDateField('Date From', context, true),
            SpaceItem(),
            buildDateField('Date To', context, false),
            SpaceItem(),
            buildDropdownField('Trip Status', tripStatus),
            SpaceItem(),
            SearchButton(),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'bahnschrift',
            color: AppColors.darkBlue,
            fontSize: 17.0.sp,
          ),
        ),
        TextFormField(
          controller: controller,
          cursorColor: AppColors.darkBlue,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: AppColors.mediumBlue,
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }

  Widget buildDateField(String label, BuildContext context, bool isFrom) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'bahnschrift',
            color: AppColors.darkBlue,
            fontSize: 17.0.sp,
          ),
        ),
        GestureDetector(
          onTap: () {
            datePicker(context, isFrom);
          },
          child: Container(
            height: 40.h,
            color: AppColors.mediumBlue,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: showDate
                  ? Text(
                      isFrom ? dateFrom : dateTo,
                      style: TextStyle(
                        fontFamily: 'bahnschrift',
                        fontSize: 16.sp,
                      ),
                    )
                  : Text(
                      isFrom ? 'Select Date' : 'Select Date',
                      style: TextStyle(
                        fontFamily: 'bahnschrift',
                        fontSize: 16.sp,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDropdownField(String label, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'bahnschrift',
            color: AppColors.darkBlue,
            fontSize: 17.0.sp,
          ),
        ),
        Container(
          color: AppColors.mediumBlue,
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              borderRadius: BorderRadius.circular(10.0),
              dropdownColor: AppColors.pureWhite,
              iconEnabledColor: AppColors.darkBlue,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (tripStatus) {
                setState(() {
                  selectedStatus = tripStatus.toString();
                });
              },
              value: selectedStatus,
            ),
          ),
        ),
      ],
    );
  }

  Widget SearchButton() => Container(
        height: 40.h,
        width: double.infinity,
        child: FloatingActionButton(
          onPressed: () {},
          child: Text(
            'Search',
            style: TextStyle(
              fontFamily: 'bahnschrift',
              fontWeight: FontWeight.bold,
              fontSize: 17.0.sp,
              color: AppColors.mediumBlue,
            ),
          ),
          backgroundColor: AppColors.darkBlue,
          heroTag: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: AppColors.darkBlue,
        ),
      );
}
