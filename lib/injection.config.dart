// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;

import 'core/api/api_consumer.dart' as _i9;
import 'core/api/dio_consumer.dart' as _i10;
import 'core/api/logging_interceptor.dart' as _i6;
import 'core/error/error_interceptor.dart' as _i4;
import 'core/network/network_info.dart' as _i7;
import 'core/third_party_injection.dart' as _i95;
import 'core/utils/shared_preference_utils.dart' as _i8;
import 'features/admin/data/repository/admin_repository.dart' as _i64;
import 'features/admin/data/web_services/admin_web_service.dart' as _i14;
import 'features/admin/presentation/controllers/add_branch_cubit.dart' as _i91;
import 'features/admin/presentation/controllers/add_branch_manager_cubit.dart'
    as _i92;
import 'features/admin/presentation/controllers/add_warehouse_cubit.dart'
    as _i93;
import 'features/admin/presentation/controllers/add_warehouse_manager_cubit.dart'
    as _i94;
import 'features/admin/presentation/controllers/delete_branch_cubit.dart'
    as _i67;
import 'features/admin/presentation/controllers/delete_warehouse_cubit.dart'
    as _i69;
import 'features/admin/presentation/controllers/get_all_active_trips_paginated_cubit.dart'
    as _i71;
import 'features/admin/presentation/controllers/get_all_archive_trips_paginated_cubit.dart'
    as _i72;
import 'features/admin/presentation/controllers/get_all_branches_cubit.dart'
    as _i73;
import 'features/admin/presentation/controllers/get_all_customer_paginated_cubit.dart'
    as _i74;
import 'features/admin/presentation/controllers/get_all_employee_paginated_cubit.dart'
    as _i75;
import 'features/admin/presentation/controllers/get_branch_employee_cubit.dart'
    as _i77;
import 'features/admin/presentation/controllers/get_customer_by_id_cubit.dart'
    as _i78;
import 'features/admin/presentation/controllers/get_employee_by_id_cubit.dart'
    as _i79;
import 'features/admin/presentation/controllers/get_employee_vacation_cubit.dart'
    as _i80;
import 'features/admin/presentation/controllers/get_trip_information_cubit.dart'
    as _i81;
import 'features/admin/presentation/controllers/get_trips_record_paginated_cubit.dart'
    as _i76;
import 'features/admin/presentation/controllers/get_warehouse_manager_by_id_cubit.dart'
    as _i82;
import 'features/admin/presentation/controllers/get_warehouse_vacation_cubit.dart'
    as _i83;
import 'features/admin/presentation/controllers/log_in_cubit.dart' as _i84;
import 'features/admin/presentation/controllers/promote_employee_cubit.dart'
    as _i85;
import 'features/admin/presentation/controllers/register_cubit.dart' as _i86;
import 'features/admin/presentation/controllers/truck_information_cubit.dart'
    as _i87;
import 'features/admin/presentation/controllers/truck_record_cubit.dart'
    as _i88;
import 'features/admin/presentation/controllers/update_branch_cubit.dart'
    as _i89;
import 'features/admin/presentation/controllers/update_warehouse_cubit.dart'
    as _i90;
import 'features/branch_manager/data/repository/branch_manager_repository.dart'
    as _i15;
import 'features/branch_manager/data/web_services/branch_manager_web_services.dart'
    as _i11;
import 'features/branch_manager/presentation/controllers/add_employee_cubit.dart'
    as _i57;
import 'features/branch_manager/presentation/controllers/add_shipping_cost_cubit.dart'
    as _i59;
import 'features/branch_manager/presentation/controllers/add_truck_cubit.dart'
    as _i61;
import 'features/branch_manager/presentation/controllers/add_vacation_employee_cubit.dart'
    as _i62;
import 'features/branch_manager/presentation/controllers/add_vacation_warehouse_cubit.dart'
    as _i63;
import 'features/branch_manager/presentation/controllers/delete_driver_cubit.dart'
    as _i16;
import 'features/branch_manager/presentation/controllers/delete_employee_cubit.dart'
    as _i17;
import 'features/branch_manager/presentation/controllers/delete_truck_cubit.dart'
    as _i18;
import 'features/branch_manager/presentation/controllers/edit_shipping_cost_cubit.dart'
    as _i21;
import 'features/branch_manager/presentation/controllers/promote_employee_cubit.dart'
    as _i45;
import 'features/branch_manager/presentation/controllers/rate_employee_cubit.dart'
    as _i46;
import 'features/branch_manager/presentation/controllers/update_driver_cubit.dart'
    as _i50;
import 'features/branch_manager/presentation/controllers/update_employee_cubit.dart'
    as _i51;
import 'features/branch_manager/presentation/controllers/update_truck_cubit.dart'
    as _i54;
import 'features/driver/data/data_source/driver_web_services.dart' as _i12;
import 'features/driver/data/repository/driver_repository.dart' as _i19;
import 'features/driver/presentation/controllers/driver_log_in_cubit.dart'
    as _i44;
import 'features/driver/presentation/controllers/driver_profile_cubit.dart'
    as _i20;
import 'features/driver/presentation/controllers/get_all_my_trips_paginated_cubit.dart'
    as _i29;
import 'features/driver/presentation/controllers/get_branch_location_cubit.dart'
    as _i34;
import 'features/driver/presentation/controllers/get_shortest_path_cubit.dart'
    as _i38;
import 'features/driver/presentation/controllers/update_location_driver_cubit.dart'
    as _i52;
import 'features/employee/data/repository/employee_repository.dart' as _i22;
import 'features/employee/data/web_services/employee_web_services.dart' as _i13;
import 'features/employee/presentation/controller/add_compliant_cubit.dart'
    as _i55;
import 'features/employee/presentation/controller/add_customer_cubit.dart'
    as _i56;
import 'features/employee/presentation/controller/add_invoice_cubit.dart'
    as _i58;
import 'features/employee/presentation/controller/add_trip_cubit.dart' as _i60;
import 'features/employee/presentation/controller/archive_trip_cubit.dart'
    as _i65;
import 'features/employee/presentation/controller/cancel_trip_cubit.dart'
    as _i66;
import 'features/employee/presentation/controller/delete_customer_cubit.dart'
    as _i68;
import 'features/employee/presentation/controller/edit_trip_cubit.dart' as _i70;
import 'features/employee/presentation/controller/get_all_active_trips_paginated_cubit.dart'
    as _i23;
import 'features/employee/presentation/controller/get_all_archive_trips_paginated_cubit.dart'
    as _i24;
import 'features/employee/presentation/controller/get_all_branches_paginated_cubit.dart'
    as _i25;
import 'features/employee/presentation/controller/get_all_customers_paginated_cubit.dart'
    as _i26;
import 'features/employee/presentation/controller/get_all_destination_cubit.dart'
    as _i27;
import 'features/employee/presentation/controller/get_all_drivers_cubit.dart'
    as _i28;
import 'features/employee/presentation/controller/get_all_receipt_cubit.dart'
    as _i30;
import 'features/employee/presentation/controller/get_all_trips_paginated_cubit.dart'
    as _i31;
import 'features/employee/presentation/controller/get_all_truck_record_paginated_cubit.dart'
    as _i32;
import 'features/employee/presentation/controller/get_branch_by_id_cubit.dart'
    as _i33;
import 'features/employee/presentation/controller/get_branch_location_employee_cubit.dart'
    as _i35;
import 'features/employee/presentation/controller/get_customer_by_id_cubit.dart'
    as _i36;
import 'features/employee/presentation/controller/get_manifest_cubit.dart'
    as _i37;
import 'features/employee/presentation/controller/get_trip_report_cubit.dart'
    as _i39;
import 'features/employee/presentation/controller/get_trips_info_cubit.dart'
    as _i40;
import 'features/employee/presentation/controller/get_truck_information_cubit.dart'
    as _i41;
import 'features/employee/presentation/controller/get_truck_record_cubit.dart'
    as _i42;
import 'features/employee/presentation/controller/get_truck_report_cubit.dart'
    as _i43;
import 'features/employee/presentation/controller/tracking_driver_cubit.dart'
    as _i47;
import 'features/employee/presentation/controller/trip_archive_cubit.dart'
    as _i48;
import 'features/employee/presentation/controller/update_customer_cubit.dart'
    as _i49;
import 'features/employee/presentation/controller/update_manifest_cubit.dart'
    as _i53;

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
    gh.singleton<_i3.Dio>(() => thirdPartyInjection.dio);
    gh.singleton<_i4.ErrorInterceptor>(() => _i4.ErrorInterceptor());
    gh.singleton<_i5.InternetConnectionChecker>(
        () => thirdPartyInjection.internetConnectionChecker);
    gh.singleton<_i6.LoggingInterceptor>(() => _i6.LoggingInterceptor());
    gh.lazySingleton<_i7.NetworkInfo>(() => _i7.NetworkInfoImpl(
        connectionChecker: gh<_i5.InternetConnectionChecker>()));
    gh.singleton<_i8.SharedPreferencesUtils>(
        () => thirdPartyInjection.sharedPreferencesUtils);
    gh.singleton<_i9.ApiConsumer>(() => _i10.DioConsumer(gh<_i3.Dio>()));
    gh.singleton<_i11.BranchManagerBaseWebServices>(() =>
        _i11.BranchManagerWebServicesImpl(apiConsumer: gh<_i9.ApiConsumer>()));
    gh.singleton<_i12.DriverBaseWebServices>(
        () => _i12.DriverWebServicesImpl(apiConsumer: gh<_i9.ApiConsumer>()));
    gh.singleton<_i13.EmployeeBaseWebServices>(
        () => _i13.EmployeeWebServicesImpl(apiConsumer: gh<_i9.ApiConsumer>()));
    gh.singleton<_i14.AdminBaseWebService>(
        () => _i14.AdminWebService(apiConsumer: gh<_i9.ApiConsumer>()));
    gh.singleton<_i15.BranchManagerBaseRepository>(() =>
        _i15.BranchManagerRepositoryImpl(
          networkInfo: gh<_i7.NetworkInfo>(),
          branchManagerBaseWebServices: gh<_i11.BranchManagerBaseWebServices>(),
        ));
    gh.factory<_i16.DeleteDriverCubit>(
        () => _i16.DeleteDriverCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i17.DeleteEmployeeCubit>(
        () => _i17.DeleteEmployeeCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i18.DeleteTruckCubit>(
        () => _i18.DeleteTruckCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.singleton<_i19.DriverBaseRepository>(() => _i19.DriverRepositoryImpl(
          networkInfo: gh<_i7.NetworkInfo>(),
          driverBaseWebServices: gh<_i12.DriverBaseWebServices>(),
        ));
    gh.factory<_i20.DriverProfileCubit>(
        () => _i20.DriverProfileCubit(gh<_i19.DriverBaseRepository>()));
    gh.factory<_i21.EditShippingCostCubit>(() =>
        _i21.EditShippingCostCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.singleton<_i22.EmployeeBaseRepository>(() => _i22.EmployeeRepositoryImpl(
          networkInfo: gh<_i7.NetworkInfo>(),
          employeeBaseWebServices: gh<_i13.EmployeeBaseWebServices>(),
        ));
    gh.factory<_i23.GetAllActiveTripsPaginatedCubit>(() =>
        _i23.GetAllActiveTripsPaginatedCubit(
            gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i24.GetAllArchiveTripsPaginatedCubit>(() =>
        _i24.GetAllArchiveTripsPaginatedCubit(
            gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i25.GetAllBranchesPaginatedCubit>(() =>
        _i25.GetAllBranchesPaginatedCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i26.GetAllCustomersEmployeePaginatedCubit>(() =>
        _i26.GetAllCustomersEmployeePaginatedCubit(
            gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i27.GetAllDestinationCubit>(
        () => _i27.GetAllDestinationCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i28.GetAllDriversCubit>(
        () => _i28.GetAllDriversCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i29.GetAllMyTripsPaginatedCubit>(() =>
        _i29.GetAllMyTripsPaginatedCubit(gh<_i19.DriverBaseRepository>()));
    gh.factory<_i30.GetAllReceiptCubit>(
        () => _i30.GetAllReceiptCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i31.GetAllTripsPaginatedCubit>(() =>
        _i31.GetAllTripsPaginatedCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i32.GetAllTruckRecordPaginatedCubit>(() =>
        _i32.GetAllTruckRecordPaginatedCubit(
            gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i33.GetBranchByIdEmployeeCubit>(() =>
        _i33.GetBranchByIdEmployeeCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i34.GetBranchLocationCubit>(
        () => _i34.GetBranchLocationCubit(gh<_i19.DriverBaseRepository>()));
    gh.factory<_i35.GetBranchLocationEmployeeCubit>(() =>
        _i35.GetBranchLocationEmployeeCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i36.GetCustomerByIdCubit>(
        () => _i36.GetCustomerByIdCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i37.GetManifestCubit>(
        () => _i37.GetManifestCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i38.GetShortestPathCubit>(
        () => _i38.GetShortestPathCubit(gh<_i19.DriverBaseRepository>()));
    gh.factory<_i39.GetTripReportCubit>(
        () => _i39.GetTripReportCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i40.GetTripsInfoCubit>(
        () => _i40.GetTripsInfoCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i41.GetTruckInformationCubit>(
        () => _i41.GetTruckInformationCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i42.GetTruckRecordCubit>(
        () => _i42.GetTruckRecordCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i43.GetTruckReportCubit>(
        () => _i43.GetTruckReportCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i44.LogInDriverCubit>(() => _i44.LogInDriverCubit(
          gh<_i19.DriverBaseRepository>(),
          gh<_i8.SharedPreferencesUtils>(),
        ));
    gh.factory<_i45.PromoteEmployeeCubit>(() =>
        _i45.PromoteEmployeeCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i46.RateEmployeeCubit>(
        () => _i46.RateEmployeeCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i47.TrackingDriverCubit>(
        () => _i47.TrackingDriverCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i48.TripArchiveCubit>(
        () => _i48.TripArchiveCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i49.UpdateCustomerCubit>(
        () => _i49.UpdateCustomerCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i50.UpdateDriverCubit>(
        () => _i50.UpdateDriverCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i51.UpdateEmployeeCubit>(
        () => _i51.UpdateEmployeeCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i52.UpdateLocationDriverCubit>(
        () => _i52.UpdateLocationDriverCubit(gh<_i19.DriverBaseRepository>()));
    gh.factory<_i53.UpdateManifestCubit>(
        () => _i53.UpdateManifestCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i54.UpdateTruckCubit>(
        () => _i54.UpdateTruckCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i55.AddCompliantCubit>(
        () => _i55.AddCompliantCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i56.AddCustomerCubit>(
        () => _i56.AddCustomerCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i57.AddEmployeeCubit>(
        () => _i57.AddEmployeeCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i58.AddInvoiceCubit>(
        () => _i58.AddInvoiceCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i59.AddShippingCostCubit>(() =>
        _i59.AddShippingCostCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i60.AddTripCubit>(
        () => _i60.AddTripCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i61.AddTruckCubit>(
        () => _i61.AddTruckCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i62.AddVacationEmployeeCubit>(() =>
        _i62.AddVacationEmployeeCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i63.AddVacationWarehouseCubit>(() =>
        _i63.AddVacationWarehouseCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.singleton<_i64.AdminBaseRepository>(() => _i64.AdminRepositoryImpl(
          networkInfo: gh<_i7.NetworkInfo>(),
          adminBaseWebService: gh<_i14.AdminBaseWebService>(),
        ));
    gh.factory<_i65.ArchiveTripCubit>(
        () => _i65.ArchiveTripCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i66.CancelTripCubit>(
        () => _i66.CancelTripCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i67.DeleteBranchCubit>(
        () => _i67.DeleteBranchCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i68.DeleteCustomerCubit>(
        () => _i68.DeleteCustomerCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i69.DeleteWarehouseCubit>(
        () => _i69.DeleteWarehouseCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i70.EditTripCubit>(
        () => _i70.EditTripCubit(gh<_i22.EmployeeBaseRepository>()));
    gh.factory<_i71.GetAllActiveTripsPaginatedCubit>(() =>
        _i71.GetAllActiveTripsPaginatedCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i72.GetAllArchiveTripsPaginatedCubit>(() =>
        _i72.GetAllArchiveTripsPaginatedCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i73.GetAllBranchesPaginatedCubit>(() =>
        _i73.GetAllBranchesPaginatedCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i74.GetAllCustomersPaginatedCubit>(() =>
        _i74.GetAllCustomersPaginatedCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i75.GetAllEmployeePaginatedCubit>(() =>
        _i75.GetAllEmployeePaginatedCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i76.GetAllTripsRecordPaginatedCubit>(() =>
        _i76.GetAllTripsRecordPaginatedCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i77.GetBranchEmployeeByIdCubit>(
        () => _i77.GetBranchEmployeeByIdCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i78.GetCustomerByIdCubit>(
        () => _i78.GetCustomerByIdCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i79.GetEmployeeByIdCubit>(
        () => _i79.GetEmployeeByIdCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i80.GetEmployeeVacationCubit>(
        () => _i80.GetEmployeeVacationCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i81.GetTripInformationCubit>(
        () => _i81.GetTripInformationCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i82.GetWarehouseManagerByIdCubit>(() =>
        _i82.GetWarehouseManagerByIdCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i83.GetWarehouseVacationCubit>(
        () => _i83.GetWarehouseVacationCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i84.LogInCubit>(() => _i84.LogInCubit(
          gh<_i64.AdminBaseRepository>(),
          gh<_i8.SharedPreferencesUtils>(),
        ));
    gh.factory<_i85.PromoteEmployeeCubit>(
        () => _i85.PromoteEmployeeCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i86.RegisterCubit>(() => _i86.RegisterCubit(
          gh<_i64.AdminBaseRepository>(),
          gh<_i8.SharedPreferencesUtils>(),
        ));
    gh.factory<_i87.TruckInformationCubit>(
        () => _i87.TruckInformationCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i88.TruckRecordCubit>(
        () => _i88.TruckRecordCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i89.UpdateBranchCubit>(
        () => _i89.UpdateBranchCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i90.UpdateWarehouseCubit>(
        () => _i90.UpdateWarehouseCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i91.AddBranchCubit>(
        () => _i91.AddBranchCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i92.AddBranchManagerCubit>(
        () => _i92.AddBranchManagerCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i93.AddWarehouseCubit>(
        () => _i93.AddWarehouseCubit(gh<_i64.AdminBaseRepository>()));
    gh.factory<_i94.AddWarehouseManagerCubit>(
        () => _i94.AddWarehouseManagerCubit(gh<_i64.AdminBaseRepository>()));
    return this;
  }
}

class _$ThirdPartyInjection extends _i95.ThirdPartyInjection {}
