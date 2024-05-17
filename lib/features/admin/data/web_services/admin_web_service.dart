import 'package:aloudeh_company/core/api/api_consumer.dart';
import 'package:aloudeh_company/core/api/end_points.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/log_in_admin_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/register_admin_entity.dart';
import 'package:aloudeh_company/features/admin/data/model/log_in_admin_model.dart';
import 'package:aloudeh_company/features/admin/data/model/register_admin_model.dart';
import 'package:aloudeh_company/features/admin/data/params/add_branch_params.dart';
import 'package:aloudeh_company/features/admin/data/params/add_warehouse_manager_params.dart';
import 'package:aloudeh_company/features/admin/data/params/add_warehouse_params.dart';
import 'package:aloudeh_company/features/admin/data/params/delete_branch_params.dart';
import 'package:aloudeh_company/features/admin/data/params/delete_warehouse_params.dart';
import 'package:aloudeh_company/features/admin/data/params/log_in_admin_params.dart';
import 'package:aloudeh_company/features/admin/data/params/register_admin_params.dart';
import 'package:aloudeh_company/features/admin/data/params/update_branch_params.dart';
import 'package:aloudeh_company/features/admin/data/params/update_warehouse_params.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class AdminBaseWebService {
  Future<RegisterAdminModel> register(
      {required RegisterAdminParams registerAdminParams});
  Future<LogInAdminModel> logIn({required LogInAdminParams logInAdminParams});
  Future<BaseEntity> addBranch({required AddBranchParams addBranchParams});
  Future<BaseEntity> addWarehouse(
      {required AddWarehouseParams addWarehouseParams});
        Future<BaseEntity> addWarehouseManager(
      {required AddWarehouseManagerParams addWarehouseManagerParams});
              Future<BaseEntity> updateBranch(
      {required UpdateBranchParams updateBranchParams});
                    Future<BaseEntity> updateWarehouse(
      {required UpdateWarehouseParams updateWarehouseParams});
                          Future<BaseEntity> deleteBranch(
      {required DeleteBranchParams deleteBranchParams});
        Future<BaseEntity> deleteWarehouse(
      {required DeleteWarehouseParams deleteWarehouseParams});
}

@Singleton(as: AdminBaseWebService)
class AdminWebService implements AdminBaseWebService {
  final ApiConsumer _apiConsumer;

  AdminWebService({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<RegisterAdminModel> register(
      {required RegisterAdminParams registerAdminParams}) async {
    final response = await _apiConsumer.post(EndPoints.adminRegister,
        queryParameters: registerAdminParams.toJson());
    return RegisterAdminModel.fromEntity(
        RegisterAdminEntity.fromJson(response));
  }

  @override
  Future<LogInAdminModel> logIn(
      {required LogInAdminParams logInAdminParams}) async {
    final response = await _apiConsumer.post(EndPoints.adminLogIn,
        queryParameters: logInAdminParams.toJson());
    return LogInAdminModel.fromEntity(LogInAdminEntity.fromJson(response));
  }

  @override
  Future<BaseEntity> addBranch(
      {required AddBranchParams addBranchParams}) async {
    final response = await _apiConsumer.post(EndPoints.addbranch,
        body: addBranchParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> addWarehouse(
      {required AddWarehouseParams addWarehouseParams}) async {
    final response = await _apiConsumer.post(EndPoints.addWarehouse,
        body: addWarehouseParams.toJson());
    return BaseEntity.fromJson(response);
  }
  
  @override
  Future<BaseEntity> addWarehouseManager({required AddWarehouseManagerParams addWarehouseManagerParams}) async{
    final response = await _apiConsumer.post(EndPoints.addWarehouseManager,
        body: addWarehouseManagerParams.toJson());
    return BaseEntity.fromJson(response);
  }
  
  @override
  Future<BaseEntity> updateBranch({required UpdateBranchParams updateBranchParams}) async{
   final response = await _apiConsumer.post(EndPoints.updateBranch,
        body: updateBranchParams.toJson());
    return BaseEntity.fromJson(response);
  }
  
  @override
  Future<BaseEntity> updateWarehouse({required UpdateWarehouseParams updateWarehouseParams}) async{
   final response = await _apiConsumer.post(EndPoints.updateWarehouse,
        body: updateWarehouseParams.toJson());
    return BaseEntity.fromJson(response);
  }
  
  @override
  Future<BaseEntity> deleteBranch({required DeleteBranchParams deleteBranchParams}) async{
   final response = await _apiConsumer.post(EndPoints.deleteBranch,
        body: deleteBranchParams.toJson());
    return BaseEntity.fromJson(response);
  }
  
  @override
  Future<BaseEntity> deleteWarehouse({required DeleteWarehouseParams deleteWarehouseParams}) async{
   final response = await _apiConsumer.post(EndPoints.deleteWarehouse,
        body: deleteWarehouseParams.toJson());
    return BaseEntity.fromJson(response);
  }
}
