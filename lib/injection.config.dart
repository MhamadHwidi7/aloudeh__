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
import 'core/third_party_injection.dart' as _i79;
import 'core/utils/shared_preference_utils.dart' as _i8;
import 'features/admin/data/repository/admin_repository.dart' as _i49;
import 'features/admin/data/web_services/admin_web_service.dart' as _i13;
import 'features/admin/presentation/controllers/add_branch_cubit.dart' as _i75;
import 'features/admin/presentation/controllers/add_branch_manager_cubit.dart'
    as _i76;
import 'features/admin/presentation/controllers/add_warehouse_cubit.dart'
    as _i77;
import 'features/admin/presentation/controllers/add_warehouse_manager_cubit.dart'
    as _i78;
import 'features/admin/presentation/controllers/delete_branch_cubit.dart'
    as _i51;
import 'features/admin/presentation/controllers/delete_warehouse_cubit.dart'
    as _i53;
import 'features/admin/presentation/controllers/get_all_active_trips_paginated_cubit.dart'
    as _i55;
import 'features/admin/presentation/controllers/get_all_archive_trips_paginated_cubit.dart'
    as _i56;
import 'features/admin/presentation/controllers/get_all_branches_cubit.dart'
    as _i57;
import 'features/admin/presentation/controllers/get_all_customer_paginated_cubit.dart'
    as _i58;
import 'features/admin/presentation/controllers/get_all_employee_paginated_cubit.dart'
    as _i59;
import 'features/admin/presentation/controllers/get_branch_employee_cubit.dart'
    as _i61;
import 'features/admin/presentation/controllers/get_customer_by_id_cubit.dart'
    as _i62;
import 'features/admin/presentation/controllers/get_employee_by_id_cubit.dart'
    as _i63;
import 'features/admin/presentation/controllers/get_employee_vacation_cubit.dart'
    as _i64;
import 'features/admin/presentation/controllers/get_trip_information_cubit.dart'
    as _i65;
import 'features/admin/presentation/controllers/get_trips_record_paginated_cubit.dart'
    as _i60;
import 'features/admin/presentation/controllers/get_warehouse_manager_by_id_cubit.dart'
    as _i66;
import 'features/admin/presentation/controllers/get_warehouse_vacation_cubit.dart'
    as _i67;
import 'features/admin/presentation/controllers/log_in_cubit.dart' as _i68;
import 'features/admin/presentation/controllers/promote_employee_cubit.dart'
    as _i69;
import 'features/admin/presentation/controllers/register_cubit.dart' as _i70;
import 'features/admin/presentation/controllers/truck_information_cubit.dart'
    as _i71;
import 'features/admin/presentation/controllers/truck_record_cubit.dart'
    as _i72;
import 'features/admin/presentation/controllers/update_branch_cubit.dart'
    as _i73;
import 'features/admin/presentation/controllers/update_warehouse_cubit.dart'
    as _i74;
import 'features/branch_manager/data/repository/branch_manager_repository.dart'
    as _i14;
import 'features/branch_manager/data/web_services/branch_manager_web_services.dart'
    as _i11;
import 'features/branch_manager/presentation/controllers/add_employee_cubit.dart'
    as _i42;
import 'features/branch_manager/presentation/controllers/add_shipping_cost_cubit.dart'
    as _i44;
import 'features/branch_manager/presentation/controllers/add_truck_cubit.dart'
    as _i46;
import 'features/branch_manager/presentation/controllers/add_vacation_employee_cubit.dart'
    as _i47;
import 'features/branch_manager/presentation/controllers/add_vacation_warehouse_cubit.dart'
    as _i48;
import 'features/branch_manager/presentation/controllers/delete_driver_cubit.dart'
    as _i15;
import 'features/branch_manager/presentation/controllers/delete_employee_cubit.dart'
    as _i16;
import 'features/branch_manager/presentation/controllers/delete_truck_cubit.dart'
    as _i17;
import 'features/branch_manager/presentation/controllers/edit_shipping_cost_cubit.dart'
    as _i18;
import 'features/branch_manager/presentation/controllers/promote_employee_cubit.dart'
    as _i32;
import 'features/branch_manager/presentation/controllers/rate_employee_cubit.dart'
    as _i33;
import 'features/branch_manager/presentation/controllers/update_driver_cubit.dart'
    as _i36;
import 'features/branch_manager/presentation/controllers/update_employee_cubit.dart'
    as _i37;
import 'features/branch_manager/presentation/controllers/update_truck_cubit.dart'
    as _i39;
import 'features/employee/data/repository/employee_repository.dart' as _i19;
import 'features/employee/data/web_services/employee_web_services.dart' as _i12;
import 'features/employee/presentation/controller/add_compliant_cubit.dart'
    as _i40;
import 'features/employee/presentation/controller/add_customer_cubit.dart'
    as _i41;
import 'features/employee/presentation/controller/add_invoice_cubit.dart'
    as _i43;
import 'features/employee/presentation/controller/add_trip_cubit.dart' as _i45;
import 'features/employee/presentation/controller/cancel_trip_cubit.dart'
    as _i50;
import 'features/employee/presentation/controller/delete_customer_cubit.dart'
    as _i52;
import 'features/employee/presentation/controller/edit_trip_cubit.dart' as _i54;
import 'features/employee/presentation/controller/get_all_active_trips_paginated_cubit.dart'
    as _i20;
import 'features/employee/presentation/controller/get_all_archive_trips_paginated_cubit.dart'
    as _i21;
import 'features/employee/presentation/controller/get_all_branches_paginated_cubit.dart'
    as _i22;
import 'features/employee/presentation/controller/get_all_receipt_cubit.dart'
    as _i23;
import 'features/employee/presentation/controller/get_all_trips_paginated_cubit.dart'
    as _i24;
import 'features/employee/presentation/controller/get_all_truck_record_paginated_cubit.dart'
    as _i25;
import 'features/employee/presentation/controller/get_manifest_cubit.dart'
    as _i26;
import 'features/employee/presentation/controller/get_trip_report_cubit.dart'
    as _i27;
import 'features/employee/presentation/controller/get_trips_info_cubit.dart'
    as _i28;
import 'features/employee/presentation/controller/get_truck_information_cubit.dart'
    as _i29;
import 'features/employee/presentation/controller/get_truck_record_cubit.dart'
    as _i30;
import 'features/employee/presentation/controller/get_truck_report_cubit.dart'
    as _i31;
import 'features/employee/presentation/controller/trip_archive_cubit.dart'
    as _i34;
import 'features/employee/presentation/controller/update_customer_cubit.dart'
    as _i35;
import 'features/employee/presentation/controller/update_manifest_cubit.dart'
    as _i38;

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
    gh.singleton<_i12.EmployeeBaseWebServices>(
        () => _i12.EmployeeWebServicesImpl(apiConsumer: gh<_i9.ApiConsumer>()));
    gh.singleton<_i13.AdminBaseWebService>(
        () => _i13.AdminWebService(apiConsumer: gh<_i9.ApiConsumer>()));
    gh.singleton<_i14.BranchManagerBaseRepository>(() =>
        _i14.BranchManagerRepositoryImpl(
          networkInfo: gh<_i7.NetworkInfo>(),
          branchManagerBaseWebServices: gh<_i11.BranchManagerBaseWebServices>(),
        ));
    gh.factory<_i15.DeleteDriverCubit>(
        () => _i15.DeleteDriverCubit(gh<_i14.BranchManagerBaseRepository>()));
    gh.factory<_i16.DeleteEmployeeCubit>(
        () => _i16.DeleteEmployeeCubit(gh<_i14.BranchManagerBaseRepository>()));
    gh.factory<_i17.DeleteTruckCubit>(
        () => _i17.DeleteTruckCubit(gh<_i14.BranchManagerBaseRepository>()));
    gh.factory<_i18.EditShippingCostCubit>(() =>
        _i18.EditShippingCostCubit(gh<_i14.BranchManagerBaseRepository>()));
    gh.singleton<_i19.EmployeeBaseRepository>(() => _i19.EmployeeRepositoryImpl(
          networkInfo: gh<_i7.NetworkInfo>(),
          employeeBaseWebServices: gh<_i12.EmployeeBaseWebServices>(),
        ));
    gh.factory<_i20.GetAllActiveTripsPaginatedCubit>(() =>
        _i20.GetAllActiveTripsPaginatedCubit(
            gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i21.GetAllArchiveTripsPaginatedCubit>(() =>
        _i21.GetAllArchiveTripsPaginatedCubit(
            gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i22.GetAllBranchesPaginatedCubit>(() =>
        _i22.GetAllBranchesPaginatedCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i23.GetAllReceiptCubit>(
        () => _i23.GetAllReceiptCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i24.GetAllTripsPaginatedCubit>(() =>
        _i24.GetAllTripsPaginatedCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i25.GetAllTruckRecordPaginatedCubit>(() =>
        _i25.GetAllTruckRecordPaginatedCubit(
            gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i26.GetManifestCubit>(
        () => _i26.GetManifestCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i27.GetTripReportCubit>(
        () => _i27.GetTripReportCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i28.GetTripsInfoCubit>(
        () => _i28.GetTripsInfoCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i29.GetTruckInformationCubit>(
        () => _i29.GetTruckInformationCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i30.GetTruckRecordCubit>(
        () => _i30.GetTruckRecordCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i31.GetTruckReportCubit>(
        () => _i31.GetTruckReportCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i32.PromoteEmployeeCubit>(() =>
        _i32.PromoteEmployeeCubit(gh<_i14.BranchManagerBaseRepository>()));
    gh.factory<_i33.RateEmployeeCubit>(
        () => _i33.RateEmployeeCubit(gh<_i14.BranchManagerBaseRepository>()));
    gh.factory<_i34.TripArchiveCubit>(
        () => _i34.TripArchiveCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i35.UpdateCustomerCubit>(
        () => _i35.UpdateCustomerCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i36.UpdateDriverCubit>(
        () => _i36.UpdateDriverCubit(gh<_i14.BranchManagerBaseRepository>()));
    gh.factory<_i37.UpdateEmployeeCubit>(
        () => _i37.UpdateEmployeeCubit(gh<_i14.BranchManagerBaseRepository>()));
    gh.factory<_i38.UpdateManifestCubit>(
        () => _i38.UpdateManifestCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i39.UpdateTruckCubit>(
        () => _i39.UpdateTruckCubit(gh<_i14.BranchManagerBaseRepository>()));
    gh.factory<_i40.AddCompliantCubit>(
        () => _i40.AddCompliantCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i41.AddCustomerCubit>(
        () => _i41.AddCustomerCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i42.AddEmployeeCubit>(
        () => _i42.AddEmployeeCubit(gh<_i14.BranchManagerBaseRepository>()));
    gh.factory<_i43.AddInvoiceCubit>(
        () => _i43.AddInvoiceCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i44.AddShippingCostCubit>(() =>
        _i44.AddShippingCostCubit(gh<_i14.BranchManagerBaseRepository>()));
    gh.factory<_i45.AddTripCubit>(
        () => _i45.AddTripCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i46.AddTruckCubit>(
        () => _i46.AddTruckCubit(gh<_i14.BranchManagerBaseRepository>()));
    gh.factory<_i47.AddVacationEmployeeCubit>(() =>
        _i47.AddVacationEmployeeCubit(gh<_i14.BranchManagerBaseRepository>()));
    gh.factory<_i48.AddVacationWarehouseCubit>(() =>
        _i48.AddVacationWarehouseCubit(gh<_i14.BranchManagerBaseRepository>()));
    gh.singleton<_i49.AdminBaseRepository>(() => _i49.AdminRepositoryImpl(
          networkInfo: gh<_i7.NetworkInfo>(),
          adminBaseWebService: gh<_i13.AdminBaseWebService>(),
        ));
    gh.factory<_i50.CancelTripCubit>(
        () => _i50.CancelTripCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i51.DeleteBranchCubit>(
        () => _i51.DeleteBranchCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i52.DeleteCustomerCubit>(
        () => _i52.DeleteCustomerCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i53.DeleteWarehouseCubit>(
        () => _i53.DeleteWarehouseCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i54.EditTripCubit>(
        () => _i54.EditTripCubit(gh<_i19.EmployeeBaseRepository>()));
    gh.factory<_i55.GetAllActiveTripsPaginatedCubit>(() =>
        _i55.GetAllActiveTripsPaginatedCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i56.GetAllArchiveTripsPaginatedCubit>(() =>
        _i56.GetAllArchiveTripsPaginatedCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i57.GetAllBranchesPaginatedCubit>(() =>
        _i57.GetAllBranchesPaginatedCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i58.GetAllCustomersPaginatedCubit>(() =>
        _i58.GetAllCustomersPaginatedCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i59.GetAllEmployeePaginatedCubit>(() =>
        _i59.GetAllEmployeePaginatedCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i60.GetAllTripsRecordPaginatedCubit>(() =>
        _i60.GetAllTripsRecordPaginatedCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i61.GetBranchEmployeeByIdCubit>(
        () => _i61.GetBranchEmployeeByIdCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i62.GetCustomerByIdCubit>(
        () => _i62.GetCustomerByIdCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i63.GetEmployeeByIdCubit>(
        () => _i63.GetEmployeeByIdCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i64.GetEmployeeVacationCubit>(
        () => _i64.GetEmployeeVacationCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i65.GetTripInformationCubit>(
        () => _i65.GetTripInformationCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i66.GetWarehouseManagerByIdCubit>(() =>
        _i66.GetWarehouseManagerByIdCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i67.GetWarehouseVacationCubit>(
        () => _i67.GetWarehouseVacationCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i68.LogInCubit>(() => _i68.LogInCubit(
          gh<_i49.AdminBaseRepository>(),
          gh<_i8.SharedPreferencesUtils>(),
        ));
    gh.factory<_i69.PromoteEmployeeCubit>(
        () => _i69.PromoteEmployeeCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i70.RegisterCubit>(() => _i70.RegisterCubit(
          gh<_i49.AdminBaseRepository>(),
          gh<_i8.SharedPreferencesUtils>(),
        ));
    gh.factory<_i71.TruckInformationCubit>(
        () => _i71.TruckInformationCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i72.TruckRecordCubit>(
        () => _i72.TruckRecordCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i73.UpdateBranchCubit>(
        () => _i73.UpdateBranchCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i74.UpdateWarehouseCubit>(
        () => _i74.UpdateWarehouseCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i75.AddBranchCubit>(
        () => _i75.AddBranchCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i76.AddBranchManagerCubit>(
        () => _i76.AddBranchManagerCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i77.AddWarehouseCubit>(
        () => _i77.AddWarehouseCubit(gh<_i49.AdminBaseRepository>()));
    gh.factory<_i78.AddWarehouseManagerCubit>(
        () => _i78.AddWarehouseManagerCubit(gh<_i49.AdminBaseRepository>()));
    return this;
  }
}

class _$ThirdPartyInjection extends _i79.ThirdPartyInjection {}
