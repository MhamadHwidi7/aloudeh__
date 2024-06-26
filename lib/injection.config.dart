// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:firebase_messaging/firebase_messaging.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;

import 'core/api/api_consumer.dart' as _i13;
import 'core/api/dio_consumer.dart' as _i14;
import 'core/api/logging_interceptor.dart' as _i9;
import 'core/error/error_interceptor.dart' as _i6;
import 'core/network/network_info.dart' as _i10;
import 'core/third_party_injection.dart' as _i116;
import 'core/utils/cubit/notification_cubit.dart' as _i11;
import 'core/utils/shared_preference_utils.dart' as _i12;
import 'features/admin/data/repository/admin_repository.dart' as _i85;
import 'features/admin/data/web_services/admin_web_service.dart' as _i31;
import 'features/admin/presentation/controllers/add_branch_cubit.dart' as _i112;
import 'features/admin/presentation/controllers/add_branch_manager_cubit.dart'
    as _i113;
import 'features/admin/presentation/controllers/add_warehouse_cubit.dart'
    as _i114;
import 'features/admin/presentation/controllers/add_warehouse_manager_cubit.dart'
    as _i115;
import 'features/admin/presentation/controllers/delete_branch_cubit.dart'
    as _i88;
import 'features/admin/presentation/controllers/delete_warehouse_cubit.dart'
    as _i90;
import 'features/admin/presentation/controllers/get_all_active_trips_paginated_cubit.dart'
    as _i92;
import 'features/admin/presentation/controllers/get_all_archive_trips_paginated_cubit.dart'
    as _i93;
import 'features/admin/presentation/controllers/get_all_branches_cubit.dart'
    as _i94;
import 'features/admin/presentation/controllers/get_all_customer_paginated_cubit.dart'
    as _i95;
import 'features/admin/presentation/controllers/get_all_employee_paginated_cubit.dart'
    as _i96;
import 'features/admin/presentation/controllers/get_branch_employee_cubit.dart'
    as _i98;
import 'features/admin/presentation/controllers/get_customer_by_id_cubit.dart'
    as _i99;
import 'features/admin/presentation/controllers/get_employee_by_id_cubit.dart'
    as _i100;
import 'features/admin/presentation/controllers/get_employee_vacation_cubit.dart'
    as _i101;
import 'features/admin/presentation/controllers/get_trip_information_cubit.dart'
    as _i102;
import 'features/admin/presentation/controllers/get_trips_record_paginated_cubit.dart'
    as _i97;
import 'features/admin/presentation/controllers/get_warehouse_manager_by_id_cubit.dart'
    as _i103;
import 'features/admin/presentation/controllers/get_warehouse_vacation_cubit.dart'
    as _i104;
import 'features/admin/presentation/controllers/log_in_cubit.dart' as _i105;
import 'features/admin/presentation/controllers/promote_employee_cubit.dart'
    as _i106;
import 'features/admin/presentation/controllers/register_cubit.dart' as _i107;
import 'features/admin/presentation/controllers/truck_information_cubit.dart'
    as _i108;
import 'features/admin/presentation/controllers/truck_record_cubit.dart'
    as _i109;
import 'features/admin/presentation/controllers/update_branch_cubit.dart'
    as _i110;
import 'features/admin/presentation/controllers/update_warehouse_cubit.dart'
    as _i111;
import 'features/branch_manager/data/repository/branch_manager_repository.dart'
    as _i32;
import 'features/branch_manager/data/web_services/branch_manager_web_services.dart'
    as _i17;
import 'features/branch_manager/presentation/controllers/add_employee_cubit.dart'
    as _i78;
import 'features/branch_manager/presentation/controllers/add_shipping_cost_cubit.dart'
    as _i80;
import 'features/branch_manager/presentation/controllers/add_truck_cubit.dart'
    as _i82;
import 'features/branch_manager/presentation/controllers/add_vacation_employee_cubit.dart'
    as _i83;
import 'features/branch_manager/presentation/controllers/add_vacation_warehouse_cubit.dart'
    as _i84;
import 'features/branch_manager/presentation/controllers/delete_driver_cubit.dart'
    as _i33;
import 'features/branch_manager/presentation/controllers/delete_employee_cubit.dart'
    as _i34;
import 'features/branch_manager/presentation/controllers/delete_truck_cubit.dart'
    as _i35;
import 'features/branch_manager/presentation/controllers/edit_shipping_cost_cubit.dart'
    as _i38;
import 'features/branch_manager/presentation/controllers/promote_employee_cubit.dart'
    as _i66;
import 'features/branch_manager/presentation/controllers/rate_employee_cubit.dart'
    as _i67;
import 'features/branch_manager/presentation/controllers/update_driver_cubit.dart'
    as _i71;
import 'features/branch_manager/presentation/controllers/update_employee_cubit.dart'
    as _i72;
import 'features/branch_manager/presentation/controllers/update_truck_cubit.dart'
    as _i75;
import 'features/driver/data/data_source/driver_web_services.dart' as _i19;
import 'features/driver/data/repository/driver_repository.dart' as _i36;
import 'features/driver/presentation/controllers/driver_log_in_cubit.dart'
    as _i64;
import 'features/driver/presentation/controllers/driver_profile_cubit.dart'
    as _i37;
import 'features/driver/presentation/controllers/get_all_my_trips_paginated_cubit.dart'
    as _i46;
import 'features/driver/presentation/controllers/get_branch_location_cubit.dart'
    as _i51;
import 'features/driver/presentation/controllers/get_shortest_path_cubit.dart'
    as _i57;
import 'features/driver/presentation/controllers/update_location_driver_cubit.dart'
    as _i73;
import 'features/employee/data/repository/employee_repository.dart' as _i39;
import 'features/employee/data/web_services/employee_web_services.dart' as _i20;
import 'features/employee/presentation/controller/add_compliant_cubit.dart'
    as _i76;
import 'features/employee/presentation/controller/add_customer_cubit.dart'
    as _i77;
import 'features/employee/presentation/controller/add_invoice_cubit.dart'
    as _i79;
import 'features/employee/presentation/controller/add_trip_cubit.dart' as _i81;
import 'features/employee/presentation/controller/archive_trip_cubit.dart'
    as _i86;
import 'features/employee/presentation/controller/cancel_trip_cubit.dart'
    as _i87;
import 'features/employee/presentation/controller/delete_customer_cubit.dart'
    as _i89;
import 'features/employee/presentation/controller/edit_trip_cubit.dart' as _i91;
import 'features/employee/presentation/controller/get_all_active_trips_paginated_cubit.dart'
    as _i40;
import 'features/employee/presentation/controller/get_all_archive_trips_paginated_cubit.dart'
    as _i41;
import 'features/employee/presentation/controller/get_all_branches_paginated_cubit.dart'
    as _i42;
import 'features/employee/presentation/controller/get_all_closed_trips_paginated_cubit.dart'
    as _i43;
import 'features/employee/presentation/controller/get_all_customers_paginated_cubit.dart'
    as _i44;
import 'features/employee/presentation/controller/get_all_drivers_cubit.dart'
    as _i45;
import 'features/employee/presentation/controller/get_all_receipt_cubit.dart'
    as _i47;
import 'features/employee/presentation/controller/get_all_trips_paginated_cubit.dart'
    as _i48;
import 'features/employee/presentation/controller/get_all_truck_record_paginated_cubit.dart'
    as _i49;
import 'features/employee/presentation/controller/get_branch_by_id_cubit.dart'
    as _i50;
import 'features/employee/presentation/controller/get_branch_location_employee_cubit.dart'
    as _i52;
import 'features/employee/presentation/controller/get_customer_by_id_cubit.dart'
    as _i53;
import 'features/employee/presentation/controller/get_customer_filter_cubit.dart'
    as _i54;
import 'features/employee/presentation/controller/get_manifest_cubit.dart'
    as _i55;
import 'features/employee/presentation/controller/get_profile_cubit.dart'
    as _i56;
import 'features/employee/presentation/controller/get_trip_report_cubit.dart'
    as _i58;
import 'features/employee/presentation/controller/get_trips_info_cubit.dart'
    as _i59;
import 'features/employee/presentation/controller/get_truck_information_cubit.dart'
    as _i60;
import 'features/employee/presentation/controller/get_truck_record_cubit.dart'
    as _i61;
import 'features/employee/presentation/controller/get_truck_report_cubit.dart'
    as _i62;
import 'features/employee/presentation/controller/get_type_pricelist_paginated_cubit.dart'
    as _i63;
import 'features/employee/presentation/controller/log_in_employee_cubit.dart'
    as _i65;
import 'features/employee/presentation/controller/tracking_driver_cubit.dart'
    as _i68;
import 'features/employee/presentation/controller/trip_archive_cubit.dart'
    as _i69;
import 'features/employee/presentation/controller/update_customer_cubit.dart'
    as _i70;
import 'features/employee/presentation/controller/update_manifest_cubit.dart'
    as _i74;
import 'features/warehouse/data/data_source/remote_data_source.dart' as _i15;
import 'features/warehouse/data/repository/warehouse_repository.dart' as _i16;
import 'features/warehouse/presentation/controllers/add_good_cubit.dart'
    as _i30;
import 'features/warehouse/presentation/controllers/delete_good_cubit.dart'
    as _i18;
import 'features/warehouse/presentation/controllers/get_all_good_paginated_cubit.dart'
    as _i21;
import 'features/warehouse/presentation/controllers/get_archive_goods_paginated_cubit.dart'
    as _i22;
import 'features/warehouse/presentation/controllers/get_good_cubit.dart'
    as _i23;
import 'features/warehouse/presentation/controllers/get_notification_cubit.dart'
    as _i24;
import 'features/warehouse/presentation/controllers/get_role_cubit.dart'
    as _i26;
import 'features/warehouse/presentation/controllers/getx/cubit/barcode_scanner_cubit.dart'
    as _i3;
import 'features/warehouse/presentation/controllers/getx/cubit/cubit/barcode_scanner_list_cubit.dart'
    as _i4;
import 'features/warehouse/presentation/controllers/inventory_good_cubit.dart'
    as _i27;
import 'features/warehouse/presentation/controllers/login_warehouse_cubit.dart'
    as _i28;
import 'features/warehouse/presentation/controllers/receiving_good_cubit.dart'
    as _i29;
import 'features/warehouse/presentation/controllers/warehouse_profile_cubit.dart'
    as _i25;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyInjection = _$ThirdPartyInjection();
    gh.factory<_i3.BarcodeScannerCubit>(() => _i3.BarcodeScannerCubit());
    gh.factory<_i4.BarcodeScannerListCubit>(
        () => _i4.BarcodeScannerListCubit());
    gh.singleton<_i5.Dio>(() => thirdPartyInjection.dio);
    gh.singleton<_i6.ErrorInterceptor>(() => _i6.ErrorInterceptor());
    gh.singleton<_i7.FirebaseMessaging>(
        () => thirdPartyInjection.firebaseMessaging);
    gh.singleton<_i8.InternetConnectionChecker>(
        () => thirdPartyInjection.internetConnectionChecker);
    gh.singleton<_i9.LoggingInterceptor>(() => _i9.LoggingInterceptor());
    gh.lazySingleton<_i10.NetworkInfo>(() => _i10.NetworkInfoImpl(
        connectionChecker: gh<_i8.InternetConnectionChecker>()));
    gh.singleton<_i11.NotificationCubit>(
        () => _i11.NotificationCubit(gh<_i7.FirebaseMessaging>()));
    gh.singleton<_i12.SharedPreferencesUtils>(
        () => thirdPartyInjection.sharedPreferencesUtils);
    gh.singleton<_i13.ApiConsumer>(() => _i14.DioConsumer(gh<_i5.Dio>()));
    gh.singleton<_i15.BaseWarehouseRemoteDataSource>(() =>
        _i15.WarehouseRemoteDataSourceImpl(
            apiConsumer: gh<_i13.ApiConsumer>()));
    gh.singleton<_i16.BaseWarehouseRepository>(
        () => _i16.WarehouseRepositoryImpl(
              networkInfo: gh<_i10.NetworkInfo>(),
              baseWarehouseRemoteDataSource:
                  gh<_i15.BaseWarehouseRemoteDataSource>(),
            ));
    gh.singleton<_i17.BranchManagerBaseWebServices>(() =>
        _i17.BranchManagerWebServicesImpl(apiConsumer: gh<_i13.ApiConsumer>()));
    gh.factory<_i18.DeleteGoodCubit>(
        () => _i18.DeleteGoodCubit(gh<_i16.BaseWarehouseRepository>()));
    gh.singleton<_i19.DriverBaseWebServices>(
        () => _i19.DriverWebServicesImpl(apiConsumer: gh<_i13.ApiConsumer>()));
    gh.singleton<_i20.EmployeeBaseWebServices>(() =>
        _i20.EmployeeWebServicesImpl(apiConsumer: gh<_i13.ApiConsumer>()));
    gh.factory<_i21.GetAllGoodsPaginatedCubit>(() =>
        _i21.GetAllGoodsPaginatedCubit(gh<_i16.BaseWarehouseRepository>()));
    gh.factory<_i22.GetArchiveGoodsPaginatedCubit>(() =>
        _i22.GetArchiveGoodsPaginatedCubit(gh<_i16.BaseWarehouseRepository>()));
    gh.factory<_i23.GetGoodCubit>(
        () => _i23.GetGoodCubit(gh<_i16.BaseWarehouseRepository>()));
    gh.factory<_i24.GetNotificationCubit>(
        () => _i24.GetNotificationCubit(gh<_i16.BaseWarehouseRepository>()));
    gh.factory<_i25.GetProfileWarehouseCubit>(() =>
        _i25.GetProfileWarehouseCubit(gh<_i16.BaseWarehouseRepository>()));
    gh.factory<_i26.GetRoleCubit>(
        () => _i26.GetRoleCubit(gh<_i16.BaseWarehouseRepository>()));
    gh.factory<_i27.InventoryGoodCubit>(
        () => _i27.InventoryGoodCubit(gh<_i16.BaseWarehouseRepository>()));
    gh.factory<_i28.LogInWarehouseCubit>(() => _i28.LogInWarehouseCubit(
          gh<_i16.BaseWarehouseRepository>(),
          gh<_i12.SharedPreferencesUtils>(),
        ));
    gh.factory<_i29.ReceivingGoodCubit>(
        () => _i29.ReceivingGoodCubit(gh<_i16.BaseWarehouseRepository>()));
    gh.factory<_i30.AddGoodCubit>(
        () => _i30.AddGoodCubit(gh<_i16.BaseWarehouseRepository>()));
    gh.singleton<_i31.AdminBaseWebService>(
        () => _i31.AdminWebService(apiConsumer: gh<_i13.ApiConsumer>()));
    gh.singleton<_i32.BranchManagerBaseRepository>(() =>
        _i32.BranchManagerRepositoryImpl(
          networkInfo: gh<_i10.NetworkInfo>(),
          branchManagerBaseWebServices: gh<_i17.BranchManagerBaseWebServices>(),
        ));
    gh.factory<_i33.DeleteDriverCubit>(
        () => _i33.DeleteDriverCubit(gh<_i32.BranchManagerBaseRepository>()));
    gh.factory<_i34.DeleteEmployeeCubit>(
        () => _i34.DeleteEmployeeCubit(gh<_i32.BranchManagerBaseRepository>()));
    gh.factory<_i35.DeleteTruckCubit>(
        () => _i35.DeleteTruckCubit(gh<_i32.BranchManagerBaseRepository>()));
    gh.singleton<_i36.DriverBaseRepository>(() => _i36.DriverRepositoryImpl(
          networkInfo: gh<_i10.NetworkInfo>(),
          driverBaseWebServices: gh<_i19.DriverBaseWebServices>(),
        ));
    gh.factory<_i37.DriverProfileCubit>(
        () => _i37.DriverProfileCubit(gh<_i36.DriverBaseRepository>()));
    gh.factory<_i38.EditShippingCostCubit>(() =>
        _i38.EditShippingCostCubit(gh<_i32.BranchManagerBaseRepository>()));
    gh.singleton<_i39.EmployeeBaseRepository>(() => _i39.EmployeeRepositoryImpl(
          networkInfo: gh<_i10.NetworkInfo>(),
          employeeBaseWebServices: gh<_i20.EmployeeBaseWebServices>(),
        ));
    gh.factory<_i40.GetAllActiveTripsPaginatedCubit>(() =>
        _i40.GetAllActiveTripsPaginatedCubit(
            gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i41.GetAllArchiveTripsPaginatedCubit>(() =>
        _i41.GetAllArchiveTripsPaginatedCubit(
            gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i42.GetAllBranchesPaginatedCubit>(() =>
        _i42.GetAllBranchesPaginatedCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i43.GetAllClosedTripsPaginatedCubit>(() =>
        _i43.GetAllClosedTripsPaginatedCubit(
            gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i44.GetAllCustomersEmployeePaginatedCubit>(() =>
        _i44.GetAllCustomersEmployeePaginatedCubit(
            gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i45.GetAllDriversCubit>(
        () => _i45.GetAllDriversCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i46.GetAllMyTripsPaginatedCubit>(() =>
        _i46.GetAllMyTripsPaginatedCubit(gh<_i36.DriverBaseRepository>()));
    gh.factory<_i47.GetAllReceiptCubit>(
        () => _i47.GetAllReceiptCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i48.GetAllTripsPaginatedCubit>(() =>
        _i48.GetAllTripsPaginatedCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i49.GetAllTruckRecordPaginatedCubit>(() =>
        _i49.GetAllTruckRecordPaginatedCubit(
            gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i50.GetBranchByIdEmployeeCubit>(() =>
        _i50.GetBranchByIdEmployeeCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i51.GetBranchLocationCubit>(
        () => _i51.GetBranchLocationCubit(gh<_i36.DriverBaseRepository>()));
    gh.factory<_i52.GetBranchLocationEmployeeCubit>(() =>
        _i52.GetBranchLocationEmployeeCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i53.GetCustomerByIdCubit>(
        () => _i53.GetCustomerByIdCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i54.GetCustomerFilterCubit>(
        () => _i54.GetCustomerFilterCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i55.GetManifestCubit>(
        () => _i55.GetManifestCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i56.GetProfileCubit>(
        () => _i56.GetProfileCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i57.GetShortestPathCubit>(
        () => _i57.GetShortestPathCubit(gh<_i36.DriverBaseRepository>()));
    gh.factory<_i58.GetTripReportCubit>(
        () => _i58.GetTripReportCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i59.GetTripsInfoCubit>(
        () => _i59.GetTripsInfoCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i60.GetTruckInformationCubit>(
        () => _i60.GetTruckInformationCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i61.GetTruckRecordCubit>(
        () => _i61.GetTruckRecordCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i62.GetTruckReportCubit>(
        () => _i62.GetTruckReportCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i63.GetTypePriceListPaginatedCubit>(() =>
        _i63.GetTypePriceListPaginatedCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i64.LogInDriverCubit>(() => _i64.LogInDriverCubit(
          gh<_i36.DriverBaseRepository>(),
          gh<_i12.SharedPreferencesUtils>(),
        ));
    gh.factory<_i65.LogInEmployeeCubit>(() => _i65.LogInEmployeeCubit(
          gh<_i39.EmployeeBaseRepository>(),
          gh<_i12.SharedPreferencesUtils>(),
        ));
    gh.factory<_i66.PromoteEmployeeCubit>(() =>
        _i66.PromoteEmployeeCubit(gh<_i32.BranchManagerBaseRepository>()));
    gh.factory<_i67.RateEmployeeCubit>(
        () => _i67.RateEmployeeCubit(gh<_i32.BranchManagerBaseRepository>()));
    gh.factory<_i68.TrackingDriverCubit>(
        () => _i68.TrackingDriverCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i69.TripArchiveCubit>(
        () => _i69.TripArchiveCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i70.UpdateCustomerCubit>(
        () => _i70.UpdateCustomerCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i71.UpdateDriverCubit>(
        () => _i71.UpdateDriverCubit(gh<_i32.BranchManagerBaseRepository>()));
    gh.factory<_i72.UpdateEmployeeCubit>(
        () => _i72.UpdateEmployeeCubit(gh<_i32.BranchManagerBaseRepository>()));
    gh.factory<_i73.UpdateLocationDriverCubit>(
        () => _i73.UpdateLocationDriverCubit(gh<_i36.DriverBaseRepository>()));
    gh.factory<_i74.UpdateManifestCubit>(
        () => _i74.UpdateManifestCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i75.UpdateTruckCubit>(
        () => _i75.UpdateTruckCubit(gh<_i32.BranchManagerBaseRepository>()));
    gh.factory<_i76.AddCompliantCubit>(
        () => _i76.AddCompliantCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i77.AddCustomerCubit>(
        () => _i77.AddCustomerCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i78.AddEmployeeCubit>(
        () => _i78.AddEmployeeCubit(gh<_i32.BranchManagerBaseRepository>()));
    gh.factory<_i79.AddInvoiceCubit>(
        () => _i79.AddInvoiceCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i80.AddShippingCostCubit>(() =>
        _i80.AddShippingCostCubit(gh<_i32.BranchManagerBaseRepository>()));
    gh.factory<_i81.AddTripCubit>(
        () => _i81.AddTripCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i82.AddTruckCubit>(
        () => _i82.AddTruckCubit(gh<_i32.BranchManagerBaseRepository>()));
    gh.factory<_i83.AddVacationEmployeeCubit>(() =>
        _i83.AddVacationEmployeeCubit(gh<_i32.BranchManagerBaseRepository>()));
    gh.factory<_i84.AddVacationWarehouseCubit>(() =>
        _i84.AddVacationWarehouseCubit(gh<_i32.BranchManagerBaseRepository>()));
    gh.singleton<_i85.AdminBaseRepository>(() => _i85.AdminRepositoryImpl(
          networkInfo: gh<_i10.NetworkInfo>(),
          adminBaseWebService: gh<_i31.AdminBaseWebService>(),
        ));
    gh.factory<_i86.ArchiveTripCubit>(
        () => _i86.ArchiveTripCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i87.CancelTripCubit>(
        () => _i87.CancelTripCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i88.DeleteBranchCubit>(
        () => _i88.DeleteBranchCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i89.DeleteCustomerCubit>(
        () => _i89.DeleteCustomerCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i90.DeleteWarehouseCubit>(
        () => _i90.DeleteWarehouseCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i91.EditTripCubit>(
        () => _i91.EditTripCubit(gh<_i39.EmployeeBaseRepository>()));
    gh.factory<_i92.GetAllActiveTripsPaginatedCubit>(() =>
        _i92.GetAllActiveTripsPaginatedCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i93.GetAllArchiveTripsPaginatedCubit>(() =>
        _i93.GetAllArchiveTripsPaginatedCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i94.GetAllBranchesPaginatedCubit>(() =>
        _i94.GetAllBranchesPaginatedCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i95.GetAllCustomersPaginatedCubit>(() =>
        _i95.GetAllCustomersPaginatedCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i96.GetAllEmployeePaginatedCubit>(() =>
        _i96.GetAllEmployeePaginatedCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i97.GetAllTripsRecordPaginatedCubit>(() =>
        _i97.GetAllTripsRecordPaginatedCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i98.GetBranchEmployeeByIdCubit>(
        () => _i98.GetBranchEmployeeByIdCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i99.GetCustomerByIdCubit>(
        () => _i99.GetCustomerByIdCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i100.GetEmployeeByIdCubit>(
        () => _i100.GetEmployeeByIdCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i101.GetEmployeeVacationCubit>(
        () => _i101.GetEmployeeVacationCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i102.GetTripInformationCubit>(
        () => _i102.GetTripInformationCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i103.GetWarehouseManagerByIdCubit>(() =>
        _i103.GetWarehouseManagerByIdCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i104.GetWarehouseVacationCubit>(
        () => _i104.GetWarehouseVacationCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i105.LogInCubit>(() => _i105.LogInCubit(
          gh<_i85.AdminBaseRepository>(),
          gh<_i12.SharedPreferencesUtils>(),
        ));
    gh.factory<_i106.PromoteEmployeeCubit>(
        () => _i106.PromoteEmployeeCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i107.RegisterCubit>(() => _i107.RegisterCubit(
          gh<_i85.AdminBaseRepository>(),
          gh<_i12.SharedPreferencesUtils>(),
        ));
    gh.factory<_i108.TruckInformationCubit>(
        () => _i108.TruckInformationCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i109.TruckRecordCubit>(
        () => _i109.TruckRecordCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i110.UpdateBranchCubit>(
        () => _i110.UpdateBranchCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i111.UpdateWarehouseCubit>(
        () => _i111.UpdateWarehouseCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i112.AddBranchCubit>(
        () => _i112.AddBranchCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i113.AddBranchManagerCubit>(
        () => _i113.AddBranchManagerCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i114.AddWarehouseCubit>(
        () => _i114.AddWarehouseCubit(gh<_i85.AdminBaseRepository>()));
    gh.factory<_i115.AddWarehouseManagerCubit>(
        () => _i115.AddWarehouseManagerCubit(gh<_i85.AdminBaseRepository>()));
    return this;
  }
}

class _$ThirdPartyInjection extends _i116.ThirdPartyInjection {}
