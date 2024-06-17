import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/employee/data/entity/customer_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/update_customer_params.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_customers_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/update_customer_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SaveButton extends StatelessWidget {
  final TextEditingController customerIdController;
  final TextEditingController customerNameController;
  final TextEditingController customerPhoneController;
  final TextEditingController customerMobileController;
  final TextEditingController customerAddressController;
  final TextEditingController customerAddressDetailsController;
  final TextEditingController customerNotesController;
  final int customerId;
  final CustomerEmployeeEntity initialData;

  const SaveButton({
    Key? key,
    required this.customerIdController,
    required this.customerNameController,
    required this.customerPhoneController,
    required this.customerMobileController,
    required this.customerAddressController,
    required this.customerAddressDetailsController,
    required this.customerNotesController,
    required this.customerId,
    required this.initialData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateCustomerCubit, PostState<BaseEntity>>(
      listener: (context, state) {
        state.whenOrNull(
          success: (data) {
            context.read<GetAllCustomersEmployeePaginatedCubit>().emitGetAllCustomers();
            Navigator.pop(context);
                        Navigator.pop(context);

            Fluttertoast.showToast(
              msg: data.message,
              toastLength: Toast.LENGTH_SHORT,
            );
          },
          error: (error) {
            Fluttertoast.showToast(
              msg: NetworkExceptions.getErrorMessage(error),
              toastLength: Toast.LENGTH_SHORT,
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => _buildSaveButton(context),
          loading: () => const CupertinoActivityIndicator(),
          idle: () => _buildSaveButton(context),
        );
      },
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(37.r),
        color: AppColors.darkBlue,
      ),
      child: FloatingActionButton(
        onPressed: () {
          final updateParams = _constructUpdateParams();
          if (updateParams.toJson().length > 1) {
            context.read<UpdateCustomerCubit>().emitUpdateCustomer(
              updateCustomerParams: updateParams,
            );
          }
        },
        backgroundColor: AppColors.darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(37.r),
            topLeft: Radius.circular(37.r),
          ),
        ),
        child: Text(
          'Save',
          style: TextStyle(
            fontFamily: 'bahnschrift',
            fontWeight: FontWeight.bold,
            fontSize: 17.0.sp,
            color: AppColors.mediumBlue,
          ),
        ),
      ),
    );
  }

  UpdateCustomerParams _constructUpdateParams() {
    final params = UpdateCustomerParams(customerId: customerId.toString());

    if (customerIdController.text != initialData.data.nationalId) {
      params.nationalId = customerIdController.text;
    }
    if (customerNameController.text != initialData.data.name) {
      params.name = customerNameController.text;
    }
    if (customerPhoneController.text != initialData.data.phoneNumber.toString()) {
      params.phoneNumber = customerPhoneController.text;
    }
    if (customerMobileController.text != initialData.data.mobile.toString()) {
      params.mobile = customerMobileController.text;
    }
    if (customerAddressController.text != initialData.data.address) {
      params.address = customerAddressController.text;
    }
    if (customerAddressDetailsController.text != initialData.data.addressDetail) {
      params.addressDetail = customerAddressDetailsController.text;
    }
    if (customerNotesController.text != initialData.data.notes) {
      params.notes = customerNotesController.text;
    }

    return params;
  }
}
