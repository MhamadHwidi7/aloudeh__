import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/network/network_info.dart';
import 'package:aloudeh_company/features/admin/data/entity/log_in_admin_entity.dart';
import 'package:aloudeh_company/features/admin/data/entity/register_admin_entity.dart';
import 'package:aloudeh_company/features/admin/data/params/add_branch_params.dart';
import 'package:aloudeh_company/features/admin/data/params/add_warehouse_manager_params.dart';
import 'package:aloudeh_company/features/admin/data/params/add_warehouse_params.dart';
import 'package:aloudeh_company/features/admin/data/params/delete_branch_params.dart';
import 'package:aloudeh_company/features/admin/data/params/delete_warehouse_params.dart';
import 'package:aloudeh_company/features/admin/data/params/log_in_admin_params.dart';
import 'package:aloudeh_company/features/admin/data/params/register_admin_params.dart';
import 'package:aloudeh_company/features/admin/data/params/update_branch_params.dart';
import 'package:aloudeh_company/features/admin/data/params/update_warehouse_params.dart';
import 'package:aloudeh_company/features/admin/data/web_services/admin_web_service.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class AdminBaseRepository{
    Future<Either<NetworkExceptions,RegisterAdminEntity>> register({required RegisterAdminParams registerAdminParams});
    Future<Either<NetworkExceptions,LogInAdminEntity>> logIn({required LogInAdminParams logInAdminParams});
    Future<Either<NetworkExceptions,BaseEntity>> addBranch({required AddBranchParams addBranchParams});
    Future<Either<NetworkExceptions,BaseEntity>> addWarehouse({required AddWarehouseParams addWarehouseParams});
    Future<Either<NetworkExceptions,BaseEntity>> addWarehouseManager({required AddWarehouseManagerParams addWarehouseManagerParams});
    Future<Either<NetworkExceptions,BaseEntity>> updateBranch({required UpdateBranchParams updateBranchParams});
    Future<Either<NetworkExceptions,BaseEntity>> updateWarehouse({required UpdateWarehouseParams updateWarehouseParams});
    Future<Either<NetworkExceptions,BaseEntity>> deleteBranch({required DeleteBranchParams deleteBranchParams});
    Future<Either<NetworkExceptions,BaseEntity>> deleteWarehouse({required DeleteWarehouseParams deleteWarehouseParams});

}

@Singleton(as: AdminBaseRepository)
class AdminRepositoryImpl implements AdminBaseRepository{
  final NetworkInfo _networkInfo;
  final AdminBaseWebService _adminBaseWebService;

  AdminRepositoryImpl({required NetworkInfo networkInfo, required AdminBaseWebService adminBaseWebService}) : _networkInfo = networkInfo, _adminBaseWebService = adminBaseWebService;
  
  @override
  Future<Either<NetworkExceptions, RegisterAdminEntity>> register({required RegisterAdminParams registerAdminParams}) async{
   if (await _networkInfo.isConnected) {
      try {
        final response =
            await _adminBaseWebService.register(registerAdminParams: registerAdminParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, LogInAdminEntity>> logIn({required LogInAdminParams logInAdminParams}) async{
   if (await _networkInfo.isConnected) {
      try {
        final response =
            await _adminBaseWebService.logIn(logInAdminParams: logInAdminParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> addBranch({required AddBranchParams addBranchParams}) async{
   if (await _networkInfo.isConnected) {
      try {
        final response =
            await _adminBaseWebService.addBranch(addBranchParams: addBranchParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> addWarehouse({required AddWarehouseParams addWarehouseParams})async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _adminBaseWebService.addWarehouse(addWarehouseParams: addWarehouseParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> addWarehouseManager({required AddWarehouseManagerParams addWarehouseManagerParams}) async{
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _adminBaseWebService.addWarehouseManager(addWarehouseManagerParams: addWarehouseManagerParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> updateBranch({required UpdateBranchParams updateBranchParams})async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _adminBaseWebService.updateBranch(updateBranchParams:updateBranchParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> updateWarehouse({required UpdateWarehouseParams updateWarehouseParams})async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _adminBaseWebService.updateWarehouse(updateWarehouseParams:updateWarehouseParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> deleteBranch({required DeleteBranchParams deleteBranchParams}) async{
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _adminBaseWebService.deleteBranch(deleteBranchParams:deleteBranchParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<Either<NetworkExceptions, BaseEntity>> deleteWarehouse({required DeleteWarehouseParams deleteWarehouseParams}) async{
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _adminBaseWebService.deleteWarehouse(deleteWarehouseParams:deleteWarehouseParams);
        return Right(response);
      } on Exception catch (ex) {
        return Left(NetworkExceptions.getDioException(ex));
      }
    } else {
      return const Left(NetworkExceptions.noInternetConnection());
    }
  }
}