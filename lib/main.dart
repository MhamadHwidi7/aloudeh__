import 'package:aloudeh_company/features/branch_manager/presentation/controllers/add_employee_cubit.dart';
import 'package:aloudeh_company/features/branch_manager/presentation/screens/google_map_screen.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/driver_log_in_cubit.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/get_all_my_trips_paginated_cubit.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/get_branch_location_cubit.dart';
import 'package:aloudeh_company/features/driver/presentation/screens/driver_login_screen.dart';
import 'package:aloudeh_company/features/driver/presentation/screens/my_trips_screen.dart';
import 'package:aloudeh_company/features/driver/presentation/screens/shortest_path_screen.dart';
import 'package:aloudeh_company/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LogInDriverCubit>(),
        ),
     BlocProvider(
                  create: (context) => getIt<GetAllMyTripsPaginatedCubit>(),
                ),
                  BlocProvider(
                  create: (context) => getIt<GetBranchLocationCubit>(),
                ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: 
              
             ShortestPathScreen(),
            
          );
        },
      ),
    );
  }
}
