import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/driver/presentation/screens/driver_login_screen.dart';
import 'package:aloudeh_company/features/driver/presentation/screens/my_trips_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/category_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/log_in_employee_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/trip_list_screen.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_role_entity.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_roles_cubit.dart';
// import 'package:aloudeh_company/features/warehouse/data/entity/role_entity.dart';
// import 'package:aloudeh_company/features/warehouse/presentation/controllers/get_role_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/screens/good_list.dart';
import 'package:aloudeh_company/features/warehouse/presentation/screens/log_in_warehouse_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
        context.read<GetRoleCubit>().emitGetRole();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetRoleCubit, GetState<RoleEntity>>(
      listener: (context, state) {
        debugPrint("Role Api State : $state");
        state.whenOrNull(
          success: (roleEntity) {
            final role = roleEntity.role;
            if (role == 'employee') {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) =>  EmployeeMainScreen())
              );
            } else if (role == 'warehouse_manager') {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) =>  const GoodsApp())
              );
            }else if (role == 'driver') {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) =>  const DriverTripsScreen())
              );
            
            
            //  else if ( role == 'admin'  || role == 'customer') {
            //   Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (_) =>  LogInScreen())
            //   );
            } else {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const RoleSelectionScreen())
              );
            }
          },
         error: (NetworkExceptions exception) {
                      Fluttertoast.showToast(
                        msg: NetworkExceptions.getErrorMessage(exception),
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    },
        );
      },
      builder: (context, state) {
        return AnimatedSplashScreen(
          duration: 3000,
          splash: Center(
            child: Image.asset('assets/images/Logo.png', width: 500, height: 500),
          ),
          nextScreen: const RoleSelectionScreen(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white,
        );
      },
    );
  }
}



class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mediumBlue,
      appBar: AppBar(
        title: Text('Select Your Role',style: TextStyle(color: AppColors.yellow),),
        backgroundColor: AppColors.darkBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            buildRoleCard(context, 'Branch Manager', Icons.business_center, Colors.orange,(){}),
            buildRoleCard(context, 'Admin', Icons.admin_panel_settings, Colors.blue,(){}),
            buildRoleCard(context, 'Employee', Icons.work, Colors.green,(){
              Navigator.push(context,MaterialPageRoute(builder: (_)=>LogInEmployeeScreen(guard:"employee" ,)));
            }),
            buildRoleCard(context, 'WH.Manager', Icons.warehouse, Colors.purple,(){
                            Navigator.push(context,MaterialPageRoute(builder: (_)=>LogInWarehouseScreen(guard: "warehouse_manager",)));

            }),
            buildRoleCard(context, 'Customer', Icons.person, Colors.red,(){}),
            buildRoleCard(context, 'Driver', Icons.drive_eta, Colors.teal,(){
                            Navigator.push(context,MaterialPageRoute(builder: (_)=>LogInDriverScreen(guard: "driver",)));

            }),
          ],
        ),
      ),
    );
  }

  Widget buildRoleCard(BuildContext context, String role, IconData icon, Color color,VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50.0, color: Colors.white),
              SizedBox(height: 10.0),
              Center(
                child: Text(
                  role,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
