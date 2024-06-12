import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var passwordVisible = true.obs;


  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }
}
