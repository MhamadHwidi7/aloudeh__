import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/core/network/network_info.dart';
import 'package:aloudeh_company/features/admin/data/entity/get_all_branches_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/active_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/archive_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_all_receipts_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_all_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_manifest_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_trip_information_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_truck_information_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_truck_record_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/report_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/truck_record_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/add_compliant_params.dart';
import 'package:aloudeh_company/features/employee/data/params/add_customer_params.dart';
import 'package:aloudeh_company/features/employee/data/params/add_invoice_params.dart';
import 'package:aloudeh_company/features/employee/data/params/add_trip_params.dart';
import 'package:aloudeh_company/features/employee/data/params/cancel_trip_params.dart';
import 'package:aloudeh_company/features/employee/data/params/delete_customer_params.dart';
import 'package:aloudeh_company/features/employee/data/params/edit_trip_params.dart';
import 'package:aloudeh_company/features/employee/data/params/get_all_receipt_params.dart';
import 'package:aloudeh_company/features/employee/data/params/get_manifest_params.dart';
import 'package:aloudeh_company/features/employee/data/params/get_trip_information.dart';
import 'package:aloudeh_company/features/employee/data/params/get_truck_information_params.dart';
import 'package:aloudeh_company/features/employee/data/params/get_truck_record_params.dart';
import 'package:aloudeh_company/features/employee/data/params/trip_archive_params.dart';
import 'package:aloudeh_company/features/employee/data/params/update_customer_params.dart';
import 'package:aloudeh_company/features/employee/data/params/update_manifest_params.dart';
import 'package:aloudeh_company/features/employee/data/web_services/employee_web_services.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class EmployeeBaseRepository{
  Future <Either<NetworkExceptions,BaseEntity>> addTrip({required AddTripParams addTripParams});
  Future <Either<NetworkExceptions,BaseEntity>> addInvoice({required AddInvoiceParams addInvoiceParams});
  Future <Either<NetworkExceptions,BaseEntity>> editTrip({required EditTripParams editTripParams});
  Future <Either<NetworkExceptions,BaseEntity>> cancelTrip({required CancelTripParams cancelTripParams});
  Future <Either<NetworkExceptions,BaseEntity>> tripArchive({required TripArchiveParams tripArchiveParams});
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<GetAllTripsPaginatedEntity>>>> getAllTripsPaginated();
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<GetAllBranchesPaginatedEntity>>>> getAllBranches();
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<ActiveTripsPaginatedEntity>>>> getAllActiveTrips();
  Future <Either<NetworkExceptions,GetTripInformationEntity>> getTripInfo({required GetTripInformationParams getTripInformationParams});
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<ArchiveTripsPaginatedEntity>>>> getAllArchiveTrips();
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<TruckRecordPaginatedEntity>>>> getAllTruckRecordPaginated();
  Future <Either<NetworkExceptions,GetAllReceiptsEntity>> getAllReceipt({required GetAllReceiptParams getAllReceiptParams});
  Future <Either<NetworkExceptions,GetManifestEntity>> getManifest({required GetManifestParams getManifestParams});
  Future <Either<NetworkExceptions,GetTruckInformationEntity>> getTruckInformation({required GetTruckInformationParams getTruckInformationParams});
  Future <Either<NetworkExceptions,GetTruckRecordEntity>> getTruckRecord({required GetTruckRecordParams getTruckRecordParams});
  Future <Either<NetworkExceptions,BaseEntity>> addCustomer({required AddCustomerParams addCustomerParams});
  Future <Either<NetworkExceptions,BaseEntity>> addCompliant({required AddCompliantParams addCompliantParams});
  Future <Either<NetworkExceptions,BaseEntity>> deleteCustomer({required DeleteCustomerParams deleteCustomerParams});
  Future <Either<NetworkExceptions,BaseEntity>> updateCustomer({required UpdateCustomerParams updateCustomerParams});
  Future <Either<NetworkExceptions,BaseEntity>> updateManifest({required UpdateManifestParams updateManifestParams});
  Future <Either<NetworkExceptions,BaseReportEntity>> getTripReport();
  Future <Either<NetworkExceptions,BaseReportEntity>> getTruckReport();


}

@Singleton(as:EmployeeBaseRepository )
class EmployeeRepositoryImpl implements EmployeeBaseRepository{
  final NetworkInfo _networkInfo;
  final EmployeeBaseWebServices _employeeBaseWebServices;

  EmployeeRepositoryImpl({required NetworkInfo networkInfo, required EmployeeBaseWebServices employeeBaseWebServices}) : _networkInfo = networkInfo, _employeeBaseWebServices = employeeBaseWebServices;
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> addTrip({required AddTripParams addTripParams}) async{
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.addTrip(addTripParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> addInvoice({required AddInvoiceParams addInvoiceParams}) async{
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
  Future<Either<NetworkExceptions, BaseEntity>> cancelTrip({required CancelTripParams cancelTripParams})async {
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
  Future<Either<NetworkExceptions, BaseEntity>> editTrip({required EditTripParams editTripParams}) async{
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
  Future<Either<NetworkExceptions, BaseEntity>> tripArchive({required TripArchiveParams tripArchiveParams}) async{
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

    Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<T>>>>  _getResultWithPagination<
          T>(
      Future<BasePaginationEntity<PaginationEntity<T>>> Function() getPagination) async {
    try {
      if (await _networkInfo.isConnected) {
      var response = await getPagination();
      return Right(response);
      } else {
        return const Left(
            NetworkExceptions.noInternetConnection());
      }
    } catch (error) {
      return Left(NetworkExceptions.getDioException(error));
    }
  }
  
  @override
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<GetAllTripsPaginatedEntity>>>> getAllTripsPaginated() async{
 return await _getResultWithPagination(
      () => _employeeBaseWebServices.getAllTripsPaginated(),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<GetAllBranchesPaginatedEntity>>>> getAllBranches() async{
 return await _getResultWithPagination(
      () => _employeeBaseWebServices.getAllBranches(),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<ActiveTripsPaginatedEntity>>>> getAllActiveTrips() async{
 return await _getResultWithPagination(
      () => _employeeBaseWebServices.getAllActiveTrips(),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, GetTripInformationEntity>> getTripInfo({required GetTripInformationParams getTripInformationParams}) async{
   if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.getTripInfo(getTripInformationParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<ArchiveTripsPaginatedEntity>>>> getAllArchiveTrips()async {
 return await _getResultWithPagination(
      () => _employeeBaseWebServices.getAllArchiveTrips(),);
  }
  
  @override
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<TruckRecordPaginatedEntity>>>> getAllTruckRecordPaginated() async{
 return await _getResultWithPagination(
      () => _employeeBaseWebServices.getAllTruckRecordPaginated(),);
  }
  
  @override
  Future<Either<NetworkExceptions, GetAllReceiptsEntity>> getAllReceipt({required GetAllReceiptParams getAllReceiptParams}) async{
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
  Future<Either<NetworkExceptions, GetManifestEntity>> getManifest({required GetManifestParams getManifestParams}) async{
   if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.getManifest(getManifestParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, GetTruckInformationEntity>> getTruckInformation({required GetTruckInformationParams getTruckInformationParams}) async{
   if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.getTruckInformation(getTruckInformationParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, GetTruckRecordEntity>> getTruckRecord({required GetTruckRecordParams getTruckRecordParams}) async{
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
  Future<Either<NetworkExceptions, BaseEntity>> addCompliant({required AddCompliantParams addCompliantParams}) async{
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
  Future<Either<NetworkExceptions, BaseEntity>> addCustomer({required AddCustomerParams addCustomerParams}) async{
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
  Future<Either<NetworkExceptions, BaseEntity>> deleteCustomer({required DeleteCustomerParams deleteCustomerParams})async {
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
  Future<Either<NetworkExceptions, BaseEntity>> updateCustomer({required UpdateCustomerParams updateCustomerParams})async {
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
  Future<Either<NetworkExceptions, BaseEntity>> updateManifest({required UpdateManifestParams updateManifestParams})async {
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
  Future<Either<NetworkExceptions, BaseReportEntity>> getTripReport() async{
   if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.getTripReport();
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, BaseReportEntity>> getTruckReport() async{
   if (await _networkInfo.isConnected) {
      try {
        final response =
            await _employeeBaseWebServices.getTruckReport();
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
}