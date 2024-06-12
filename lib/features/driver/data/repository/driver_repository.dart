import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/core/handler/network_request_handler.dart';
import 'package:aloudeh_company/core/network/network_info.dart';
import 'package:aloudeh_company/features/driver/data/data_source/driver_web_services.dart';
import 'package:aloudeh_company/features/driver/data/entity/get_branch_location_entity.dart';
import 'package:aloudeh_company/features/driver/data/entity/log_in_driver_entity.dart';
import 'package:aloudeh_company/features/driver/data/entity/my_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/driver/data/params/get_branch_location_params.dart';
import 'package:aloudeh_company/features/driver/data/params/log_in_driver_params.dart';
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
      getAllMyTrips(int page);
          Future<Either<NetworkExceptions, GetBranchLocationEntity>> getBranchLocation(
      {required GetBranchLocationParams getBranchLocationParams});
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
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<MyTripsPaginatedEntity>>>> getAllMyTrips(int page) async{
 return await _getResultWithPagination(
      () => _driverBaseWebServices.getAllMyTrips(page),
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

}