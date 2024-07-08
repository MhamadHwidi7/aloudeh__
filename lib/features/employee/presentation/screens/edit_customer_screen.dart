import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/features/employee/data/entity/customer_entity.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/custom_divider_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/header_information_text_widget.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/save_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class EditCustomerScreen extends StatefulWidget {
  final CustomerEmployeeEntity customerData;

  const EditCustomerScreen({super.key, required this.customerData});

  @override
  State<EditCustomerScreen> createState() => _EditCustomerScreenState();
}

class _EditCustomerScreenState extends State<EditCustomerScreen> {
  late TextEditingController _customerNameController;
  late TextEditingController _customerIdController;
  late TextEditingController _customerPhoneController;
  late TextEditingController _customerMobileController;
  late TextEditingController _customerAddressController;
  late TextEditingController _customerAddressDetailsController;
  late TextEditingController _customerNotesController;

  @override
  void initState() {
    _customerNameController = TextEditingController(text: widget.customerData.data.name);
    _customerIdController = TextEditingController(text: widget.customerData.data.nationalId);
    _customerPhoneController = TextEditingController(text: widget.customerData.data.phoneNumber.toString());
    _customerMobileController = TextEditingController(text: widget.customerData.data.mobile.toString());
    _customerAddressController = TextEditingController(text: widget.customerData.data.address);
    _customerAddressDetailsController = TextEditingController(text: widget.customerData.data.addressDetail);
    _customerNotesController = TextEditingController(text: widget.customerData.data.notes ?? "");

    super.initState();
  }

  @override
  void dispose() {
    _customerNameController.dispose();
    _customerIdController.dispose();
    _customerPhoneController.dispose();
    _customerMobileController.dispose();
    _customerAddressController.dispose();
    _customerAddressDetailsController.dispose();
    _customerNotesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight / 75),
          const EditScreenIntroText(),
          SizedBox(height: screenHeight / 75),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: screenHeight / 75),
                _buildEditableRow('ID', _customerIdController, screenWidth / 7.2),
                const CustomDivider(),
                _buildEditableRow('Name', _customerNameController, screenWidth / 15),
                const CustomDivider(),
                _buildEditableRow('Phone', _customerPhoneController, screenWidth / 17.5),
                const CustomDivider(),
                _buildEditableRow('Mobile', _customerMobileController, screenWidth / 18.5),
                const CustomDivider(),
                _buildEditableRow('Address', _customerAddressController, screenWidth / 50),
                const CustomDivider(),
                _buildEditableRow('Address Details', _customerAddressDetailsController, screenWidth / 45),
                const CustomDivider(),
                _buildEditableRow('Notes', _customerNotesController, screenWidth / 45),
                const CustomDivider(),
              ],
            ),
          ),
          SaveButton(
            customerId: widget.customerData.data.id,
            customerIdController: _customerIdController,
            customerNameController: _customerNameController,
            customerPhoneController: _customerPhoneController,
            customerMobileController: _customerMobileController,
            customerAddressController: _customerAddressController,
            customerAddressDetailsController: _customerAddressDetailsController,
            customerNotesController: _customerNotesController,
            initialData: widget.customerData,
          ),
        ],
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
Widget _buildEditableRow(String label, TextEditingController controller, double spacing) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
              child: TextField(
                textAlign: TextAlign.center,
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
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
        ),
      ],
    ),
  );
}}