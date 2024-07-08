import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/core/handler/network_request_handler.dart';
import 'package:aloudeh_company/core/network/network_info.dart';
import 'package:aloudeh_company/features/driver/data/data_source/driver_web_services.dart';
import 'package:aloudeh_company/features/driver/data/entity/base_place_directions_entity.dart';
import 'package:aloudeh_company/features/driver/data/entity/driver_profile_entity.dart';
import 'package:aloudeh_company/features/driver/data/entity/get_branch_location_entity.dart';
import 'package:aloudeh_company/features/driver/data/entity/log_in_driver_entity.dart';
import 'package:aloudeh_company/features/driver/data/entity/my_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/driver/data/params/edit_profile_params.dart';
import 'package:aloudeh_company/features/driver/data/params/get_branch_location_params.dart';
import 'package:aloudeh_company/features/driver/data/params/log_in_driver_params.dart';
import 'package:aloudeh_company/features/driver/data/params/shortest_path_params.dart';
import 'package:aloudeh_company/features/driver/data/params/update_location_driver_params.dart';
import 'package:aloudeh_company/features/shared/data/params/paginated_params.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class DriverBaseRepository{
    Future<Either<NetworkExceptions, LogInDriverEntity>> logIn(
      {required LogInDriverParams logInDriverParams});
                  Future<
          Either<
              NetworkExceptions,
              BasePaginationEntity<
                  PaginationEntity<MyTripsPaginatedEntity>>>>
      getAllMyTrips(PaginatedParams paginatedParams);
          Future<Either<NetworkExceptions, GetBranchLocationEntity>> getBranchLocation(
      {required GetBranchLocationParams getBranchLocationParams});
 Future<Either<NetworkExceptions, BaseDriverProfileEntity>> getDriverProfile(
      );
 Future<Either<NetworkExceptions, BasePlaceDirectionsEntity>> getShortestPath(ShortestPathParams shortestPathParams);
 Future<Either<NetworkExceptions, BaseEntity>> updateeLocationDriver(UpdateLocationDriverParams updateLocationDriverParams);
 Future<Either<NetworkExceptions, BaseEntity>> editDriverProfile(EditDriverProfileParams editDriverProfileParams);


}
@Singleton(as: DriverBaseRepository)
class DriverRepositoryImpl implements DriverBaseRepository{
final NetworkInfo _networkInfo;
final DriverBaseWebServices _driverBaseWebServices;

  DriverRepositoryImpl({required NetworkInfo networkInfo, required DriverBaseWebServices driverBaseWebServices}) : _networkInfo = networkInfo, _driverBaseWebServices = driverBaseWebServices;
  
  @override
  Future<Either<NetworkExceptions, LogInDriverEntity>> logIn({required LogInDriverParams logInDriverParams}) async{
    return await handleNetworkRequest<LogInDriverEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _driverBaseWebServices.logIn(
          logInDriverParams: logInDriverParams),
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
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<MyTripsPaginatedEntity>>>> getAllMyTrips(PaginatedParams paginatedParams) async{
 return await _getResultWithPagination(
      () => _driverBaseWebServices.getAllMyTrips(paginatedParams),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, GetBranchLocationEntity>> getBranchLocation({required GetBranchLocationParams getBranchLocationParams}) async{
    return await handleNetworkRequest<GetBranchLocationEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _driverBaseWebServices.getBranchLocation(
          getBranchLocationParams: getBranchLocationParams),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BaseDriverProfileEntity>> getDriverProfile() async{
    return await handleNetworkRequest<BaseDriverProfileEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _driverBaseWebServices.getDriverProfile(),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BasePlaceDirectionsEntity>> getShortestPath(ShortestPathParams shortestPathParams) async{
    return await handleNetworkRequest<BasePlaceDirectionsEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _driverBaseWebServices.getShortestPath(shortestPathParams),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> updateeLocationDriver(UpdateLocationDriverParams updateLocationDriverParams) async{
    return await handleNetworkRequest<BaseEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _driverBaseWebServices.updateeLocationDriver(updateLocationDriverParams),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> editDriverProfile(EditDriverProfileParams editDriverProfileParams) async{
   return await handleNetworkRequest<BaseEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _driverBaseWebServices.editDriverProfile(editDriverProfileParams),
    );
  }

}