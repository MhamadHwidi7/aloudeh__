
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/getx/log_in_text_field_controllers.dart';
import 'package:aloudeh_company/features/shared/presentation/screens/forget_password_screen.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/log_in_warehouse_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/params/log_in_warehouse_params.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/login_warehouse_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/screens/good_list.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LogInWarehouseScreen extends StatelessWidget {
  final LogInController controller = Get.put(LogInController());
final String guard;

  LogInWarehouseScreen({super.key ,required this.guard});

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
                        _buildLoginText(),
                        Text(
                          'Log in to your account',
                          style: TextStyle(
                            color: AppColors.pureBlack,
                            fontFamily: 'Bahnschrift',
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(height: screenHeight / 15),
                        _buildTextField(
                          controller: controller.userNameController,
                          labelText: 'User Name',
                          hintText: 'enter your name',
                          prefixIcon: Icons.person_2_outlined,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight / 30),
                        Obx(() => _buildTextField(
                              controller: controller.passwordController,
                              labelText: 'Password',
                              hintText: 'enter password',
                              prefixIcon: Icons.lock_outline,
                              obscureText: controller.passwordVisible.value,
                              suffixIcon: IconButton(
                                onPressed: controller.togglePasswordVisibility,
                                icon: Icon(
                                  controller.passwordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.darkBlue,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field must not be empty';
                                }
                                return null;
                              },
                            )),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>ForgotPasswordScreen(guard:guard)));
                            },
                            child: Text(
                              'Forget password?',
                              style: TextStyle(
                                fontFamily: 'Bahnschrift',
                                color: AppColors.darkBlue,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight / 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: BlocConsumer<LogInWarehouseCubit,
                              PostState<LogInWarehouseEntity>>(
                            listener: (context, state) {
                              state.whenOrNull(
                                success: (data) =>Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=> GoodsApp())) ,
                                error: (networkExceptions) =>
                                    Fluttertoast.showToast(
                                        msg: NetworkExceptions.getErrorMessage(
                                            networkExceptions),
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor:
                                            CupertinoColors.activeBlue,
                                        textColor: Colors.white,
                                        fontSize: 16.0),
                              );
                            },
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () => FloatingActionButton.extended(
                                  onPressed: () async {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      String? deviceToken =
                                          await FirebaseMessaging.instance
                                              .getToken();

                                      context
                                          .read<LogInWarehouseCubit>()
                                          .emitLogInWarehouse(
                                              logInWarehouseParams: LogInWarehouseParams(  name:
                                                          controller
                                                              .userNameController
                                                              .text,
                                                      password:
                                                          controller
                                                              .passwordController
                                                              .text,
                                                      deviceToken:
                                                          deviceToken!));
                                    }
                                  },
                                  label: Text(
                                    'Log In',
                                    style: TextStyle(
                                      color: AppColors.mediumBlue,
                                      fontFamily: 'Bauhaus',
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.login,
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
                                loading: () =>
                                    const CupertinoActivityIndicator(),
                                idle: () => FloatingActionButton.extended(
                                  onPressed: () async {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      String? deviceToken =
                                          await FirebaseMessaging.instance
                                              .getToken();

                                    context
                                          .read<LogInWarehouseCubit>()
                                          .emitLogInWarehouse(
                                              logInWarehouseParams: LogInWarehouseParams(  name:
                                                          controller
                                                              .userNameController
                                                              .text,
                                                      password:
                                                          controller
                                                              .passwordController
                                                              .text,
                                                      deviceToken:
                                                          deviceToken!));
                                      print('Form is valid');
                                    }
                                  },
                                  label: Text(
                                    'Log In',
                                    style: TextStyle(
                                      color: AppColors.mediumBlue,
                                      fontFamily: 'Bauhaus',
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.login,
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

  Widget _buildLoginText() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'LO',
            style: TextStyle(
              fontSize: 30.sp,
              fontFamily: 'Bauhaus',
              color: AppColors.darkBlue,
            ),
          ),
          TextSpan(
            text: 'G I',
            style: TextStyle(
              fontSize: 30.sp,
              fontFamily: 'Bauhaus',
              color: AppColors.yellow,
            ),
          ),
          TextSpan(
            text: 'N',
            style: TextStyle(
              fontSize: 30.sp,
              fontFamily: 'Bauhaus',
              color: AppColors.darkBlue,
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
