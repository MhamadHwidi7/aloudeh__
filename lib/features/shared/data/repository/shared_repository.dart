import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/core/handler/network_request_handler.dart';
import 'package:aloudeh_company/core/network/network_info.dart';
import 'package:aloudeh_company/features/shared/data/entity/active_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/archive_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/close_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/driver_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_all_branches_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_branch_details_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_manifest_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_role_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_trip_information_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_truck_information_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/shipping_type_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/truck_record_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/params/forget_password_params.dart';
import 'package:aloudeh_company/features/shared/data/params/get_branch_details_params.dart';
import 'package:aloudeh_company/features/shared/data/params/manifest_params.dart';
import 'package:aloudeh_company/features/shared/data/params/paginated_params.dart';
import 'package:aloudeh_company/features/shared/data/params/trip_information_params.dart';
import 'package:aloudeh_company/features/shared/data/params/truck_information_params.dart';
import 'package:aloudeh_company/features/shared/data/web_services/shared_web_services.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/get_all_good_paginated_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class SharedBaseRepository {
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<GetAllGoodPaginatedEntity>>>>
      getAllGoodPaginated(int page);

  Future<Either<NetworkExceptions, RoleEntity>> getRole();

  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<GetAllBranchesPaginatedSharedEntity>>>>
      getAllBranches({required PaginatedParams paginatedParams});
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<ActiveTripsPaginatedSharedEntity>>>>
      getAllActiveTrips({required PaginatedParams paginatedParams});
        Future<
         Either<NetworkExceptions, BasePaginationEntity<
              PaginationEntity<TypePaginatedSharedEntity>>>>
      shippingPriceList({required PaginatedParams paginatedParams});
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<ClosedTripsPaginatedSharedEntity>>>>
      getAllClosedTrips({required PaginatedParams paginatedParams});
  Future<Either<NetworkExceptions, GetTripInformationSharedEntity>>
      getTripInformation(
          {required TripInformationSharedParams tripInformationSharedParams});
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<ArchiveTripsPaginatedSharedEntity>>>>
      getAllArchiveTrips({required PaginatedParams paginatedParams});
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<TruckRecordPaginatedSharedEntity>>>>
      getAllTruckRecordPaginated({required PaginatedParams paginatedParams});

  Future<Either<NetworkExceptions, GetTruckInformationSharedEntity>>
      getTruckInformation(
          {required TruckInformationSharedParams truckInformationSharedParams});
  Future<Either<NetworkExceptions, GetManifestSharedEntity>> getManifest(
      {required ManifestSharedParams manifestSharedParams});
  Future<Either<NetworkExceptions, BaseDriverSharedEntity>> getAllDrivers();
    Future<Either<NetworkExceptions, GetBranchDetailSharedEntity>> getBranchDetails({required GetBranchDetailsSharedParams getBranchDetailsSharedParams});
  Future<Either<NetworkExceptions, BaseEntity>> forgetPassword({required ForgetPasswordSharedParams forgetPasswordSharedParams});

}

@Singleton(as: SharedBaseRepository)
class SharedRepositoryImpl implements SharedBaseRepository {
  final SharedBaseWebServices _sharedBaseWebServices;
  final NetworkInfo _networkInfo;

  SharedRepositoryImpl(
      {required SharedBaseWebServices sharedBaseWebServices,
      required NetworkInfo networkInfo})
      : _sharedBaseWebServices = sharedBaseWebServices,
        _networkInfo = networkInfo;
  @override
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<GetAllGoodPaginatedEntity>>>>
      getAllGoodPaginated(int page) async {
    return await _getResultWithPagination(
      () => _sharedBaseWebServices.getAllGoodPaginated(page),
    );
  }

  @override
  Future<Either<NetworkExceptions, RoleEntity>> getRole() async {
    return await handleNetworkRequest<RoleEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _sharedBaseWebServices.getRole(),
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
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<ActiveTripsPaginatedSharedEntity>>>>
      getAllActiveTrips({required PaginatedParams paginatedParams}) async {
    return await _getResultWithPagination(
      () => _sharedBaseWebServices.getAllActiveTrips(paginatedParams),
    );
  }

  @override
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<GetAllBranchesPaginatedSharedEntity>>>>
      getAllBranches({required PaginatedParams paginatedParams}) async {
    return await _getResultWithPagination(
      () => _sharedBaseWebServices.getAllBranches(paginatedParams),
    );
  }

  @override
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<ClosedTripsPaginatedSharedEntity>>>>
      getAllClosedTrips({required PaginatedParams paginatedParams}) async {
    return await _getResultWithPagination(
      () => _sharedBaseWebServices.getAllClosedTrips(paginatedParams),
    );
  }

  @override
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<ArchiveTripsPaginatedSharedEntity>>>>
      getAllArchiveTrips({required PaginatedParams paginatedParams}) async {
    return await _getResultWithPagination(
      () => _sharedBaseWebServices.getAllArchiveTrips(paginatedParams),
    );
  }

  @override
  Future<Either<NetworkExceptions, BaseDriverSharedEntity>>
      getAllDrivers() async {
    return await handleNetworkRequest<BaseDriverSharedEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _sharedBaseWebServices.getAllDrivers(),
    );
  }

  @override
  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<TruckRecordPaginatedSharedEntity>>>>
      getAllTruckRecordPaginated(
          {required PaginatedParams paginatedParams}) async {
    return await _getResultWithPagination(
      () => _sharedBaseWebServices.getAllTruckRecordPaginated(paginatedParams),
    );
  }

  @override
  Future<Either<NetworkExceptions, GetManifestSharedEntity>> getManifest(
      {required ManifestSharedParams manifestSharedParams}) async {
    return await handleNetworkRequest<GetManifestSharedEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _sharedBaseWebServices.getManifest(manifestSharedParams),
    );
  }

  @override
  Future<Either<NetworkExceptions, GetTripInformationSharedEntity>>
      getTripInformation(
          {required TripInformationSharedParams
              tripInformationSharedParams}) async {
    return await handleNetworkRequest<GetTripInformationSharedEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _sharedBaseWebServices
          .getTripInformation(tripInformationSharedParams),
    );
  }

  @override
  Future<Either<NetworkExceptions, GetTruckInformationSharedEntity>>
      getTruckInformation(
          {required TruckInformationSharedParams
              truckInformationSharedParams}) async {
    return await handleNetworkRequest<GetTruckInformationSharedEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _sharedBaseWebServices
          .getTruckInformation(truckInformationSharedParams),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, GetBranchDetailSharedEntity>> getBranchDetails({required GetBranchDetailsSharedParams getBranchDetailsSharedParams}) async{
    return await handleNetworkRequest<GetBranchDetailSharedEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _sharedBaseWebServices
          .getBranchDetails(getBranchDetailsSharedParams:  getBranchDetailsSharedParams),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<TypePaginatedSharedEntity>>>> shippingPriceList({required PaginatedParams paginatedParams}) async{
    return await _getResultWithPagination(
      () => _sharedBaseWebServices.shippingPriceList(paginatedParams),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> forgetPassword({required ForgetPasswordSharedParams forgetPasswordSharedParams}) async{
     return await handleNetworkRequest<BaseEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _sharedBaseWebServices
          .forgetPassword(forgetPasswordSharedParams),
    );
  }
}
