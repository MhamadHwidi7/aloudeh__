
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/add_customer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
class DividerSpaceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
    );
  }
}

class EditTripScreen extends StatefulWidget {
  @override
  _EditTripScreenState createState() => _EditTripScreenState();
}

class _EditTripScreenState extends State<EditTripScreen> {
  String manifest = 'DM-1-7017';
  String tripDate = "17/05/2023";
  String status = "Temporary";
  String destination = 'Lattakia';

  late TextEditingController manifestController;
  late TextEditingController statusController;
  late TextEditingController destinationController;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    manifestController = TextEditingController(text: manifest);
    statusController = TextEditingController(text: status);
    destinationController = TextEditingController(text: destination);
    selectedDate = DateTime.now();
  }

  @override
  void dispose() {
    manifestController.dispose();
    statusController.dispose();
    destinationController.dispose();
    super.dispose();
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2018),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        tripDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: TripInformationText(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left,
            color: AppColors.darkBlue,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: DividerItem(),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              SpaceItem(),
              HelloEnterNewInformationText(),
              DividerSpaceItem(),
              InformationInEditTripScreen(),
              DividerSpaceItem(),
              SpaceItem(),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SaveButtonInEditTripScreen(),
          ),
        ],
      ),
    );
  }
  Widget HelloEnterNewInformationText() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello!',
              style: TextStyle(
                color: AppColors.yellow,
                fontFamily: 'bahnschrift',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Please Enter The Following Information',
              style: TextStyle(
                color: AppColors.darkBlue,
                fontFamily: 'bahnschrift',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );

  Widget InformationInEditTripScreen() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Information',
              style: TextStyle(
                color: AppColors.yellow,
                fontSize: 17.sp,
                fontFamily: 'bahnschrift',
              ),
            ),
            SpaceItem(),
            Row(
              children: [
                Text(
                  'Manifest',
                  style: TextStyle(
                    fontFamily: 'bahnschrift',
                    color: AppColors.darkBlue,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Container(
                    height: 40.h,
                    color: AppColors.darkBlue,
                    child: Center(
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: manifestController,
                        style: TextStyle(
                          
                          fontFamily: 'bahnschrift',
                          fontSize: 16.sp,
                          color: AppColors.pureWhite,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SpaceItem(),
            Row(
              children: [
                Text(
                  'Status',
                  style: TextStyle(
                    fontFamily: 'bahnschrift',
                    color: AppColors.darkBlue,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Container(
                    height: 40.h,
                    color: AppColors.yellow,
                    child: Center(
                      child: TextField(                        textAlign: TextAlign.center,

                        controller: statusController,
                        style: TextStyle(
                          fontFamily: 'bahnschrift',
                          fontSize: 16.sp,
                          color: AppColors.pureBlack,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SpaceItem(),
            Row(
              children: [
                Text(
                  'Date',
                  style: TextStyle(
                    fontFamily: 'bahnschrift',
                    color: AppColors.darkBlue,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      height: 40.h,
                      color: AppColors.mediumBlue,
                      child: Center(
                        child: Text(
                          tripDate,
                          style: TextStyle(
                            fontFamily: 'bahnschrift',
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SpaceItem(),
            Row(
              children: [
                Text(
                  'Destination',
                  style: TextStyle(
                    fontFamily: 'bahnschrift',
                    color: AppColors.darkBlue,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Container(
                    height: 40.h,
                    color: AppColors.mediumBlue,
                    child: Center(
                      child: TextField(                        textAlign: TextAlign.center,

                        controller: destinationController,
                        style: TextStyle(
                          fontFamily: 'bahnschrift',
                          fontSize: 16.sp,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget DriverTruckInEditTripScreen() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Driver & Truck',
              style: TextStyle(
                color: AppColors.yellow,
                fontSize: 17.sp,
                fontFamily: 'bahnschrift',
              ),
            ),
            SpaceItem(),
            Row(
              children: [
                Text(
                  'Driver',
                  style: TextStyle(
                    fontFamily: 'bahnschrift',
                    color: AppColors.darkBlue,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Container(
                    height: 40.h,
                    color: AppColors.darkBlue,
                    child: Center(
                      child: Text(
                        'Mohammed Hwaidi',
                        style: TextStyle(
                          fontFamily: 'bahnschrift',
                          fontSize: 16.sp,
                          color: AppColors.pureWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SpaceItem(),
            Row(
              children: [
                Text(
                  'Truck',
                  style: TextStyle(
                    fontFamily: 'bahnschrift',
                    color: AppColors.darkBlue,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Container(
                    height: 40.h,
                    color: AppColors.yellow,
                    child: Center(
                      child: Text(
                        'Aleppo-123456',
                        style: TextStyle(
                          fontFamily: 'bahnschrift',
                          fontSize: 16.sp,
                          color: AppColors.pureBlack,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );


  Widget SaveButtonInEditTripScreen() => Container(
        width: double.infinity,
        child: FloatingActionButton(
          onPressed: () {
            // Implement save functionality here
          },
          child: Text(
            'Save',
            style: TextStyle(
              fontFamily: 'bahnschrift',
              fontWeight: FontWeight.bold,
              fontSize: 17.0.sp,
              color: AppColors.mediumBlue,
            ),
          ),
          backgroundColor: AppColors.darkBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(37.r),
              topLeft: Radius.circular(37.r),
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(37.r),
          color: AppColors.darkBlue,
        ),
      );
}

class TripInformationText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Tri',
            style: TextStyle(
              fontSize: 23.sp,
              fontFamily: 'ScriptMT',
              color: AppColors.yellow,
            ),
          ),
          TextSpan(
            text: 'p Inform',
            style: TextStyle(
              fontSize: 23.sp,
              fontFamily: 'ScriptMT',
              color: AppColors.darkBlue,
            ),
          ),
          TextSpan(
            text: 'ation',
            style: TextStyle(
              fontSize: 23.sp,
              fontFamily: 'ScriptMT',
              color: AppColors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}

class SpaceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight / 50,
    );
  }
}
