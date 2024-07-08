import 'package:aloudeh_company/core/api/api_consumer.dart';
import 'package:aloudeh_company/core/api/end_points.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
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
import 'package:injectable/injectable.dart';

abstract class BaseWarehouseRemoteDataSource{
  Future<LogInWarehouseEntity> login(LogInWarehouseParams logInWarehouseParams);
Future<BaseEntity>addGood(AddGoodParams addGoodParams);
Future<BaseEntity>receivingGood(ReceivingGoodParams receivingGoodParams);
Future<BaseEntity>deleteGood(DeleteGoodParams deleteGoodParams);
Future<GetGoodEntity>getGood(GetGoodParams getGoodParams);
Future<BaseEntity>inventoryGood(InventoryGoodsParams inventoryGoodsParams);
  Future<BasePaginationEntity<PaginationEntity<GetAllGoodPaginatedEntity>>>
      getAllGoodPaginated(int page);
      Future<BasePaginationEntity<PaginationEntity<GetArchiveGoodsPaginatedEntity>>>
      getArchiveGoodPaginated(int page);
      //!Note:make it more base abstract 
      Future<RoleEntity>getRole();
      Future<BaseNotificationEntity>getNotifications();
      Future<WarehouseProfileEntity>profile();
Future<BaseEntity>sendTripStatus(SendTripStatusParams sendTripStatusParams);
Future<GetManifestWarehouseEntity>getManifest(GetManifestParams getManifestParams);


}
@Singleton(as: BaseWarehouseRemoteDataSource)
class WarehouseRemoteDataSourceImpl implements BaseWarehouseRemoteDataSource{
  final ApiConsumer _apiConsumer;

  WarehouseRemoteDataSourceImpl({required ApiConsumer apiConsumer}) : _apiConsumer = apiConsumer;
  
  @override
  Future<BaseEntity> addGood(AddGoodParams addGoodParams) async{
    final response = await _apiConsumer.post(EndPoints.addGoodWarehouse,
        body: addGoodParams.toJson());
    return BaseEntity.fromJson(response);
  }
  
  @override
  Future<BaseEntity> deleteGood(DeleteGoodParams deleteGoodParams) async{
    final response = await _apiConsumer.post(EndPoints.deleteGoodWarehouse,
        body: deleteGoodParams.toJson());
    return BaseEntity.fromJson(response);
  }
  
  @override
  Future<BasePaginationEntity<PaginationEntity<GetAllGoodPaginatedEntity>>> getAllGoodPaginated(int page) async{
    return await _getResultWithPagination(
        () => _apiConsumer.get(EndPoints.getAllGoodsPaginatedWarehouse,queryParameters: {"page":page}
           ),
        (json) => GetAllGoodPaginatedEntity.fromJson(json));
  }
  
  @override
  Future<GetGoodEntity> getGood(GetGoodParams getGoodParams) async{
    final response = await _apiConsumer.post(EndPoints.getGoodWarehouse,
        body: getGoodParams.toJson());
    return GetGoodEntity.fromJson(response);
  }
  
  @override
  Future<BaseEntity> inventoryGood(InventoryGoodsParams inventoryGoodsParams) async{
    final response = await _apiConsumer.post(EndPoints.inventoryWarehouse,
        body: inventoryGoodsParams.toJson());
    return BaseEntity.fromJson(response);
  }
  
  @override
  Future<LogInWarehouseEntity> login(LogInWarehouseParams logInWarehouseParams) async{
    final response = await _apiConsumer.post(EndPoints.warehouseLogIn,
        queryParameters: logInWarehouseParams.toJson());
    return LogInWarehouseEntity.fromJson(response);
  }
  
  @override
  Future<BaseEntity> receivingGood(ReceivingGoodParams receivingGoodParams) async{
    final response = await _apiConsumer.post(EndPoints.receivingGoodWarehouse,
        body: receivingGoodParams.toJson());
    return BaseEntity.fromJson(response);
  }

    Future<BasePaginationEntity<PaginationEntity<T>>> _getResultWithPagination<T>(
      Future<dynamic> Function() api, T Function(dynamic json) fromJson) async {
    var response = await api();

    return BasePaginationEntity.fromJson(
      response, 
      (paginated) => PaginationEntity.fromJson(
        paginated,
        (data) => fromJson(data),
      ),
    );
  }
  
  @override
  Future<BasePaginationEntity<PaginationEntity<GetArchiveGoodsPaginatedEntity>>> getArchiveGoodPaginated(int page)async {
    return await _getResultWithPagination(
        () => _apiConsumer.get(EndPoints.getArchiveGoodsPaginatedWarehouse,queryParameters: {"page":page}
           ),
        (json) => GetArchiveGoodsPaginatedEntity.fromJson(json));
  }
  
  @override
  Future<RoleEntity> getRole() async{
    final response = await _apiConsumer.get(EndPoints.getRoleP);
    return RoleEntity.fromJson(response);
  }
  
  @override
  Future<BaseNotificationEntity> getNotifications()async {
    final response = await _apiConsumer.get(EndPoints.getWHNotification);
    return BaseNotificationEntity.fromJson(response);
  }
  
  @override
  Future<WarehouseProfileEntity> profile() async{
    final response = await _apiConsumer.get(EndPoints.getWHProfile);
    return WarehouseProfileEntity.fromJson(response);
  }
  
  @override
  Future<BaseEntity> sendTripStatus(SendTripStatusParams sendTripStatusParams)async{
      final response = await _apiConsumer.post(EndPoints.sendWHTripStatus,
        body: sendTripStatusParams.toJson());
    return BaseEntity.fromJson(response);
  }
  
  @override
  Future<GetManifestWarehouseEntity> getManifest(GetManifestParams getManifestParams) async{
    final response = await _apiConsumer.get(
        "${EndPoints.getManifestWarehouse}/${getManifestParams.tripNumber}");
    return GetManifestWarehouseEntity.fromJson(response);
  }
}