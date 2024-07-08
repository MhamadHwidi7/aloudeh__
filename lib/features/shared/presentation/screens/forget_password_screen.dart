import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/shared/data/params/forget_password_params.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/forget_password_cubit.dart';
import 'package:aloudeh_company/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
    @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  final String guard;
  final ForgotPasswordController controller =
      Get.put(ForgotPasswordController());

  ForgotPasswordScreen({super.key, required this.guard});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: screenHeight,
                  decoration: BoxDecoration(
                    color: AppColors.pureWhite,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(300.r),
                      bottomLeft: Radius.circular(300.r),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/Logo.png',
                            width: 150.w,
                            height: 150.h,
                          ),
                        ),
                        SizedBox(height: screenHeight / 30),
                        _buildForgotPasswordText(),
                        Text(
                          'Reset your password',
                          style: TextStyle(
                            color: AppColors.pureBlack,
                            fontFamily: 'Bahnschrift',
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(height: screenHeight / 15),
                        _buildTextField(
                          controller: controller.emailController,
                          labelText: 'Email',
                          hintText: 'enter your email',
                          prefixIcon: Icons.email_outlined,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field must not be empty';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight / 30),
                        Align(
                          alignment: Alignment.centerRight,
                          child: BlocConsumer<ForgetPasswordSharedCubit,
                              PostState<BaseEntity>>(
                            listener: (context, state) {
                              state.whenOrNull(
                                success: (data) {
                                  Fluttertoast.showToast(
                                    msg: data.message,
                                    toastLength: Toast.LENGTH_SHORT,
                                  );
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const RoleSelectionScreen()),        (Route<dynamic> route) => false,
);
                                },
                                error: (NetworkExceptions exception) {
                                  Fluttertoast.showToast(
                                    msg: NetworkExceptions.getErrorMessage(
                                        exception),
                                    toastLength: Toast.LENGTH_SHORT,
                                  );
                                },
                              );
                            },
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () => FloatingActionButton.extended(
                                  onPressed: () {
                                    if (controller.formKey.currentState!
                                        .validate()) {
context
                                          .read<ForgetPasswordSharedCubit>()
                                          .emitForgetPassword(
                                              forgetPasswordSharedParams:
                                                  ForgetPasswordSharedParams(
                                                      email: controller
                                                          .emailController.text,
                                                      role: guard));                                      print('Form is valid');
                                    }
                                  },
                                  label: Text(
                                    'Send Reset Link',
                                    style: TextStyle(
                                      color: AppColors.mediumBlue,
                                      fontFamily: 'Bauhaus',
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.send,
                                    color: AppColors.mediumBlue,
                                  ),
                                  backgroundColor: AppColors.darkBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40.r),
                                      bottomLeft: Radius.circular(40.r),
                                    ),
                                  ),
                                ),
                                loading: () => const Center(
                                  child: CupertinoActivityIndicator(),
                                ),
                                idle: () => FloatingActionButton.extended(
                                  onPressed: () {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      context
                                          .read<ForgetPasswordSharedCubit>()
                                          .emitForgetPassword(
                                              forgetPasswordSharedParams:
                                                  ForgetPasswordSharedParams(
                                                      email: controller
                                                          .emailController.text,
                                                      role: guard));
                                      print('Form is valid');
                                    }
                                  },
                                  label: Text(
                                    'Send Reset Link',
                                    style: TextStyle(
                                      color: AppColors.mediumBlue,
                                      fontFamily: 'Bauhaus',
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.send,
                                    color: AppColors.mediumBlue,
                                  ),
                                  backgroundColor: AppColors.darkBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40.r),
                                      bottomLeft: Radius.circular(40.r),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForgotPasswordText() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'FOR',
            style: TextStyle(
              fontSize: 30.sp,
              fontFamily: 'Bauhaus',
              color: AppColors.darkBlue,
            ),
          ),
          TextSpan(
            text: 'GET',
            style: TextStyle(
              fontSize: 30.sp,
              fontFamily: 'Bauhaus',
              color: AppColors.yellow,
            ),
          ),
          TextSpan(
            text: ' PASS',
            style: TextStyle(
              fontSize: 30.sp,
              fontFamily: 'Bauhaus',
              color: AppColors.darkBlue,
            ),
          ),
          TextSpan(
            text: 'WORD',
            style: TextStyle(
              fontSize: 30.sp,
              fontFamily: 'Bauhaus',
              color: AppColors.yellow,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required IconData prefixIcon,
    bool obscureText = false,
    Widget? suffixIcon,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: AppColors.darkBlue,
      decoration: InputDecoration(
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.yellow),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.yellow),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.r),
            bottomLeft: Radius.circular(40.r),
          ),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: AppColors.darkBlue,
          fontFamily: 'Bahnschrift',
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.yellow,
          fontFamily: 'Bahnschrift',
        ),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
