// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:firebase_messaging/firebase_messaging.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;

import 'core/api/api_consumer.dart' as _i13;
import 'core/api/dio_consumer.dart' as _i14;
import 'core/api/logging_interceptor.dart' as _i5;
import 'core/error/error_interceptor.dart' as _i6;
import 'core/network/network_info.dart' as _i11;
import 'core/third_party_injection.dart' as _i124;
import 'core/utils/cubit/notification_cubit.dart' as _i12;
import 'core/utils/shared_preference_utils.dart' as _i10;
import 'features/admin/data/repository/admin_repository.dart' as _i46;
import 'features/admin/data/web_services/admin_web_service.dart' as _i16;
import 'features/admin/presentation/controllers/add_branch_cubit.dart' as _i74;
import 'features/admin/presentation/controllers/add_branch_manager_cubit.dart'
    as _i73;
import 'features/admin/presentation/controllers/add_warehouse_cubit.dart'
    as _i81;
import 'features/admin/presentation/controllers/add_warehouse_manager_cubit.dart'
    as _i71;
import 'features/admin/presentation/controllers/delete_branch_cubit.dart'
    as _i72;
import 'features/admin/presentation/controllers/delete_warehouse_cubit.dart'
    as _i68;
import 'features/admin/presentation/controllers/get_all_active_trips_paginated_cubit.dart'
    as _i66;
import 'features/admin/presentation/controllers/get_all_archive_trips_paginated_cubit.dart'
    as _i75;
import 'features/admin/presentation/controllers/get_all_branches_cubit.dart'
    as _i84;
import 'features/admin/presentation/controllers/get_all_customer_paginated_cubit.dart'
    as _i85;
import 'features/admin/presentation/controllers/get_all_employee_paginated_cubit.dart'
    as _i69;
import 'features/admin/presentation/controllers/get_branch_employee_cubit.dart'
    as _i78;
import 'features/admin/presentation/controllers/get_customer_by_id_cubit.dart'
    as _i83;
import 'features/admin/presentation/controllers/get_employee_by_id_cubit.dart'
    as _i63;
import 'features/admin/presentation/controllers/get_employee_vacation_cubit.dart'
    as _i62;
import 'features/admin/presentation/controllers/get_trip_information_cubit.dart'
    as _i77;
import 'features/admin/presentation/controllers/get_trips_record_paginated_cubit.dart'
    as _i67;
import 'features/admin/presentation/controllers/get_warehouse_manager_by_id_cubit.dart'
    as _i65;
import 'features/admin/presentation/controllers/get_warehouse_vacation_cubit.dart'
    as _i79;
import 'features/admin/presentation/controllers/log_in_cubit.dart' as _i109;
import 'features/admin/presentation/controllers/promote_employee_cubit.dart'
    as _i82;
import 'features/admin/presentation/controllers/register_cubit.dart' as _i110;
import 'features/admin/presentation/controllers/truck_information_cubit.dart'
    as _i64;
import 'features/admin/presentation/controllers/truck_record_cubit.dart'
    as _i80;
import 'features/admin/presentation/controllers/update_branch_cubit.dart'
    as _i76;
import 'features/admin/presentation/controllers/update_warehouse_cubit.dart'
    as _i70;
import 'features/branch_manager/data/repository/branch_manager_repository.dart'
    as _i47;
import 'features/branch_manager/data/web_services/branch_manager_web_services.dart'
    as _i21;
import 'features/branch_manager/presentation/controllers/add_employee_cubit.dart'
    as _i53;
import 'features/branch_manager/presentation/controllers/add_shipping_cost_cubit.dart'
    as _i49;
import 'features/branch_manager/presentation/controllers/add_truck_cubit.dart'
    as _i55;
import 'features/branch_manager/presentation/controllers/add_vacation_employee_cubit.dart'
    as _i58;
import 'features/branch_manager/presentation/controllers/add_vacation_warehouse_cubit.dart'
    as _i61;
import 'features/branch_manager/presentation/controllers/delete_driver_cubit.dart'
    as _i52;
import 'features/branch_manager/presentation/controllers/delete_employee_cubit.dart'
    as _i60;
import 'features/branch_manager/presentation/controllers/delete_truck_cubit.dart'
    as _i48;
import 'features/branch_manager/presentation/controllers/edit_shipping_cost_cubit.dart'
    as _i51;
import 'features/branch_manager/presentation/controllers/promote_employee_cubit.dart'
    as _i57;
import 'features/branch_manager/presentation/controllers/rate_employee_cubit.dart'
    as _i59;
import 'features/branch_manager/presentation/controllers/update_driver_cubit.dart'
    as _i50;
import 'features/branch_manager/presentation/controllers/update_employee_cubit.dart'
    as _i54;
import 'features/branch_manager/presentation/controllers/update_truck_cubit.dart'
    as _i56;
import 'features/driver/data/data_source/driver_web_services.dart' as _i15;
import 'features/driver/data/repository/driver_repository.dart' as _i19;
import 'features/driver/presentation/controllers/driver_log_in_cubit.dart'
    as _i22;
import 'features/driver/presentation/controllers/driver_profile_cubit.dart'
    as _i92;
import 'features/driver/presentation/controllers/edit_driver_profile_cubit.dart'
    as _i93;
import 'features/driver/presentation/controllers/get_all_my_trips_paginated_cubit.dart'
    as _i89;
import 'features/driver/presentation/controllers/get_branch_location_cubit.dart'
    as _i90;
import 'features/driver/presentation/controllers/get_shortest_path_cubit.dart'
    as _i91;
import 'features/driver/presentation/controllers/update_location_driver_cubit.dart'
    as _i88;
import 'features/employee/data/repository/employee_repository.dart' as _i23;
import 'features/employee/data/web_services/employee_web_services.dart' as _i18;
import 'features/employee/presentation/controller/add_compliant_cubit.dart'
    as _i32;
import 'features/employee/presentation/controller/add_customer_cubit.dart'
    as _i43;
import 'features/employee/presentation/controller/add_invoice_cubit.dart'
    as _i30;
import 'features/employee/presentation/controller/add_trip_cubit.dart' as _i31;
import 'features/employee/presentation/controller/archive_trip_cubit.dart'
    as _i25;
import 'features/employee/presentation/controller/cancel_trip_cubit.dart'
    as _i36;
import 'features/employee/presentation/controller/delete_customer_cubit.dart'
    as _i35;
import 'features/employee/presentation/controller/edit_trip_cubit.dart' as _i40;
import 'features/employee/presentation/controller/get_all_customers_paginated_cubit.dart'
    as _i27;
import 'features/employee/presentation/controller/get_all_receipt_cubit.dart'
    as _i24;
import 'features/employee/presentation/controller/get_all_trips_paginated_cubit.dart'
    as _i38;
import 'features/employee/presentation/controller/get_branch_location_employee_cubit.dart'
    as _i33;
import 'features/employee/presentation/controller/get_customer_by_id_cubit.dart'
    as _i37;
import 'features/employee/presentation/controller/get_customer_filter_cubit.dart'
    as _i44;
import 'features/employee/presentation/controller/get_profile_cubit.dart'
    as _i28;
import 'features/employee/presentation/controller/get_trip_report_cubit.dart'
    as _i29;
import 'features/employee/presentation/controller/get_truck_record_cubit.dart'
    as _i41;
import 'features/employee/presentation/controller/get_truck_report_cubit.dart'
    as _i45;
import 'features/employee/presentation/controller/log_in_employee_cubit.dart'
    as _i86;
import 'features/employee/presentation/controller/tracking_driver_cubit.dart'
    as _i39;
import 'features/employee/presentation/controller/trip_archive_cubit.dart'
    as _i26;
import 'features/employee/presentation/controller/update_customer_cubit.dart'
    as _i42;
import 'features/employee/presentation/controller/update_manifest_cubit.dart'
    as _i34;
import 'features/shared/data/repository/shared_repository.dart' as _i87;
import 'features/shared/data/web_services/shared_web_services.dart' as _i17;
import 'features/shared/presentation/controllers/forget_password_cubit.dart'
    as _i108;
import 'features/shared/presentation/controllers/get_all_active_trips_cubit.dart'
    as _i107;
import 'features/shared/presentation/controllers/get_all_archive_trips_cubit.dart'
    as _i106;
import 'features/shared/presentation/controllers/get_all_branches_cubit.dart'
    as _i105;
import 'features/shared/presentation/controllers/get_all_closed_trips_cubit.dart'
    as _i97;
import 'features/shared/presentation/controllers/get_all_drivers_cubit.dart'
    as _i98;
import 'features/shared/presentation/controllers/get_all_paginated_goods_cubit.dart'
    as _i95;
import 'features/shared/presentation/controllers/get_all_truck_record_paginted_cubit.dart'
    as _i101;
import 'features/shared/presentation/controllers/get_branch_details_cubit.dart'
    as _i103;
import 'features/shared/presentation/controllers/get_manifest_cubit.dart'
    as _i104;
import 'features/shared/presentation/controllers/get_roles_cubit.dart' as _i96;
import 'features/shared/presentation/controllers/get_shipping_prices_cubit.dart'
    as _i100;
import 'features/shared/presentation/controllers/get_trip_information_cubit.dart'
    as _i102;
import 'features/shared/presentation/controllers/get_truck_information_cubit.dart'
    as _i99;
import 'features/warehouse/data/data_source/remote_data_source.dart' as _i20;
import 'features/warehouse/data/repository/warehouse_repository.dart' as _i94;
import 'features/warehouse/presentation/controllers/add_good_cubit.dart'
    as _i115;
import 'features/warehouse/presentation/controllers/delete_good_cubit.dart'
    as _i120;
import 'features/warehouse/presentation/controllers/get_all_good_paginated_cubit.dart'
    as _i122;
import 'features/warehouse/presentation/controllers/get_archive_goods_paginated_cubit.dart'
    as _i114;
import 'features/warehouse/presentation/controllers/get_good_cubit.dart'
    as _i119;
import 'features/warehouse/presentation/controllers/get_manifest_cubit.dart'
    as _i121;
import 'features/warehouse/presentation/controllers/get_notification_cubit.dart'
    as _i111;
import 'features/warehouse/presentation/controllers/get_role_cubit.dart'
    as _i116;
import 'features/warehouse/presentation/controllers/getx/cubit/barcode_scanner_cubit.dart'
    as _i4;
import 'features/warehouse/presentation/controllers/getx/cubit/cubit/barcode_scanner_list_cubit.dart'
    as _i3;
import 'features/warehouse/presentation/controllers/inventory_good_cubit.dart'
    as _i112;
import 'features/warehouse/presentation/controllers/login_warehouse_cubit.dart'
    as _i123;
import 'features/warehouse/presentation/controllers/receiving_good_cubit.dart'
    as _i118;
import 'features/warehouse/presentation/controllers/send_trip_status_cubit.dart'
    as _i117;
import 'features/warehouse/presentation/controllers/warehouse_profile_cubit.dart'
    as _i113;

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
    gh.factory<_i3.BarcodeScannerListCubit>(
        () => _i3.BarcodeScannerListCubit());
    gh.factory<_i4.BarcodeScannerCubit>(() => _i4.BarcodeScannerCubit());
    gh.singleton<_i5.LoggingInterceptor>(() => _i5.LoggingInterceptor());
    gh.singleton<_i6.ErrorInterceptor>(() => _i6.ErrorInterceptor());
    gh.singleton<_i7.Dio>(() => thirdPartyInjection.dio);
    gh.singleton<_i8.InternetConnectionChecker>(
        () => thirdPartyInjection.internetConnectionChecker);
    gh.singleton<_i9.FirebaseMessaging>(
        () => thirdPartyInjection.firebaseMessaging);
    gh.singleton<_i10.SharedPreferencesUtils>(
        () => thirdPartyInjection.sharedPreferencesUtils);
    gh.lazySingleton<_i11.NetworkInfo>(() => _i11.NetworkInfoImpl(
        connectionChecker: gh<_i8.InternetConnectionChecker>()));
    gh.singleton<_i12.NotificationCubit>(
        () => _i12.NotificationCubit(gh<_i9.FirebaseMessaging>()));
    gh.singleton<_i13.ApiConsumer>(() => _i14.DioConsumer(gh<_i7.Dio>()));
    gh.singleton<_i15.DriverBaseWebServices>(
        () => _i15.DriverWebServicesImpl(apiConsumer: gh<_i13.ApiConsumer>()));
    gh.singleton<_i16.AdminBaseWebService>(
        () => _i16.AdminWebService(apiConsumer: gh<_i13.ApiConsumer>()));
    gh.singleton<_i17.SharedBaseWebServices>(
        () => _i17.SharedWebServiceImpl(apiConsumer: gh<_i13.ApiConsumer>()));
    gh.singleton<_i18.EmployeeBaseWebServices>(() =>
        _i18.EmployeeWebServicesImpl(apiConsumer: gh<_i13.ApiConsumer>()));
    gh.singleton<_i19.DriverBaseRepository>(() => _i19.DriverRepositoryImpl(
          networkInfo: gh<_i11.NetworkInfo>(),
          driverBaseWebServices: gh<_i15.DriverBaseWebServices>(),
        ));
    gh.singleton<_i20.BaseWarehouseRemoteDataSource>(() =>
        _i20.WarehouseRemoteDataSourceImpl(
            apiConsumer: gh<_i13.ApiConsumer>()));
    gh.singleton<_i21.BranchManagerBaseWebServices>(() =>
        _i21.BranchManagerWebServicesImpl(apiConsumer: gh<_i13.ApiConsumer>()));
    gh.factory<_i22.LogInDriverCubit>(() => _i22.LogInDriverCubit(
          gh<_i19.DriverBaseRepository>(),
          gh<_i10.SharedPreferencesUtils>(),
        ));
    gh.singleton<_i23.EmployeeBaseRepository>(() => _i23.EmployeeRepositoryImpl(
          networkInfo: gh<_i11.NetworkInfo>(),
          employeeBaseWebServices: gh<_i18.EmployeeBaseWebServices>(),
        ));
    gh.factory<_i24.GetAllReceiptCubit>(
        () => _i24.GetAllReceiptCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i25.ArchiveTripCubit>(
        () => _i25.ArchiveTripCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i26.TripArchiveCubit>(
        () => _i26.TripArchiveCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i27.GetAllCustomersEmployeePaginatedCubit>(() =>
        _i27.GetAllCustomersEmployeePaginatedCubit(
            gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i28.GetProfileCubit>(
        () => _i28.GetProfileCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i29.GetTripReportCubit>(
        () => _i29.GetTripReportCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i30.AddInvoiceCubit>(
        () => _i30.AddInvoiceCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i31.AddTripCubit>(
        () => _i31.AddTripCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i32.AddCompliantCubit>(
        () => _i32.AddCompliantCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i33.GetBranchLocationEmployeeCubit>(() =>
        _i33.GetBranchLocationEmployeeCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i34.UpdateManifestCubit>(
        () => _i34.UpdateManifestCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i35.DeleteCustomerCubit>(
        () => _i35.DeleteCustomerCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i36.CancelTripCubit>(
        () => _i36.CancelTripCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i37.GetCustomerByIdCubit>(
        () => _i37.GetCustomerByIdCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i38.GetAllTripsPaginatedCubit>(() =>
        _i38.GetAllTripsPaginatedCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i39.TrackingDriverCubit>(
        () => _i39.TrackingDriverCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i40.EditTripCubit>(
        () => _i40.EditTripCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i41.GetTruckRecordCubit>(
        () => _i41.GetTruckRecordCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i42.UpdateCustomerCubit>(
        () => _i42.UpdateCustomerCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i43.AddCustomerCubit>(
        () => _i43.AddCustomerCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i44.GetCustomerFilterCubit>(
        () => _i44.GetCustomerFilterCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.factory<_i45.GetTruckReportCubit>(
        () => _i45.GetTruckReportCubit(gh<_i23.EmployeeBaseRepository>()));
    gh.singleton<_i46.AdminBaseRepository>(() => _i46.AdminRepositoryImpl(
          networkInfo: gh<_i11.NetworkInfo>(),
          adminBaseWebService: gh<_i16.AdminBaseWebService>(),
        ));
    gh.singleton<_i47.BranchManagerBaseRepository>(() =>
        _i47.BranchManagerRepositoryImpl(
          networkInfo: gh<_i11.NetworkInfo>(),
          branchManagerBaseWebServices: gh<_i21.BranchManagerBaseWebServices>(),
        ));
    gh.factory<_i48.DeleteTruckCubit>(
        () => _i48.DeleteTruckCubit(gh<_i47.BranchManagerBaseRepository>()));
    gh.factory<_i49.AddShippingCostCubit>(() =>
        _i49.AddShippingCostCubit(gh<_i47.BranchManagerBaseRepository>()));
    gh.factory<_i50.UpdateDriverCubit>(
        () => _i50.UpdateDriverCubit(gh<_i47.BranchManagerBaseRepository>()));
    gh.factory<_i51.EditShippingCostCubit>(() =>
        _i51.EditShippingCostCubit(gh<_i47.BranchManagerBaseRepository>()));
    gh.factory<_i52.DeleteDriverCubit>(
        () => _i52.DeleteDriverCubit(gh<_i47.BranchManagerBaseRepository>()));
    gh.factory<_i53.AddEmployeeCubit>(
        () => _i53.AddEmployeeCubit(gh<_i47.BranchManagerBaseRepository>()));
    gh.factory<_i54.UpdateEmployeeCubit>(
        () => _i54.UpdateEmployeeCubit(gh<_i47.BranchManagerBaseRepository>()));
    gh.factory<_i55.AddTruckCubit>(
        () => _i55.AddTruckCubit(gh<_i47.BranchManagerBaseRepository>()));
    gh.factory<_i56.UpdateTruckCubit>(
        () => _i56.UpdateTruckCubit(gh<_i47.BranchManagerBaseRepository>()));
    gh.factory<_i57.PromoteEmployeeCubit>(() =>
        _i57.PromoteEmployeeCubit(gh<_i47.BranchManagerBaseRepository>()));
    gh.factory<_i58.AddVacationEmployeeCubit>(() =>
        _i58.AddVacationEmployeeCubit(gh<_i47.BranchManagerBaseRepository>()));
    gh.factory<_i59.RateEmployeeCubit>(
        () => _i59.RateEmployeeCubit(gh<_i47.BranchManagerBaseRepository>()));
    gh.factory<_i60.DeleteEmployeeCubit>(
        () => _i60.DeleteEmployeeCubit(gh<_i47.BranchManagerBaseRepository>()));
    gh.factory<_i61.AddVacationWarehouseCubit>(() =>
        _i61.AddVacationWarehouseCubit(gh<_i47.BranchManagerBaseRepository>()));
    gh.factory<_i62.GetEmployeeVacationCubit>(
        () => _i62.GetEmployeeVacationCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i63.GetEmployeeByIdCubit>(
        () => _i63.GetEmployeeByIdCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i64.TruckInformationCubit>(
        () => _i64.TruckInformationCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i65.GetWarehouseManagerByIdCubit>(() =>
        _i65.GetWarehouseManagerByIdCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i66.GetAllActiveTripsPaginatedCubit>(() =>
        _i66.GetAllActiveTripsPaginatedCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i67.GetAllTripsRecordPaginatedCubit>(() =>
        _i67.GetAllTripsRecordPaginatedCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i68.DeleteWarehouseCubit>(
        () => _i68.DeleteWarehouseCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i69.GetAllEmployeePaginatedCubit>(() =>
        _i69.GetAllEmployeePaginatedCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i70.UpdateWarehouseCubit>(
        () => _i70.UpdateWarehouseCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i71.AddWarehouseManagerCubit>(
        () => _i71.AddWarehouseManagerCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i72.DeleteBranchCubit>(
        () => _i72.DeleteBranchCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i73.AddBranchManagerCubit>(
        () => _i73.AddBranchManagerCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i74.AddBranchCubit>(
        () => _i74.AddBranchCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i75.GetAllArchiveTripsPaginatedCubit>(() =>
        _i75.GetAllArchiveTripsPaginatedCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i76.UpdateBranchCubit>(
        () => _i76.UpdateBranchCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i77.GetTripInformationCubit>(
        () => _i77.GetTripInformationCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i78.GetBranchEmployeeByIdCubit>(
        () => _i78.GetBranchEmployeeByIdCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i79.GetWarehouseVacationCubit>(
        () => _i79.GetWarehouseVacationCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i80.TruckRecordCubit>(
        () => _i80.TruckRecordCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i81.AddWarehouseCubit>(
        () => _i81.AddWarehouseCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i82.PromoteEmployeeCubit>(
        () => _i82.PromoteEmployeeCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i83.GetCustomerByIdCubit>(
        () => _i83.GetCustomerByIdCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i84.GetAllBranchesPaginatedCubit>(() =>
        _i84.GetAllBranchesPaginatedCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i85.GetAllCustomersPaginatedCubit>(() =>
        _i85.GetAllCustomersPaginatedCubit(gh<_i46.AdminBaseRepository>()));
    gh.factory<_i86.LogInEmployeeCubit>(() => _i86.LogInEmployeeCubit(
          gh<_i23.EmployeeBaseRepository>(),
          gh<_i10.SharedPreferencesUtils>(),
        ));
    gh.singleton<_i87.SharedBaseRepository>(() => _i87.SharedRepositoryImpl(
          sharedBaseWebServices: gh<_i17.SharedBaseWebServices>(),
          networkInfo: gh<_i11.NetworkInfo>(),
        ));
    gh.factory<_i88.UpdateLocationDriverCubit>(
        () => _i88.UpdateLocationDriverCubit(gh<_i19.DriverBaseRepository>()));
    gh.factory<_i89.GetAllMyTripsPaginatedCubit>(() =>
        _i89.GetAllMyTripsPaginatedCubit(gh<_i19.DriverBaseRepository>()));
    gh.factory<_i90.GetBranchLocationCubit>(
        () => _i90.GetBranchLocationCubit(gh<_i19.DriverBaseRepository>()));
    gh.factory<_i91.GetShortestPathCubit>(
        () => _i91.GetShortestPathCubit(gh<_i19.DriverBaseRepository>()));
    gh.factory<_i92.DriverProfileCubit>(
        () => _i92.DriverProfileCubit(gh<_i19.DriverBaseRepository>()));
    gh.factory<_i93.EditDriverProfileCubit>(
        () => _i93.EditDriverProfileCubit(gh<_i19.DriverBaseRepository>()));
    gh.singleton<_i94.BaseWarehouseRepository>(
        () => _i94.WarehouseRepositoryImpl(
              networkInfo: gh<_i11.NetworkInfo>(),
              baseWarehouseRemoteDataSource:
                  gh<_i20.BaseWarehouseRemoteDataSource>(),
            ));
    gh.factory<_i95.GetAllGoodsPaginatedSharedCubit>(() =>
        _i95.GetAllGoodsPaginatedSharedCubit(gh<_i87.SharedBaseRepository>()));
    gh.factory<_i96.GetRoleCubit>(
        () => _i96.GetRoleCubit(gh<_i87.SharedBaseRepository>()));
    gh.factory<_i97.GetAllClosedTripsPaginatedSharedCubit>(() =>
        _i97.GetAllClosedTripsPaginatedSharedCubit(
            gh<_i87.SharedBaseRepository>()));
    gh.factory<_i98.GetAllDriversSharedCubit>(
        () => _i98.GetAllDriversSharedCubit(gh<_i87.SharedBaseRepository>()));
    gh.factory<_i99.GetTruckInformationSharedCubit>(() =>
        _i99.GetTruckInformationSharedCubit(gh<_i87.SharedBaseRepository>()));
    gh.factory<_i100.GetShippingPricesPaginatedSharedCubit>(() =>
        _i100.GetShippingPricesPaginatedSharedCubit(
            gh<_i87.SharedBaseRepository>()));
    gh.factory<_i101.GetAllTruckRecordPaginatedSharedCubit>(() =>
        _i101.GetAllTruckRecordPaginatedSharedCubit(
            gh<_i87.SharedBaseRepository>()));
    gh.factory<_i102.GetTripInformationSharedCubit>(() =>
        _i102.GetTripInformationSharedCubit(gh<_i87.SharedBaseRepository>()));
    gh.factory<_i103.GetBranchDetailsSharedCubit>(() =>
        _i103.GetBranchDetailsSharedCubit(gh<_i87.SharedBaseRepository>()));
    gh.factory<_i104.GetManifestSharedCubit>(
        () => _i104.GetManifestSharedCubit(gh<_i87.SharedBaseRepository>()));
    gh.factory<_i105.GetAllBranchsPaginatedSharedCubit>(() =>
        _i105.GetAllBranchsPaginatedSharedCubit(
            gh<_i87.SharedBaseRepository>()));
    gh.factory<_i106.GetAllArchiveTripsPaginatedSharedCubit>(() =>
        _i106.GetAllArchiveTripsPaginatedSharedCubit(
            gh<_i87.SharedBaseRepository>()));
    gh.factory<_i107.GetAllActiveTripsPaginatedSharedCubit>(() =>
        _i107.GetAllActiveTripsPaginatedSharedCubit(
            gh<_i87.SharedBaseRepository>()));
    gh.factory<_i108.ForgetPasswordSharedCubit>(
        () => _i108.ForgetPasswordSharedCubit(gh<_i87.SharedBaseRepository>()));
    gh.factory<_i109.LogInCubit>(() => _i109.LogInCubit(
          gh<_i46.AdminBaseRepository>(),
          gh<_i10.SharedPreferencesUtils>(),
        ));
    gh.factory<_i110.RegisterCubit>(() => _i110.RegisterCubit(
          gh<_i46.AdminBaseRepository>(),
          gh<_i10.SharedPreferencesUtils>(),
        ));
    gh.factory<_i111.GetNotificationCubit>(
        () => _i111.GetNotificationCubit(gh<_i94.BaseWarehouseRepository>()));
    gh.factory<_i112.InventoryGoodCubit>(
        () => _i112.InventoryGoodCubit(gh<_i94.BaseWarehouseRepository>()));
    gh.factory<_i113.GetProfileWarehouseCubit>(() =>
        _i113.GetProfileWarehouseCubit(gh<_i94.BaseWarehouseRepository>()));
    gh.factory<_i114.GetArchiveGoodsPaginatedCubit>(() =>
        _i114.GetArchiveGoodsPaginatedCubit(
            gh<_i94.BaseWarehouseRepository>()));
    gh.factory<_i115.AddGoodCubit>(
        () => _i115.AddGoodCubit(gh<_i94.BaseWarehouseRepository>()));
    gh.factory<_i116.GetRoleCubit>(
        () => _i116.GetRoleCubit(gh<_i94.BaseWarehouseRepository>()));
    gh.factory<_i117.SendTripStatusCubit>(
        () => _i117.SendTripStatusCubit(gh<_i94.BaseWarehouseRepository>()));
    gh.factory<_i118.ReceivingGoodCubit>(
        () => _i118.ReceivingGoodCubit(gh<_i94.BaseWarehouseRepository>()));
    gh.factory<_i119.GetGoodCubit>(
        () => _i119.GetGoodCubit(gh<_i94.BaseWarehouseRepository>()));
    gh.factory<_i120.DeleteGoodCubit>(
        () => _i120.DeleteGoodCubit(gh<_i94.BaseWarehouseRepository>()));
    gh.factory<_i121.GetManifestWarehouseCubit>(() =>
        _i121.GetManifestWarehouseCubit(gh<_i94.BaseWarehouseRepository>()));
    gh.factory<_i122.GetAllGoodsPaginatedCubit>(() =>
        _i122.GetAllGoodsPaginatedCubit(gh<_i94.BaseWarehouseRepository>()));
    gh.factory<_i123.LogInWarehouseCubit>(() => _i123.LogInWarehouseCubit(
          gh<_i94.BaseWarehouseRepository>(),
          gh<_i10.SharedPreferencesUtils>(),
        ));
    return this;
  }
}

class _$ThirdPartyInjection extends _i124.ThirdPartyInjection {}
