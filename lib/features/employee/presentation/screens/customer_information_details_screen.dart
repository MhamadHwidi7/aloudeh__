
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/employee/data/entity/customer_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/get_customer_by_id_params.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_customer_by_id_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/custom_divider_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/delete_customer_button_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/edit_customer_button_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/header_information_text_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/logo_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerInformationDetailsScreen extends StatefulWidget {
  final String customerId;
  const CustomerInformationDetailsScreen({super.key, required this.customerId});

  @override
  State<CustomerInformationDetailsScreen> createState() => _CustomerInformationDetailsScreenState();
}

class _CustomerInformationDetailsScreenState extends State<CustomerInformationDetailsScreen> {
  @override
  void initState() {
    context.read<GetCustomerByIdCubit>().emitGetCustomerById(
      getCustomerByIdParams: GetCustomerByIdParams(customerId: widget.customerId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocBuilder<GetCustomerByIdCubit, PostState<CustomerEmployeeEntity>>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Text("Something went wrong"),
            loading: () => const CupertinoActivityIndicator(),
            success: (data) => Column(
              children: [
                SizedBox(height: screenHeight / 75),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: _buildTopRow(data),
                ),
                const CustomDivider(),
                Expanded(
                  child: ListView(
                    children: [
                      _buildCustomerDetailRow(context, 'ID', data.data.nationalId, screenWidth / 7),
                      const CustomDivider(),
                      _buildCustomerDetailRow(context, 'Name', data.data.name, screenWidth / 14.3),
                      const CustomDivider(),
                      _buildCustomerDetailRow(context, 'Phone', data.data.phoneNumber.toString(), screenWidth / 17),
                      const CustomDivider(),
                      _buildCustomerDetailRow(context, 'Mobile', data.data.mobile.toString(), screenWidth / 19),
                      const CustomDivider(),
                      _buildCustomerDetailRow(context, 'Address', data.data.address, screenWidth / 60),
                      const CustomDivider(),
                      _buildCustomerDetailRow(context, 'Address Details', data.data.addressDetail, screenWidth / 60),
                      const CustomDivider(),
                      _buildNotesSection(context, screenHeight, data),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Align(
        alignment: Alignment.centerRight,
        child: CustomerInfoTitle(),
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
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(),
      ),
    );
  }

  Row _buildTopRow(CustomerEmployeeEntity data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DeleteCustomerButton(customerId: data.data.id, customerName: data.data.name),
        const LogoWidget(),
        EditCustomerButton(customerData: data),
      ],
    );
  }

  Widget _buildCustomerDetailRow(BuildContext context, String label, String value, double spacing) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
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
              child: Center(
                child: Text(
                  value,
                  style: TextStyle(
                    fontFamily: 'bahnschrift',
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesSection(BuildContext context, double screenHeight, CustomerEmployeeEntity data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
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
            child: Center(
              child: Text(
                data.data.notes ?? "",
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
}