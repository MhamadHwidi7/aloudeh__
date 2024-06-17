import 'package:aloudeh_company/features/branch_manager/presentation/controllers/add_employee_cubit.dart';
import 'package:aloudeh_company/features/branch_manager/presentation/screens/google_map_screen.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/driver_log_in_cubit.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/driver_profile_cubit.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/get_all_my_trips_paginated_cubit.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/get_branch_location_cubit.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/get_shortest_path_cubit.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/update_location_driver_cubit.dart';
import 'package:aloudeh_company/features/driver/presentation/screens/driver_login_screen.dart';
import 'package:aloudeh_company/features/driver/presentation/screens/driver_profile_screen.dart';
import 'package:aloudeh_company/features/driver/presentation/screens/my_trips_screen.dart';
import 'package:aloudeh_company/features/driver/presentation/screens/shortest_path_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/add_customer_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/add_trip_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/archive_trip_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/cancel_trip_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/delete_customer_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_active_trips_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_archive_trips_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_branches_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_customers_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_destination_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_drivers_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_trips_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_truck_record_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_branch_by_id_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_branch_location_employee_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_customer_by_id_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_manifest_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_trips_info_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_truck_information_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/tracking_driver_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/update_customer_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/add_trip_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/archive_eye_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/edit_customer_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/show_all_branches_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/show_customers_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/tracking_trip_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/trip_list_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/truck_screen.dart';
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
        ),               BlocProvider(
          create: (context) => getIt<UpdateCustomerCubit>(),
        ),    
            BlocProvider(
          create: (context) => getIt<GetAllBranchesPaginatedCubit>(),
        ),        
                BlocProvider(
          create: (context) => getIt<GetAllArchiveTripsPaginatedCubit>(),
        ),        
          BlocProvider(
          create: (context) => getIt<GetAllActiveTripsPaginatedCubit>(),
        ),        
           BlocProvider(
          create: (context) => getIt<CancelTripCubit>(),
        ),    
         BlocProvider(
          create: (context) => getIt<GetAllDestinationCubit>(),
        ),    
          BlocProvider(
          create: (context) => getIt<GetAllDriversCubit>(),
        ),    
             BlocProvider(
          create: (context) => getIt<GetAllTruckRecordPaginatedCubit>(),
        ),    
             BlocProvider(
          create: (context) => getIt<AddTripCubit>(),
        ),    
             BlocProvider(
          create: (context) => getIt<GetTripsInfoCubit>(),
        ),    
             BlocProvider(
          create: (context) => getIt<GetManifestCubit>(),
        ),    
            BlocProvider(
          create: (context) => getIt<ArchiveTripCubit>(),
        ),    
           BlocProvider(
          create: (context) => getIt<GetAllTripsPaginatedCubit>(),
        ),    
             BlocProvider(
          create: (context) => getIt<GetBranchByIdEmployeeCubit>(),
        ),    
              BlocProvider(
          create: (context) => getIt<GetTruckInformationCubit>(),
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
            home:  TruckListScreen()
              
            //  EmployeeTrackingScreen(tripNumber: "HO_1_2",branchId: 3,),
            
          );
        },
      ),
    );
  }
}
