import 'dart:io';

import 'package:aloudeh_company/core/utils/cubit/notification_cubit.dart';
import 'package:aloudeh_company/core/utils/notification_viewer.dart';
import 'package:aloudeh_company/core/utils/shared_preference_utils.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/driver_log_in_cubit.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/driver_profile_cubit.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/edit_driver_profile_cubit.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/get_all_my_trips_paginated_cubit.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/get_branch_location_cubit.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/get_shortest_path_cubit.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/update_location_driver_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/add_customer_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/add_invoice_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/add_trip_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/archive_trip_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/cancel_trip_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/delete_customer_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/edit_trip_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_customers_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_trips_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_branch_by_id_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_branch_location_employee_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_customer_by_id_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_customer_filter_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_profile_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/log_in_employee_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/tracking_driver_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/update_customer_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/forget_password_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_active_trips_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_archive_trips_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_branches_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_closed_trips_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_drivers_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_paginated_goods_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_truck_record_paginted_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_branch_details_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_manifest_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_roles_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_shipping_prices_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_trip_information_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_truck_information_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/add_good_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/delete_good_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/get_all_good_paginated_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/get_archive_goods_paginated_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/get_good_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/get_manifest_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/get_notification_cubit.dart';
// import 'package:aloudeh_company/features/shared/presentation/controllers/get_role_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/getx/cubit/barcode_scanner_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/getx/cubit/cubit/barcode_scanner_list_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/inventory_good_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/login_warehouse_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/receiving_good_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/send_trip_status_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/warehouse_profile_cubit.dart';
import 'package:aloudeh_company/injection.dart';
import 'package:aloudeh_company/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> _backgroundHandler(RemoteMessage message) async {
  print('Received message in background: ${message.data}');
  if (message.notification != null) {
    print('Notification Title: ${message.notification!.title}');
    print('Notification Body: ${message.notification!.body}');
  }
}

Future<void> requestPermission() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
    provisional: false,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission.');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission.');
  } else {
    print('User denied or has not accepted permission.');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await requestPermission();
await SharedPreferencesUtils().init();
  await configureDependencies();
  await NotificationViewer.initialize();
  HttpOverrides.global = MyHttpOverrides();
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  print("++===================================");
  print(FirebaseMessaging.instance.getToken().toString());
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
        BlocProvider(
          create: (context) => getIt<DriverProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetShortestPathCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<UpdateLocationDriverCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<TrackingDriverCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetBranchLocationEmployeeCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetAllCustomersEmployeePaginatedCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<DeleteCustomerCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AddCustomerCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetCustomerByIdCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<NotificationCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<UpdateCustomerCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetAllBranchsPaginatedSharedCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetAllArchiveTripsPaginatedSharedCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetAllActiveTripsPaginatedSharedCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<CancelTripCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetAllDriversSharedCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetAllTruckRecordPaginatedSharedCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AddTripCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetTripInformationSharedCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetManifestSharedCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ArchiveTripCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetAllTripsPaginatedCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetBranchDetailsSharedCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetTruckInformationSharedCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetCustomerFilterCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AddInvoiceCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<EditTripCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<GetAllGoodsPaginatedCubit>(),
        ),
           BlocProvider(
          create: (context) => getIt<DeleteGoodCubit>(),
        ),
            BlocProvider(
          create: (context) => getIt<GetArchiveGoodsPaginatedCubit>(),
        ),
         BlocProvider(
          create: (context) => getIt<ReceivingGoodCubit>(),
        ),
           BlocProvider(
          create: (context) => getIt<AddGoodCubit>(),
        ),
         BlocProvider(
          create: (context) => getIt<GetGoodCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<BarcodeScannerCubit>(),
        ),
          BlocProvider(
          create: (context) => getIt<BarcodeScannerListCubit>(),
        ),
           BlocProvider(
          create: (context) => getIt<InventoryGoodCubit>(),
        ),
             BlocProvider(
          create: (context) => getIt<GetRoleCubit>(),
        ),
             BlocProvider(
          create: (context) => getIt<GetProfileCubit>(),
        ),
          BlocProvider(
          create: (context) => getIt<LogInWarehouseCubit>(),
        ),
         BlocProvider(
          create: (context) => getIt<LogInEmployeeCubit>(),
        ),
           BlocProvider(
          create: (context) => getIt<GetShippingPricesPaginatedSharedCubit>(),
        ),
           BlocProvider(
          create: (context) => getIt<GetAllClosedTripsPaginatedSharedCubit>(),
        ),///!Heereeeee
            BlocProvider(
          create: (context) => getIt<GetAllGoodsPaginatedSharedCubit>(),
        ),
              BlocProvider(
          create: (context) => getIt<GetNotificationCubit>(),
        ),
               BlocProvider(
          create: (context) => getIt<GetProfileWarehouseCubit>(),
        ),
             BlocProvider(
          create: (context) => getIt<SendTripStatusCubit>(),
        ),
            BlocProvider(
          create: (context) => getIt<GetManifestWarehouseCubit>(),
        ),
            BlocProvider(
          create: (context) => getIt<EditDriverProfileCubit>(),
        ),
            BlocProvider(
          create: (context) => getIt<ForgetPasswordSharedCubit>(),
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
              home:  const SplashScreen()

              //  EmployeeTrackingScreen(tripNumber: "HO_1_2",branchId: 3,),

              );
        },
      ),
    );
  }
}
