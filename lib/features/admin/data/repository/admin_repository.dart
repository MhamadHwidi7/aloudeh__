import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/core/handler/network_request_handler.dart';
import 'package:aloudeh_company/core/network/network_info.dart';
import 'package:aloudeh_company/features/admin/data/entity/archive_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/employee_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/employee_paginated_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/get_all_active_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/get_all_branches_paginated_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/get_all_trips_admin_paginated_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/get_customer_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/get_customers_paginated_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/get_employee_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/get_trip_information_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/log_in_admin_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/register_admin_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/truck_information_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/truck_record_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/vacation_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/warehouse_manager_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/warehouses_paginated_entity.dart';
import 'package:aloudeh_company/features/admin/data/params/add_branch_manager_params.dart';
import 'package:aloudeh_company/features/admin/data/params/add_branch_params.dart';
import 'package:aloudeh_company/features/admin/data/params/add_warehouse_manager_params.dart';
import 'package:aloudeh_company/features/admin/data/params/add_warehouse_params.dart';
import 'package:aloudeh_company/features/admin/data/params/delete_branch_params.dart';
import 'package:aloudeh_company/features/admin/data/params/delete_warehouse_params.dart';
import 'package:aloudeh_company/features/admin/data/params/get_branches_employee_by_id_params.dart';
import 'package:aloudeh_company/features/admin/data/params/get_customer_by_id_params.dart';
import 'package:aloudeh_company/features/admin/data/params/get_employee_by_id_params.dart';
import 'package:aloudeh_company/features/admin/data/params/get_vacation_employee_params.dart';
import 'package:aloudeh_company/features/admin/data/params/get_warehouse_manager_by_id_params.dart';
import 'package:aloudeh_company/features/admin/data/params/log_in_admin_params.dart';
import 'package:aloudeh_company/features/admin/data/params/promote_employee_params.dart';
import 'package:aloudeh_company/features/admin/data/params/register_admin_params.dart';
import 'package:aloudeh_company/features/admin/data/params/truck_information_params.dart';
import 'package:aloudeh_company/features/admin/data/params/truck_record_params.dart';
import 'package:aloudeh_company/features/admin/data/params/update_branch_params.dart';
import 'package:aloudeh_company/features/admin/data/params/update_warehouse_params.dart';
import 'package:aloudeh_company/features/admin/data/web_services/admin_web_service.dart';
import 'package:aloudeh_company/features/employee/data/params/get_trip_information.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class AdminBaseRepository {
  Future<Either<NetworkExceptions, RegisterAdminEntity>> register(
      {required RegisterAdminParams registerAdminParams});
  Future<Either<NetworkExceptions, LogInAdminEntity>> logIn(
      {required LogInAdminParams logInAdminParams});
  Future<Either<NetworkExceptions, BaseEntity>> addBranch(
      {required AddBranchParams addBranchParams});
  Future<Either<NetworkExceptions, BaseEntity>> addBranchManager(
      {required AddBranchManagerParams addBranchManagerParams});

  Future<Either<NetworkExceptions, BaseEntity>> addWarehouse(
      {required AddWarehouseParams addWarehouseParams});
  Future<Either<NetworkExceptions, BaseEntity>> addWarehouseManager(
      {required AddWarehouseManagerParams addWarehouseManagerParams});
  Future<Either<NetworkExceptions, BaseEntity>> updateBranch(
      {required UpdateBranchParams updateBranchParams});
  Future<Either<NetworkExceptions, BaseEntity>> updateWarehouse(
      {required UpdateWarehouseParams updateWarehouseParams});
  Future<Either<NetworkExceptions, BaseEntity>> deleteBranch(
      {required DeleteBranchParams deleteBranchParams});
  Future<Either<NetworkExceptions, BaseEntity>> deleteWarehouse(
      {required DeleteWarehouseParams deleteWarehouseParams});
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<GetAllBranchesPaginatedEntity>>>>
      getAllBranches();
  Future<Either<NetworkExceptions, BaseTruckRecordEntity>> truckRecord(
      {required TruckRecordParams truckRecordParams});
  Future<Either<NetworkExceptions, BaseEmployeeAdminEntity>> getEmployeeById(
      {required GetEmployeeByIdParams getEmployeeByIdParams});
  Future<Either<NetworkExceptions, BaseEmployeeEntity>> getBranchEmployees(
      {required GetBranchEmployeeByIdParams getBranchesEmployeeByIdParams});
  Future<Either<NetworkExceptions, BaseWarehouseManagerAdminEntity>>
      getWarehouseManagerById(
          {required GetWareHouseManagerByIdParams
              getWareHouseManagerByIdParams});

  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<WarehousesPaginatedEntity>>>>
      getWarehousesPaginated();
  Future<Either<NetworkExceptions, BaseEntity>> promoteEmployee(
      {required PromoteEmployeeParams promoteEmployeeParams});
  Future<Either<NetworkExceptions, TruckInformationEntity>> getTruckInformation(
      {required TruckInformationParams truckInformationParams});
  Future<Either<NetworkExceptions, BaseAdminVacationEntity>>
      getEmployeeVacation(
          {required GetVacationParams getVacationEmployeeParams});
  Future<Either<NetworkExceptions, BaseAdminVacationEntity>>
      getWarehouseVacation(
          {required GetVacationParams getVacationWarehouseParams});

  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<GetAllTripsAdminPaginatedEntity>>>>
      getAllTrips();
      Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<EmployeePaginatedAdminEntity>>>>
      getAllEmployees();
            Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<ActiveTripsPaginatedAdminEntity>>>>
      getAllActiveTrips();
                  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<ArchiveTripsPaginatedAdminEntity>>>>
      getAllArchiveTrips();
        Future<Either<NetworkExceptions, GetTripInformationAdminEntity>> getTripInformation(
      {required GetTripInformationParams getTripInformationParams});
              Future<Either<NetworkExceptions, GetCustomerAdminEntity>> getCustomerById(
      {required GetCustomerByIdParams getCustomerByIdParams});
                        Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<GetCustomerAdminPaginatedEntity>>>>
      getAllCustomers();
}

@Singleton(as: AdminBaseRepository)
class AdminRepositoryImpl implements AdminBaseRepository {
  final NetworkInfo _networkInfo;
  final AdminBaseWebService _adminBaseWebService;

  AdminRepositoryImpl(
      {required NetworkInfo networkInfo,
      required AdminBaseWebService adminBaseWebService})
      : _networkInfo = networkInfo,
        _adminBaseWebService = adminBaseWebService;

  @override
  Future<Either<NetworkExceptions, RegisterAdminEntity>> register(
      {required RegisterAdminParams registerAdminParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _adminBaseWebService.register(
            registerAdminParams: registerAdminParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, LogInAdminEntity>> logIn(
      {required LogInAdminParams logInAdminParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _adminBaseWebService.logIn(
            logInAdminParams: logInAdminParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> addBranch(
      {required AddBranchParams addBranchParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _adminBaseWebService.addBranch(
            addBranchParams: addBranchParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> addWarehouse(
      {required AddWarehouseParams addWarehouseParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _adminBaseWebService.addWarehouse(
            addWarehouseParams: addWarehouseParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> addWarehouseManager(
      {required AddWarehouseManagerParams addWarehouseManagerParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _adminBaseWebService.addWarehouseManager(
            addWarehouseManagerParams: addWarehouseManagerParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> updateBranch(
      {required UpdateBranchParams updateBranchParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _adminBaseWebService.updateBranch(
            updateBranchParams: updateBranchParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> updateWarehouse(
      {required UpdateWarehouseParams updateWarehouseParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _adminBaseWebService.updateWarehouse(
            updateWarehouseParams: updateWarehouseParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> deleteBranch(
      {required DeleteBranchParams deleteBranchParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _adminBaseWebService.deleteBranch(
            deleteBranchParams: deleteBranchParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> deleteWarehouse(
      {required DeleteWarehouseParams deleteWarehouseParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _adminBaseWebService.deleteWarehouse(
            deleteWarehouseParams: deleteWarehouseParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<GetAllBranchesPaginatedEntity>>>>
      getAllBranches() async {
    return await _getResultWithPagination(
      () => _adminBaseWebService.getAllBranches(),
    );
  }

  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<T>>>>
      _getResultWithPagination<T>(
          Future<BasePaginationEntity<PaginationEntity<T>>> Function()
              getPagination) async {
    try {
      if (await _networkInfo.isConnected) {
        var response = await getPagination();
        return Right(response);
      } else {
        return const Left(NetworkExceptions.noInternetConnection());
      }
    } catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseTruckRecordEntity>> truckRecord(
      {required TruckRecordParams truckRecordParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _adminBaseWebService.truckRecord(
            truckRecordParams: truckRecordParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEmployeeAdminEntity>> getEmployeeById(
      {required GetEmployeeByIdParams getEmployeeByIdParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _adminBaseWebService.getEmployeeById(
            getEmployeeByIdParams: getEmployeeByIdParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEmployeeEntity>> getBranchEmployees(
      {required GetBranchEmployeeByIdParams
          getBranchesEmployeeByIdParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _adminBaseWebService.getBranchEmployees(
            getBranchesEmployeeByIdParams: getBranchesEmployeeByIdParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseWarehouseManagerAdminEntity>>
      getWarehouseManagerById(
          {required GetWareHouseManagerByIdParams
              getWareHouseManagerByIdParams}) async {
    return await handleNetworkRequest<BaseWarehouseManagerAdminEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _adminBaseWebService.getWarehouseManagerById(
          getWareHouseManagerByIdParams: getWareHouseManagerByIdParams),
    );
    // if (await _networkInfo.isConnected) {
    //   try {
    //     final response = await _adminBaseWebService.getWarehouseManagerById(
    //         getWareHouseManagerByIdParams: getWareHouseManagerByIdParams);
    //     return Right(response);
    //   } on Exception catch (ex) {
    //     return Left(NetworkExceptions.getDioException(ex));
    //   }
    // } else {
    //   return const Left(NetworkExceptions.noInternetConnection());
    // }
  }

  @override
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<WarehousesPaginatedEntity>>>>
      getWarehousesPaginated() async {
    return await _getResultWithPagination(
      () => _adminBaseWebService.getWarehousesPaginated(),
    );
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> promoteEmployee(
      {required PromoteEmployeeParams promoteEmployeeParams}) async {
    return await handleNetworkRequest<BaseEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _adminBaseWebService.promoteEmployee(
          promoteEmployeeParams: promoteEmployeeParams),
    );

    // if (await _networkInfo.isConnected) {
    //   try {
    //     final response = await _adminBaseWebService.promoteEmployee(
    //         promoteEmployeeParams: promoteEmployeeParams);
    //     return Right(response);
    //   } on Exception catch (ex) {
    //     return Left(NetworkExceptions.getDioException(ex));
    //   }
    // } else {
    //   return const Left(NetworkExceptions.noInternetConnection());
    // }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> addBranchManager(
      {required AddBranchManagerParams addBranchManagerParams}) async {
    return await handleNetworkRequest<BaseEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _adminBaseWebService.addBranchManager(
          addBranchManagerParams: addBranchManagerParams),
    );

    // if (await _networkInfo.isConnected) {
    //   try {
    //     final response = await _adminBaseWebService.addBranchManager(
    //         addBranchManagerParams: addBranchManagerParams);
    //     return Right(response);
    //   } on Exception catch (ex) {
    //     return Left(NetworkExceptions.getDioException(ex));
    //   }
    // } else {
    //   return const Left(NetworkExceptions.noInternetConnection());
    // }
  }

  @override
  Future<Either<NetworkExceptions, TruckInformationEntity>> getTruckInformation(
      {required TruckInformationParams truckInformationParams}) async {
    return await handleNetworkRequest<TruckInformationEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _adminBaseWebService.getTruckInformation(
          truckInformationParams: truckInformationParams),
    );
  }

  @override
  Future<Either<NetworkExceptions, BaseAdminVacationEntity>>
      getEmployeeVacation(
          {required GetVacationParams getVacationEmployeeParams}) async {
    return await handleNetworkRequest<BaseAdminVacationEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _adminBaseWebService.getEmployeeVacations(
          getVacationEmployeeParams: getVacationEmployeeParams),
    );
  }

  @override
  Future<Either<NetworkExceptions, BaseAdminVacationEntity>>
      getWarehouseVacation(
          {required GetVacationParams getVacationWarehouseParams}) async {
    return await handleNetworkRequest<BaseAdminVacationEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _adminBaseWebService.getWarehouseVacations(
          getVacationWarehouseParams: getVacationWarehouseParams),
    );
  }

  @override
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<GetAllTripsAdminPaginatedEntity>>>>
      getAllTrips() async {
    return await _getResultWithPagination(
      () => _adminBaseWebService.getAllTrips(),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<EmployeePaginatedAdminEntity>>>> getAllEmployees()async{
 return await _getResultWithPagination(
      () => _adminBaseWebService.getAllEmployees(),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<ActiveTripsPaginatedAdminEntity>>>> getAllActiveTrips() async{
 return await _getResultWithPagination(
      () => _adminBaseWebService.getAllActiveTrips(),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<ArchiveTripsPaginatedAdminEntity>>>> getAllArchiveTrips()async {
 return await _getResultWithPagination(
      () => _adminBaseWebService.getAllArchiveTrips(),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, GetTripInformationAdminEntity>> getTripInformation({required GetTripInformationParams getTripInformationParams}) async{
    return await handleNetworkRequest<GetTripInformationAdminEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _adminBaseWebService.getTripInformation(
          getTripInformationParams: getTripInformationParams),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<GetCustomerAdminPaginatedEntity>>>> getAllCustomers() async{
 return await _getResultWithPagination(
      () => _adminBaseWebService.getAllCustomers(),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, GetCustomerAdminEntity>> getCustomerById({required GetCustomerByIdParams getCustomerByIdParams}) async{
    return await handleNetworkRequest<GetCustomerAdminEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _adminBaseWebService.getCustomerById(
          getCustomerByIdParams: getCustomerByIdParams),
    );
  }
}
