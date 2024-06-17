import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCustomerTextEditingController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final customerNameController = TextEditingController();
  final customerIdController = TextEditingController();
  final customerPhoneController = TextEditingController();
  final customerMobileController = TextEditingController();
  final customerAddressController = TextEditingController();
  final customerAddressDetailsController = TextEditingController();
  final customerNotesController = TextEditingController();
  final customerGenderController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  String? validateCustomerName(String? value) {
    if (value == null || value.isEmpty) {
      return "Customer name cannot be empty";
    }
    return null;
  }

  String? validateCustomerGender(String? value) {
    if (value == null || value.isEmpty) {
      return "Customer Gender cannot be empty";
    }
    return null;
  }


  String? validateCustomerPhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Customer phone cannot be empty";
    }
    return null;
  }

  String? validateCustomerMobile(String? value) {
    if (value == null || value.isEmpty) {
      return "Customer mobile cannot be empty";
    }
    return null;
  }

  String? validateCustomerAddress(String? value) {
    if (value == null || value.isEmpty) {
      return "Customer address cannot be empty";
    }
    return null;
  }

  String? validateCustomerAddressDetails(String? value) {
    if (value == null || value.isEmpty) {
      return "Customer address details cannot be empty";
    }
    return null;
  }

  String? validateCustomerNotes(String? value) {
    return null; // Notes are optional, so no validation is needed
  }

  String? validateCustomerNationalId(String? value) {
    if (value == null || value.isEmpty) {
      return "Customer National ID cannot be empty";
    }
    return null;
  }

  @override
  void onClose() {
    customerNameController.dispose();
    customerIdController.dispose();
    customerPhoneController.dispose();
    customerMobileController.dispose();
    customerAddressController.dispose();
    customerAddressDetailsController.dispose();
    customerNotesController.dispose();
    customerGenderController.dispose();
    super.onClose();
  }

    bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
