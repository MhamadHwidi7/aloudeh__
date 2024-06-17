
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/employee/data/params/delete_customer_params.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/delete_customer_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_customers_paginated_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DeleteCustomerButton extends StatelessWidget {
  final int customerId;
  final String customerName;
  const DeleteCustomerButton({super.key, required this.customerId, required this.customerName});

  void _deleteCustomer(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) {
        return BlocConsumer<DeleteCustomerCubit, PostState<BaseEntity>>(
          listener: (ctx, state) {
            state.whenOrNull(
              success: (data) {

                print("Customer deleted successfully");
                                context.read<GetAllCustomersEmployeePaginatedCubit>().emitGetAllCustomers();
                                                Navigator.pop(context);

                // context.read<GetAllCustomersEmployeePaginatedCubit>().removeCustomer(customerId);
                print("Refresh customers list called");
                                                Navigator.pop(context);

              },
              error: (error) {
                Fluttertoast.showToast(
                  msg: "Failed to delete customer",
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
            );
          },
          builder: (context, state) {
            return CupertinoAlertDialog(
              title: Text(
                "Delete Customer",
                style: TextStyle(
                  fontFamily: 'Bahnschrift',
                  color: AppColors.darkBlue,
                  fontSize: 16.sp,
                ),
              ),
              content: Text(
                "Do you want to delete $customerName?",
                style: TextStyle(
                  fontFamily: 'Bahnschrift',
                  color: AppColors.darkBlue,
                  fontSize: 14.sp,
                ),
              ),
              actions: [
                CupertinoDialogAction(
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontFamily: 'Bahnschrift',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    print("Delete customer button pressed");
                    context.read<DeleteCustomerCubit>().emitDeleteCustomer(
                      deleteCustomerParams: DeleteCustomerParams(customerId: customerId),
                    );
                  },
                ),
                CupertinoDialogAction(
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontFamily: 'Bahnschrift',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 40.h,
      child: FloatingActionButton(
        onPressed: () {
          _deleteCustomer(context);
        },
        elevation: 0.0,
        heroTag: 'dc',
        backgroundColor: AppColors.darkBlue,
        child: const Icon(
          Icons.delete,
          color: AppColors.yellow,
        ),
      ),
    );
  }
}
