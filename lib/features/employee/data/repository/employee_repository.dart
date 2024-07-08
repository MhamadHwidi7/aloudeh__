import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/core/network/network_info.dart';
import 'package:aloudeh_company/features/employee/data/entity/employee_profile.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_customer_filter_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/log_in_employee_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/archive_trip_params.dart';
import 'package:aloudeh_company/features/employee/data/params/get_customer_by_id_params.dart';
import 'package:aloudeh_company/features/employee/data/entity/customer_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_all_customers_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_all_receipts_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_all_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_branch_location_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_truck_record_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/report_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/tracking_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/add_compliant_params.dart';
import 'package:aloudeh_company/features/employee/data/params/add_customer_params.dart';
import 'package:aloudeh_company/features/employee/data/params/add_invoice_params.dart';
import 'package:aloudeh_company/features/employee/data/params/add_trip_params.dart';
import 'package:aloudeh_company/features/employee/data/params/cancel_trip_params.dart';
import 'package:aloudeh_company/features/employee/data/params/delete_customer_params.dart';
import 'package:aloudeh_company/features/employee/data/params/edit_trip_params.dart';
import 'package:aloudeh_company/features/employee/data/params/get_all_receipt_params.dart';
import 'package:aloudeh_company/features/employee/data/params/get_branch_location_params.dart';
import 'package:aloudeh_company/features/employee/data/params/get_customer_filter_params.dart';
import 'package:aloudeh_company/features/employee/data/params/get_truck_record_params.dart';
import 'package:aloudeh_company/features/employee/data/params/log_in_employee_params.dart';
import 'package:aloudeh_company/features/employee/data/params/tracking_params.dart';
import 'package:aloudeh_company/features/employee/data/params/trip_archive_params.dart';
import 'package:aloudeh_company/features/employee/data/params/update_customer_params.dart';
import 'package:aloudeh_company/features/employee/data/params/update_manifest_params.dart';
import 'package:aloudeh_company/features/employee/data/web_services/employee_web_services.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class EmployeeBaseRepository {
  Future<Either<NetworkExceptions, BaseEntity>> addTrip(
      {required AddTripParams addTripParams});
  Future<Either<NetworkExceptions, BaseEntity>> addInvoice(
      {required AddInvoiceParams addInvoiceParams});
  Future<Either<NetworkExceptions, BaseEntity>> editTrip(
      {required EditTripParams editTripParams});
  Future<Either<NetworkExceptions, BaseEntity>> cancelTrip(
      {required CancelTripParams cancelTripParams});
  Future<Either<NetworkExceptions, BaseEntity>> tripArchive(
      {required TripArchiveParams tripArchiveParams});
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<GetAllTripsPaginatedEntity>>>>
      getAllTripsPaginated();
  Future<Either<NetworkExceptions, GetAllReceiptsEntity>> getAllReceipt(
      {required GetAllReceiptParams getAllReceiptParams});
 Future<Either<NetworkExceptions, GetTruckRecordEntity>> getTruckRecord(
      {required GetTruckRecordParams getTruckRecordParams});
  Future<Either<NetworkExceptions, BaseEntity>> addCustomer(
      {required AddCustomerParams addCustomerParams});
  Future<Either<NetworkExceptions, BaseEntity>> addCompliant(
      {required AddCompliantParams addCompliantParams});
  Future<Either<NetworkExceptions, BaseEntity>> deleteCustomer(
      {required DeleteCustomerParams deleteCustomerParams});
  Future<Either<NetworkExceptions, BaseEntity>> updateCustomer(
      {required UpdateCustomerParams updateCustomerParams});
  Future<Either<NetworkExceptions, BaseEntity>> updateManifest(
      {required UpdateManifestParams updateManifestParams});
  Future<Either<NetworkExceptions, BaseReportEntity>> getTripReport();
  Future<Either<NetworkExceptions, BaseReportEntity>> getTruckReport();
  Future<Either<NetworkExceptions, GetBranchLocationEntity>> getBranchLocation(
      GetBranchLocationParams getBranchLocationParams);
  Future<Either<NetworkExceptions, BaseTrackingEntity>> getDriverTracking(
      TrackingParams trackingParams);
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<GetCustomerEmployeePaginatedEntity>>>>
      getAllCustomers(int page);
  Future<Either<NetworkExceptions, CustomerEmployeeEntity>> getCustomerById(
      GetCustomerByIdParams getCustomerByIdParams);
  Future<Either<NetworkExceptions, BaseEntity>> archiveTrip(
      ArchiveTripParams archiveTripParams);
        Future<Either<NetworkExceptions, GetCustomersFilterEntity>> getCustomerFilter(
      GetCustomerFilterParams getCustomerFilterParams);
          Future<Either<NetworkExceptions, EmployeeProfile>> profile(
      );
            Future<Either<NetworkExceptions, LogInEmployeeEntity>> login(
    LogInEmployeeParams logInEmployeeParams  );

 
}

@Singleton(as: EmployeeBaseRepository)
class EmployeeRepositoryImpl implements EmployeeBaseRepository {
  final NetworkInfo _networkInfo;
  final EmployeeBaseWebServices _employeeBaseWebServices;

  EmployeeRepositoryImpl(
      {required NetworkInfo networkInfo,
      required EmployeeBaseWebServices employeeBaseWebServices})
      : _networkInfo = networkInfo,
        _employeeBaseWebServices = employeeBaseWebServices;

  @override
  Future<Either<NetworkExceptions, BaseEntity>> addTrip(
      {required AddTripParams addTripParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _employeeBaseWebServices.addTrip(addTripParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> addInvoice(
      {required AddInvoiceParams addInvoiceParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.addInvoice(addInvoiceParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> cancelTrip(
      {required CancelTripParams cancelTripParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.cancelTrip(cancelTripParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> editTrip(
      {required EditTripParams editTripParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.editTrip(editTripParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> tripArchive(
      {required TripArchiveParams tripArchiveParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.tripArchive(tripArchiveParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
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
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<GetAllTripsPaginatedEntity>>>>
      getAllTripsPaginated() async {
    return await _getResultWithPagination(
      () => _employeeBaseWebServices.getAllTripsPaginated(),
    );
  }

 
  @override
  Future<Either<NetworkExceptions, GetAllReceiptsEntity>> getAllReceipt(
      {required GetAllReceiptParams getAllReceiptParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.getAllReceipt(getAllReceiptParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, GetTruckRecordEntity>> getTruckRecord(
      {required GetTruckRecordParams getTruckRecordParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.getTruckRecord(getTruckRecordParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> addCompliant(
      {required AddCompliantParams addCompliantParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.addCompliant(addCompliantParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> addCustomer(
      {required AddCustomerParams addCustomerParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.addCustomer(addCustomerParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> deleteCustomer(
      {required DeleteCustomerParams deleteCustomerParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.deleteCustomer(deleteCustomerParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> updateCustomer(
      {required UpdateCustomerParams updateCustomerParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.updateCustomer(updateCustomerParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseEntity>> updateManifest(
      {required UpdateManifestParams updateManifestParams}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.updateManifest(updateManifestParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseReportEntity>> getTripReport() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _employeeBaseWebServices.getTripReport();
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseReportEntity>> getTruckReport() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _employeeBaseWebServices.getTruckReport();
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, GetBranchLocationEntity>> getBranchLocation(
      GetBranchLocationParams getBranchLocationParams) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _employeeBaseWebServices.getBranchLocation(
            getBranchLocationParams: getBranchLocationParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }

  @override
  Future<Either<NetworkExceptions, BaseTrackingEntity>> getDriverTracking(
      TrackingParams trackingParams) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _employeeBaseWebServices.getDriverTracking(
            trackingParams: trackingParams);
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
                  PaginationEntity<GetCustomerEmployeePaginatedEntity>>>>
      getAllCustomers(int page) async {
    return await _getResultWithPagination(
      () => _employeeBaseWebServices.getAllCustomers(page),
    );
  }

  @override
  Future<Either<NetworkExceptions, CustomerEmployeeEntity>> getCustomerById(
      GetCustomerByIdParams getCustomerByIdParams) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _employeeBaseWebServices
            .getCustomerById(getCustomerByIdParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  // @override
  // Future<Either<NetworkExceptions, BaseDestinationEntity>> getAllDestination() async{
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       final response = await _employeeBaseWebServices
  //           .getAllDestination();
  //       return Right(response);
  //     } on Exception catch (ex) {
  //       return Left(NetworkExceptions.getDioException(ex));
  //     }
  //   } else {
  //     return const Left(NetworkExceptions.noInternetConnection());
  //   }
  // }
  

  @override
  Future<Either<NetworkExceptions, BaseEntity>> archiveTrip(ArchiveTripParams archiveTripParams) async{
    if (await _networkInfo.isConnected) {
      try {
        final response = await _employeeBaseWebServices
            .archiveTrip(archiveTripParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  

  @override
  Future<Either<NetworkExceptions, GetCustomersFilterEntity>> getCustomerFilter(GetCustomerFilterParams getCustomerFilterParams) async{
    if (await _networkInfo.isConnected) {
      try {
        final response = await _employeeBaseWebServices
            .getCustomerFilter(getCustomerFilterParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, EmployeeProfile>> profile() async{
    if (await _networkInfo.isConnected) {
      try {
        final response = await _employeeBaseWebServices
            .profile();
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, LogInEmployeeEntity>> login(LogInEmployeeParams logInEmployeeParams)async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _employeeBaseWebServices
            .login(logInEmployeeParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
}
