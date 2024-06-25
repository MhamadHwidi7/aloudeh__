import 'package:aloudeh_company/features/employee/presentation/screens/edit_trip_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_branch_by_id_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/get_branch_by_id_params.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_branch_by_id_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/trip_list_screen.dart';

class ViewBranchInformationScreen extends StatefulWidget {
  final int branchId;
  const ViewBranchInformationScreen({super.key, required this.branchId});

  @override
  State<ViewBranchInformationScreen> createState() => _ViewBranchInformationScreenState();
}

class _ViewBranchInformationScreenState extends State<ViewBranchInformationScreen> {
  @override
  void initState() {
    super.initState();
    _fetchBranchInformation();
  }

  void _fetchBranchInformation() {
    context.read<GetBranchByIdEmployeeCubit>().emitGetBranchById(
      getBranchByIdParams: GetBranchByIdParams(branchId: widget.branchId.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocConsumer<GetBranchByIdEmployeeCubit, GetState<GetBranchByIdEntity>>(
        listener: (context, state) {
          state.whenOrNull(
            error: (networkExceptions) => _showErrorToast(networkExceptions),
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: Text("No data available")),
            loading: () => const Center(child: CupertinoActivityIndicator()),
            success: (data) => _buildBranchInformationContent(data),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Align(
        alignment: Alignment.centerRight,
        child: BranchInformationText(),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.chevron_left,
          color: AppColors.darkBlue,
        ),
      ),
      bottom:  PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(
      color: AppColors.darkBlue,
      height: 1.0,
    ),
      ),
    );
  }

  void _showErrorToast(NetworkExceptions networkExceptions) {
    Fluttertoast.showToast(
      msg: NetworkExceptions.getErrorMessage(networkExceptions),
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  Widget _buildBranchInformationContent(GetBranchByIdEntity data) {
        double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
SizedBox(
      height: screenHeight / 50,
    ),        BranchInformationForEmployee(data: data),
SizedBox(
      height: screenHeight / 50,
    ),        if(data.data.trips.isNotEmpty)
        _buildHeaderRow(),
SizedBox(
      height: screenHeight / 50,
    ),         if(data.data.trips.isNotEmpty)
        Expanded(child: _buildTripsTable(data)),
      ],
    );
  }

  Widget _buildHeaderRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w),
      child: Row(
        children: [
          _buildHeaderCell('Trip'),
          _buildHeaderCell('Driver'),
          _buildHeaderCell('Date'),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String text) {
    return Expanded(
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.yellow,
          fontFamily: 'bahnschrift',
          fontWeight: FontWeight.bold,
          fontSize: 17.sp,
        ),
      ),
    );
  }

 Widget _buildTripsTable(GetBranchByIdEntity getBranchByIdEntity) {
      double screenHeight = MediaQuery.of(context).size.height;

  if (getBranchByIdEntity.data.trips.isEmpty) {
    return const SizedBox();
  }

  return ListView.separated(
    itemBuilder: (context, index) {
      final trip = getBranchByIdEntity.data.trips[index];
      return _buildRowTableItem(trip);
    },
    separatorBuilder: (context, index) =>  SizedBox(
      height: screenHeight / 50,
    ),
    itemCount: getBranchByIdEntity.data.trips.length,
  );
}

  Widget _buildRowTableItem(Trip trip) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        margin: EdgeInsets.symmetric(horizontal: 20.0.w),
        decoration: BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.r),
            topRight: Radius.circular(50.r),
          ),
        ),
        child: Row(
          children: [
            _buildRowCell(trip.number),
            _buildRowCell(trip.driverName),
            _buildRowCell(trip.date),
          ],
        ),
      ),
    );
  }

  Widget _buildRowCell(String text) {
    return Expanded(
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.pureWhite,
          fontFamily: 'bahnschrift',
          fontSize: 16.sp,
        ),
      ),
    );
  }
}

class BranchInformationText extends StatelessWidget {
  const BranchInformationText();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Bra',
            style: TextStyle(
              fontSize: 23.sp,
              fontFamily: 'ScriptMT',
              color: AppColors.yellow,
            ),
          ),
          TextSpan(
            text: 'nch Inform',
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

class BranchInformationForEmployee extends StatelessWidget {
  final GetBranchByIdEntity data;

  const BranchInformationForEmployee({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
        double screenHeight = MediaQuery.of(context).size.height;

    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _buildInfoRow('Desk', data.data.desk, screenWidth / 9),
SizedBox(
      height: screenHeight / 50,
    ),          _buildInfoRow('Address', data.data.address, screenWidth / 25),
SizedBox(
      height: screenHeight / 50,
    ),          _buildInfoRow('Mobile', data.data.phone.toString(), screenWidth / 13),
SizedBox(
      height: screenHeight / 50,
    ),          _buildDoubleTextRow('Opening', 'Date', data.data.openingDate, screenWidth / 20),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, double spacing) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'bahnschrift',
            color: AppColors.darkBlue,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(width: spacing),
        Expanded(
          child: Container(
            height: 40.h,
            color: AppColors.mediumBlue,
            child: Center(
              child: Text(
                value,
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

  Widget _buildDoubleTextRow(String label1, String label2, String value, double spacing) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              label1,
              style: TextStyle(
                fontFamily: 'bahnschrift',
                color: AppColors.darkBlue,
                fontSize: 16.sp,
              ),
            ),
            Text(
              label2,
              style: TextStyle(
                fontFamily: 'bahnschrift',
                color: AppColors.darkBlue,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        SizedBox(width: spacing),
        Expanded(
          child: Container(
            height: 40.h,
            color: AppColors.mediumBlue,
            child: Center(
              child: Text(
                value,
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
}
