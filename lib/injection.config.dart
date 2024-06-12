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
import 'core/third_party_injection.dart' as _i84;
import 'core/utils/shared_preference_utils.dart' as _i8;
import 'features/admin/data/repository/admin_repository.dart' as _i54;
import 'features/admin/data/web_services/admin_web_service.dart' as _i14;
import 'features/admin/presentation/controllers/add_branch_cubit.dart' as _i80;
import 'features/admin/presentation/controllers/add_branch_manager_cubit.dart'
    as _i81;
import 'features/admin/presentation/controllers/add_warehouse_cubit.dart'
    as _i82;
import 'features/admin/presentation/controllers/add_warehouse_manager_cubit.dart'
    as _i83;
import 'features/admin/presentation/controllers/delete_branch_cubit.dart'
    as _i56;
import 'features/admin/presentation/controllers/delete_warehouse_cubit.dart'
    as _i58;
import 'features/admin/presentation/controllers/get_all_active_trips_paginated_cubit.dart'
    as _i60;
import 'features/admin/presentation/controllers/get_all_archive_trips_paginated_cubit.dart'
    as _i61;
import 'features/admin/presentation/controllers/get_all_branches_cubit.dart'
    as _i62;
import 'features/admin/presentation/controllers/get_all_customer_paginated_cubit.dart'
    as _i63;
import 'features/admin/presentation/controllers/get_all_employee_paginated_cubit.dart'
    as _i64;
import 'features/admin/presentation/controllers/get_branch_employee_cubit.dart'
    as _i66;
import 'features/admin/presentation/controllers/get_customer_by_id_cubit.dart'
    as _i67;
import 'features/admin/presentation/controllers/get_employee_by_id_cubit.dart'
    as _i68;
import 'features/admin/presentation/controllers/get_employee_vacation_cubit.dart'
    as _i69;
import 'features/admin/presentation/controllers/get_trip_information_cubit.dart'
    as _i70;
import 'features/admin/presentation/controllers/get_trips_record_paginated_cubit.dart'
    as _i65;
import 'features/admin/presentation/controllers/get_warehouse_manager_by_id_cubit.dart'
    as _i71;
import 'features/admin/presentation/controllers/get_warehouse_vacation_cubit.dart'
    as _i72;
import 'features/admin/presentation/controllers/log_in_cubit.dart' as _i73;
import 'features/admin/presentation/controllers/promote_employee_cubit.dart'
    as _i74;
import 'features/admin/presentation/controllers/register_cubit.dart' as _i75;
import 'features/admin/presentation/controllers/truck_information_cubit.dart'
    as _i76;
import 'features/admin/presentation/controllers/truck_record_cubit.dart'
    as _i77;
import 'features/admin/presentation/controllers/update_branch_cubit.dart'
    as _i78;
import 'features/admin/presentation/controllers/update_warehouse_cubit.dart'
    as _i79;
import 'features/branch_manager/data/repository/branch_manager_repository.dart'
    as _i15;
import 'features/branch_manager/data/web_services/branch_manager_web_services.dart'
    as _i11;
import 'features/branch_manager/presentation/controllers/add_employee_cubit.dart'
    as _i47;
import 'features/branch_manager/presentation/controllers/add_shipping_cost_cubit.dart'
    as _i49;
import 'features/branch_manager/presentation/controllers/add_truck_cubit.dart'
    as _i51;
import 'features/branch_manager/presentation/controllers/add_vacation_employee_cubit.dart'
    as _i52;
import 'features/branch_manager/presentation/controllers/add_vacation_warehouse_cubit.dart'
    as _i53;
import 'features/branch_manager/presentation/controllers/delete_driver_cubit.dart'
    as _i16;
import 'features/branch_manager/presentation/controllers/delete_employee_cubit.dart'
    as _i17;
import 'features/branch_manager/presentation/controllers/delete_truck_cubit.dart'
    as _i18;
import 'features/branch_manager/presentation/controllers/edit_shipping_cost_cubit.dart'
    as _i20;
import 'features/branch_manager/presentation/controllers/promote_employee_cubit.dart'
    as _i37;
import 'features/branch_manager/presentation/controllers/rate_employee_cubit.dart'
    as _i38;
import 'features/branch_manager/presentation/controllers/update_driver_cubit.dart'
    as _i41;
import 'features/branch_manager/presentation/controllers/update_employee_cubit.dart'
    as _i42;
import 'features/branch_manager/presentation/controllers/update_truck_cubit.dart'
    as _i44;
import 'features/driver/data/data_source/driver_web_services.dart' as _i12;
import 'features/driver/data/repository/driver_repository.dart' as _i19;
import 'features/driver/presentation/controllers/driver_log_in_cubit.dart'
    as _i36;
import 'features/driver/presentation/controllers/get_all_my_trips_paginated_cubit.dart'
    as _i25;
import 'features/driver/presentation/controllers/get_branch_location_cubit.dart'
    as _i29;
import 'features/employee/data/repository/employee_repository.dart' as _i21;
import 'features/employee/data/web_services/employee_web_services.dart' as _i13;
import 'features/employee/presentation/controller/add_compliant_cubit.dart'
    as _i45;
import 'features/employee/presentation/controller/add_customer_cubit.dart'
    as _i46;
import 'features/employee/presentation/controller/add_invoice_cubit.dart'
    as _i48;
import 'features/employee/presentation/controller/add_trip_cubit.dart' as _i50;
import 'features/employee/presentation/controller/cancel_trip_cubit.dart'
    as _i55;
import 'features/employee/presentation/controller/delete_customer_cubit.dart'
    as _i57;
import 'features/employee/presentation/controller/edit_trip_cubit.dart' as _i59;
import 'features/employee/presentation/controller/get_all_active_trips_paginated_cubit.dart'
    as _i22;
import 'features/employee/presentation/controller/get_all_archive_trips_paginated_cubit.dart'
    as _i23;
import 'features/employee/presentation/controller/get_all_branches_paginated_cubit.dart'
    as _i24;
import 'features/employee/presentation/controller/get_all_receipt_cubit.dart'
    as _i26;
import 'features/employee/presentation/controller/get_all_trips_paginated_cubit.dart'
    as _i27;
import 'features/employee/presentation/controller/get_all_truck_record_paginated_cubit.dart'
    as _i28;
import 'features/employee/presentation/controller/get_manifest_cubit.dart'
    as _i30;
import 'features/employee/presentation/controller/get_trip_report_cubit.dart'
    as _i31;
import 'features/employee/presentation/controller/get_trips_info_cubit.dart'
    as _i32;
import 'features/employee/presentation/controller/get_truck_information_cubit.dart'
    as _i33;
import 'features/employee/presentation/controller/get_truck_record_cubit.dart'
    as _i34;
import 'features/employee/presentation/controller/get_truck_report_cubit.dart'
    as _i35;
import 'features/employee/presentation/controller/trip_archive_cubit.dart'
    as _i39;
import 'features/employee/presentation/controller/update_customer_cubit.dart'
    as _i40;
import 'features/employee/presentation/controller/update_manifest_cubit.dart'
    as _i43;

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
    gh.factory<_i20.EditShippingCostCubit>(() =>
        _i20.EditShippingCostCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.singleton<_i21.EmployeeBaseRepository>(() => _i21.EmployeeRepositoryImpl(
          networkInfo: gh<_i7.NetworkInfo>(),
          employeeBaseWebServices: gh<_i13.EmployeeBaseWebServices>(),
        ));
    gh.factory<_i22.GetAllActiveTripsPaginatedCubit>(() =>
        _i22.GetAllActiveTripsPaginatedCubit(
            gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i23.GetAllArchiveTripsPaginatedCubit>(() =>
        _i23.GetAllArchiveTripsPaginatedCubit(
            gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i24.GetAllBranchesPaginatedCubit>(() =>
        _i24.GetAllBranchesPaginatedCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i25.GetAllMyTripsPaginatedCubit>(() =>
        _i25.GetAllMyTripsPaginatedCubit(gh<_i19.DriverBaseRepository>()));
    gh.factory<_i26.GetAllReceiptCubit>(
        () => _i26.GetAllReceiptCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i27.GetAllTripsPaginatedCubit>(() =>
        _i27.GetAllTripsPaginatedCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i28.GetAllTruckRecordPaginatedCubit>(() =>
        _i28.GetAllTruckRecordPaginatedCubit(
            gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i29.GetBranchLocationCubit>(
        () => _i29.GetBranchLocationCubit(gh<_i19.DriverBaseRepository>()));
    gh.factory<_i30.GetManifestCubit>(
        () => _i30.GetManifestCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i31.GetTripReportCubit>(
        () => _i31.GetTripReportCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i32.GetTripsInfoCubit>(
        () => _i32.GetTripsInfoCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i33.GetTruckInformationCubit>(
        () => _i33.GetTruckInformationCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i34.GetTruckRecordCubit>(
        () => _i34.GetTruckRecordCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i35.GetTruckReportCubit>(
        () => _i35.GetTruckReportCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i36.LogInDriverCubit>(() => _i36.LogInDriverCubit(
          gh<_i19.DriverBaseRepository>(),
          gh<_i8.SharedPreferencesUtils>(),
        ));
    gh.factory<_i37.PromoteEmployeeCubit>(() =>
        _i37.PromoteEmployeeCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i38.RateEmployeeCubit>(
        () => _i38.RateEmployeeCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i39.TripArchiveCubit>(
        () => _i39.TripArchiveCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i40.UpdateCustomerCubit>(
        () => _i40.UpdateCustomerCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i41.UpdateDriverCubit>(
        () => _i41.UpdateDriverCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i42.UpdateEmployeeCubit>(
        () => _i42.UpdateEmployeeCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i43.UpdateManifestCubit>(
        () => _i43.UpdateManifestCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i44.UpdateTruckCubit>(
        () => _i44.UpdateTruckCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i45.AddCompliantCubit>(
        () => _i45.AddCompliantCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i46.AddCustomerCubit>(
        () => _i46.AddCustomerCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i47.AddEmployeeCubit>(
        () => _i47.AddEmployeeCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i48.AddInvoiceCubit>(
        () => _i48.AddInvoiceCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i49.AddShippingCostCubit>(() =>
        _i49.AddShippingCostCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i50.AddTripCubit>(
        () => _i50.AddTripCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i51.AddTruckCubit>(
        () => _i51.AddTruckCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i52.AddVacationEmployeeCubit>(() =>
        _i52.AddVacationEmployeeCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.factory<_i53.AddVacationWarehouseCubit>(() =>
        _i53.AddVacationWarehouseCubit(gh<_i15.BranchManagerBaseRepository>()));
    gh.singleton<_i54.AdminBaseRepository>(() => _i54.AdminRepositoryImpl(
          networkInfo: gh<_i7.NetworkInfo>(),
          adminBaseWebService: gh<_i14.AdminBaseWebService>(),
        ));
    gh.factory<_i55.CancelTripCubit>(
        () => _i55.CancelTripCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i56.DeleteBranchCubit>(
        () => _i56.DeleteBranchCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i57.DeleteCustomerCubit>(
        () => _i57.DeleteCustomerCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i58.DeleteWarehouseCubit>(
        () => _i58.DeleteWarehouseCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i59.EditTripCubit>(
        () => _i59.EditTripCubit(gh<_i21.EmployeeBaseRepository>()));
    gh.factory<_i60.GetAllActiveTripsPaginatedCubit>(() =>
        _i60.GetAllActiveTripsPaginatedCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i61.GetAllArchiveTripsPaginatedCubit>(() =>
        _i61.GetAllArchiveTripsPaginatedCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i62.GetAllBranchesPaginatedCubit>(() =>
        _i62.GetAllBranchesPaginatedCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i63.GetAllCustomersPaginatedCubit>(() =>
        _i63.GetAllCustomersPaginatedCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i64.GetAllEmployeePaginatedCubit>(() =>
        _i64.GetAllEmployeePaginatedCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i65.GetAllTripsRecordPaginatedCubit>(() =>
        _i65.GetAllTripsRecordPaginatedCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i66.GetBranchEmployeeByIdCubit>(
        () => _i66.GetBranchEmployeeByIdCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i67.GetCustomerByIdCubit>(
        () => _i67.GetCustomerByIdCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i68.GetEmployeeByIdCubit>(
        () => _i68.GetEmployeeByIdCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i69.GetEmployeeVacationCubit>(
        () => _i69.GetEmployeeVacationCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i70.GetTripInformationCubit>(
        () => _i70.GetTripInformationCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i71.GetWarehouseManagerByIdCubit>(() =>
        _i71.GetWarehouseManagerByIdCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i72.GetWarehouseVacationCubit>(
        () => _i72.GetWarehouseVacationCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i73.LogInCubit>(() => _i73.LogInCubit(
          gh<_i54.AdminBaseRepository>(),
          gh<_i8.SharedPreferencesUtils>(),
        ));
    gh.factory<_i74.PromoteEmployeeCubit>(
        () => _i74.PromoteEmployeeCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i75.RegisterCubit>(() => _i75.RegisterCubit(
          gh<_i54.AdminBaseRepository>(),
          gh<_i8.SharedPreferencesUtils>(),
        ));
    gh.factory<_i76.TruckInformationCubit>(
        () => _i76.TruckInformationCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i77.TruckRecordCubit>(
        () => _i77.TruckRecordCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i78.UpdateBranchCubit>(
        () => _i78.UpdateBranchCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i79.UpdateWarehouseCubit>(
        () => _i79.UpdateWarehouseCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i80.AddBranchCubit>(
        () => _i80.AddBranchCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i81.AddBranchManagerCubit>(
        () => _i81.AddBranchManagerCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i82.AddWarehouseCubit>(
        () => _i82.AddWarehouseCubit(gh<_i54.AdminBaseRepository>()));
    gh.factory<_i83.AddWarehouseManagerCubit>(
        () => _i83.AddWarehouseManagerCubit(gh<_i54.AdminBaseRepository>()));
    return this;
  }
}

class _$ThirdPartyInjection extends _i84.ThirdPartyInjection {}
