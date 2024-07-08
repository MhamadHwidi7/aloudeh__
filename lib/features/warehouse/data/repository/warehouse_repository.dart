import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/core/handler/network_request_handler.dart';
import 'package:aloudeh_company/core/network/network_info.dart';
import 'package:aloudeh_company/features/warehouse/data/data_source/remote_data_source.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/get_all_good_paginated_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/get_archive_goods_paginated_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/get_good_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/get_manifest_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/log_in_warehouse_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/notification_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/role_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/warehouse_profile_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/params/add_good_params.dart';
import 'package:aloudeh_company/features/warehouse/data/params/delete_good_params.dart';
import 'package:aloudeh_company/features/warehouse/data/params/get_good_params.dart';
import 'package:aloudeh_company/features/warehouse/data/params/get_manifest_params.dart';
import 'package:aloudeh_company/features/warehouse/data/params/inventory_good_params.dart';
import 'package:aloudeh_company/features/warehouse/data/params/log_in_warehouse_params.dart';
import 'package:aloudeh_company/features/warehouse/data/params/receiving_good_params.dart';
import 'package:aloudeh_company/features/warehouse/data/params/send_trip_status_params.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class BaseWarehouseRepository{
    Future<Either<NetworkExceptions,LogInWarehouseEntity>> login({required LogInWarehouseParams logInWarehouseParams});
Future<Either<NetworkExceptions,BaseEntity>>addGood({required AddGoodParams addGoodParams});
Future<Either<NetworkExceptions,BaseEntity>>receivingGood({required ReceivingGoodParams receivingGoodParams});
Future<Either<NetworkExceptions,BaseEntity>>deleteGood({required DeleteGoodParams deleteGoodParams});
Future<Either<NetworkExceptions,GetGoodEntity>>getGood({required GetGoodParams getGoodParams});
Future<Either<NetworkExceptions,BaseEntity>>inventoryGood({required InventoryGoodsParams inventoryGoodsParams});
  Future<Either<NetworkExceptions,BasePaginationEntity<PaginationEntity<GetAllGoodPaginatedEntity>>>>
      getAllGoodPaginated(int page);
        Future<Either<NetworkExceptions,BasePaginationEntity<PaginationEntity<GetArchiveGoodsPaginatedEntity>>>>
      getArchiveGoodPaginated(int page);
      Future<Either<NetworkExceptions,RoleEntity>>getRole();
Future<Either<NetworkExceptions,BaseNotificationEntity>>getNotifications();
Future<Either<NetworkExceptions,WarehouseProfileEntity>>profile();
Future<Either<NetworkExceptions,BaseEntity>>sendTripStatus({required SendTripStatusParams sendTripStatusParams});
Future<Either<NetworkExceptions,GetManifestWarehouseEntity>>getManifest({required GetManifestParams getManifestParams});


}


@Singleton(as:BaseWarehouseRepository )
class WarehouseRepositoryImpl implements BaseWarehouseRepository{
  final NetworkInfo _networkInfo;
  final BaseWarehouseRemoteDataSource _baseWarehouseRemoteDataSource;

  WarehouseRepositoryImpl({required NetworkInfo networkInfo, required BaseWarehouseRemoteDataSource baseWarehouseRemoteDataSource}) : _networkInfo = networkInfo, _baseWarehouseRemoteDataSource = baseWarehouseRemoteDataSource;
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> addGood({required AddGoodParams addGoodParams}) async{
    return await handleNetworkRequest<BaseEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _baseWarehouseRemoteDataSource.addGood(
          addGoodParams),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> deleteGood({required DeleteGoodParams deleteGoodParams}) async{
    return await handleNetworkRequest<BaseEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _baseWarehouseRemoteDataSource.deleteGood(
          deleteGoodParams),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<GetAllGoodPaginatedEntity>>>> getAllGoodPaginated(int page) async{
 return await _getResultWithPagination(
      () => _baseWarehouseRemoteDataSource.getAllGoodPaginated(page),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, GetGoodEntity>> getGood({required GetGoodParams getGoodParams}) async{
    return await handleNetworkRequest<GetGoodEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _baseWarehouseRemoteDataSource.getGood(
          getGoodParams),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> inventoryGood({required InventoryGoodsParams inventoryGoodsParams}) async{
    return await handleNetworkRequest<BaseEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _baseWarehouseRemoteDataSource.inventoryGood(
          inventoryGoodsParams),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, LogInWarehouseEntity>> login({required LogInWarehouseParams logInWarehouseParams}) async{
  return await handleNetworkRequest<LogInWarehouseEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _baseWarehouseRemoteDataSource.login(
          logInWarehouseParams),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> receivingGood({required ReceivingGoodParams receivingGoodParams}) async{
    return await handleNetworkRequest<BaseEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _baseWarehouseRemoteDataSource.receivingGood(
          receivingGoodParams),
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
  Future<Either<NetworkExceptions, BasePaginationEntity<PaginationEntity<GetArchiveGoodsPaginatedEntity>>>> getArchiveGoodPaginated(int page) async{
 return await _getResultWithPagination(
      () => _baseWarehouseRemoteDataSource.getArchiveGoodPaginated(page),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, RoleEntity>> getRole() async{
  return await handleNetworkRequest<RoleEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _baseWarehouseRemoteDataSource.getRole(
          ),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BaseNotificationEntity>> getNotifications() async{
  return await handleNetworkRequest<BaseNotificationEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _baseWarehouseRemoteDataSource.getNotifications(),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, WarehouseProfileEntity>> profile() async{
  return await handleNetworkRequest<WarehouseProfileEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _baseWarehouseRemoteDataSource.profile(),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> sendTripStatus({required SendTripStatusParams sendTripStatusParams}) async{
   return await handleNetworkRequest<BaseEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _baseWarehouseRemoteDataSource.sendTripStatus(sendTripStatusParams),
    );
  }
  
  @override
  Future<Either<NetworkExceptions, GetManifestWarehouseEntity>> getManifest({required GetManifestParams getManifestParams}) async{
   return await handleNetworkRequest<GetManifestWarehouseEntity>(
      isConnected: () => _networkInfo.isConnected,
      apiCall: () => _baseWarehouseRemoteDataSource.getManifest(getManifestParams),
    );
  }
}