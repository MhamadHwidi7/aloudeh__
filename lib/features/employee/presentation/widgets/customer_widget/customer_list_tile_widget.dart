
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/employee/data/params/delete_customer_params.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/delete_customer_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_customers_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/customer_information_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

//!Note:that is the tile into the list view paginated
class CustomerListTileWidget extends StatelessWidget {
  final String customerName;
  final String customerAddress;
  final int customerId;

  const CustomerListTileWidget({
    super.key,
    required this.customerName,
    required this.customerAddress,
    required this.customerId,
  });

  @override
  Widget build(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10, 10, 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customerName,
                  style: _itemTextStyle(),
                ),
                Text(
                  customerAddress,
                  style: _subItemTextStyle(),
                ),
              ],
            ),
          ),
          _buildActionButton('View', AppColors.yellow, () {
            print(customerId);
                        Navigator.push(ctx, MaterialPageRoute(builder: (_)=>CustomerInformationDetailsScreen(customerId: customerId.toString(),)));

          }),
          // _buildActionButton('Edit', AppColors.darkBlue, () {


          // }),
          _buildActionButton('Delete', AppColors.darkBlue, () {
            _deleteCustomer(ctx);
          }),
        ],
      ),
    );
  }

  TextStyle _itemTextStyle() {
    return TextStyle(
      fontFamily: 'Bahnschrift',
      fontWeight: FontWeight.bold,
      color: AppColors.darkBlue,
      fontSize: 16.sp,
    );
  }

  TextStyle _subItemTextStyle() {
    return TextStyle(
      fontFamily: 'Bahnschrift',
      color: AppColors.darkBlue,
      fontSize: 14.sp,
    );
  }

  Widget _buildActionButton(String label, Color color, VoidCallback onPressed) {
    return Container(
      height: 35.h,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Bahnschrift',
            color: AppColors.pureWhite,
          ),
        ),
      ),
    );
  }

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
}
