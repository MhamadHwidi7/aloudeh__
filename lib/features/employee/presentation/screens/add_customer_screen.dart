import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/employee/data/params/add_customer_params.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/add_customer_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_customers_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/getx/add_customer_text_editing_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class AddCustomerScreen extends StatelessWidget {
  final AddCustomerTextEditingController controller = Get.put(AddCustomerTextEditingController());

   AddCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight / 75),
            _buildIntroText(),
            Divider(),
            Expanded(
              child: ListView(
                children: [
                  _buildTextFieldRow('ID', controller.customerIdController, screenWidth / 7, controller.validateCustomerNationalId),
                  Divider(),
                  _buildTextFieldRow('Name', controller.customerNameController, screenWidth / 14.3, controller.validateCustomerName),
                  Divider(),
                  _buildTextFieldRow('Phone', controller.customerPhoneController, screenWidth / 17, controller.validateCustomerPhone),
                  Divider(),
                  _buildTextFieldRow('Mobile', controller.customerMobileController, screenWidth / 19, controller.validateCustomerMobile),
                  Divider(),
                  _buildTextFieldRow('Address', controller.customerAddressController, screenWidth / 60, controller.validateCustomerAddress),
                  Divider(),
                  _buildTextFieldRow('Address Details', controller.customerAddressDetailsController, screenWidth / 60, controller.validateCustomerAddressDetails),
                  Divider(),
                  _buildGenderDropdown(),
                  Divider(),
                  _buildNotesField(screenHeight),
                  SizedBox(height: screenHeight / 75),
                ],
              ),
            ),
            _buildAddCustomerButton(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Add Customer',
          style: TextStyle(
            fontFamily: 'bahnschrift',
            color: AppColors.darkBlue,
          ),
        ),
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
        child: Divider(),
      ),
    );
  }

  Widget _buildIntroText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(
            image: AssetImage('assets/images/Logo2.png'),
            width: 33.w,
            height: 34.h,
          ),
          Text(
            'Please Enter The New Information',
            style: TextStyle(
              color: AppColors.darkBlue,
              fontFamily: 'bahnschrift',
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image(
            image: AssetImage('assets/images/Logo2.png'),
            width: 33.w,
            height: 34.h,
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldRow(String label, TextEditingController controller, double spacing, String? Function(String?)? validator) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
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
              decoration: BoxDecoration(
                color: AppColors.mediumBlue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextFormField(
                controller: controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                style: TextStyle(
                  fontFamily: 'bahnschrift',
                  fontSize: 16.sp,
                ),
                validator: validator,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Text(
            'Gender',
            style: TextStyle(
              fontFamily: 'bahnschrift',
              color: AppColors.darkBlue,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.mediumBlue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: DropdownButtonFormField<String>(
                value: controller.customerGenderController.text.isEmpty ? null : controller.customerGenderController.text,
                items: ['male', 'female'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  controller.customerGenderController.text = newValue!;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                style: TextStyle(
                  fontFamily: 'bahnschrift',
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesField(double screenHeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notes',
            style: TextStyle(
              fontFamily: 'bahnschrift',
              color: AppColors.darkBlue,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: screenHeight / 110),
          Container(
            height: 100.h,
            decoration: BoxDecoration(
              color: AppColors.mediumBlue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              controller: controller.customerNotesController,
              textAlign: TextAlign.center,
              maxLines: 5,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
              style: TextStyle(
                fontFamily: 'bahnschrift',
                fontSize: 16.sp,
              ),
              validator: (value) => controller.validateCustomerNotes(value),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddCustomerButton() {
    return BlocConsumer<AddCustomerCubit, PostState<BaseEntity>>(
      listener: (ctx, state) {
        state.whenOrNull(
          success: (data) {
            ctx.read<GetAllCustomersEmployeePaginatedCubit>().emitGetAllCustomers();
            Navigator.pop(ctx);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => _buildAddButton(context),
          loading: () => const CupertinoActivityIndicator(),
        );
      },
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FloatingActionButton(
        onPressed: () {
          if (controller.validateForm()) {
            final notes = controller.customerNotesController.text.isEmpty ? null : controller.customerNotesController.text;
            context.read<AddCustomerCubit>().emitAddCustomer(
              addCustomerParams: AddCustomerParams(
                nationalId: controller.customerIdController.text,
                name: controller.customerNameController.text,
                phoneNumber: controller.customerPhoneController.text,
                gender: controller.customerGenderController.text,
                mobile: controller.customerMobileController.text,
                address: controller.customerAddressController.text,
                addressDetail: controller.customerAddressDetailsController.text,
                notes: notes,
              ),
            );
          }
        },
        child: Text(
          'Add Customer',
          style: TextStyle(
            fontFamily: 'bahnschrift',
            fontWeight: FontWeight.bold,
            fontSize: 17.0.sp,
            color: AppColors.mediumBlue,
          ),
        ),
        backgroundColor: AppColors.darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(37.r),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(37.r),
        color: AppColors.darkBlue,
      ),
    );
  }
}