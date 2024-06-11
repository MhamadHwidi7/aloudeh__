import 'package:aloudeh_company/features/admin/presentation/controllers/get_all_branches_cubit.dart';
import 'package:aloudeh_company/features/admin/presentation/controllers/get_all_warehouses_paginated_cubit.dart';
import 'package:aloudeh_company/features/admin/presentation/controllers/get_branch_employee_cubit.dart';
import 'package:aloudeh_company/features/admin/presentation/controllers/get_employee_by_id_cubit.dart';
import 'package:aloudeh_company/features/admin/presentation/controllers/get_warehouse_manager_by_id_cubit.dart';
import 'package:aloudeh_company/features/admin/presentation/controllers/promote_employee_cubit.dart';
import 'package:aloudeh_company/features/admin/presentation/controllers/truck_record_cubit.dart';
import 'package:aloudeh_company/features/admin/presentation/screens/test.dart';
import 'package:aloudeh_company/features/branch_manager/presentation/controllers/add_employee_cubit.dart';
import 'package:aloudeh_company/features/branch_manager/presentation/screens/google_map_screen.dart';
import 'package:aloudeh_company/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
      create: (context) => getIt<AddEmployeeCubit>(),
          child:  MapScreen(),
        ));
  }
}
