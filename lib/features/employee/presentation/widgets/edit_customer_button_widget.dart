
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/features/employee/data/entity/customer_entity.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/edit_customer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditCustomerButton extends StatelessWidget {
  final CustomerEmployeeEntity customerData;

  const EditCustomerButton({super.key, required this.customerData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.h,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditCustomerScreen(customerData: customerData,),
            ),
          );
        },
        child: const Icon(
          Icons.edit,
          color: AppColors.yellow,
        ),
        elevation: 0.0,
        heroTag: 'ec',
        backgroundColor: AppColors.darkBlue,
      ),
    );
  }
}
