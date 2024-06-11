import 'package:aloudeh_company/core/api/api_consumer.dart';
import 'package:aloudeh_company/core/api/end_points.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/features/admin/data/params/promote_employee_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/entity/truck_record_entity.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/add_employee_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/add_shipping_cost_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/add_truck_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/add_vacation_employee_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/add_vacation_warehouse_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/delete_driver_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/delete_employee_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/delete_truck_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/rate_employee_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/truck_record_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/update_driver_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/update_employee_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/update_truck_params.dart';
import 'package:injectable/injectable.dart';

abstract class BranchManagerBaseWebServices {
  Future<BaseEntity> addEmployee(AddEmployeeParams addEmployeeParams);
  Future<BaseEntity> updateEmployee(UpdateEmployeeParams updateEmployeeParams);
  Future<BaseEntity> updateDriver(UpdateDriverParams updateDriverParams);
  Future<BaseEntity> deleteEmployee(DeleteEmployeeParams deleteEmployeeParams);
  Future<BaseEntity> addTruck(AddTruckParams addTruckParams);
  Future<BaseEntity> updateTruck(UpdateTruckParams updateTruckParams);
  Future<BaseEntity> deleteTruck(DeleteTruckParams deleteTruckParams);
  Future<BaseEntity> deleteDriver(DeleteDriverParams deleteDriverParams);
  Future<BaseEntity> promoteEmployee(
      PromoteEmployeeParams promoteEmployeeParams);
  Future<BaseEntity> rateEmployee(RateEmployeeParams rateEmployeeParams);
  Future<BaseBMTruckRecordEntity> truckRecord(TruckRecordParams truckRecordParams);
  Future<BaseEntity> addVacationWarehouse(AddVacationWarehouseParams addVacationWarehouseParams);
  Future<BaseEntity> addVacationEmployee(AddVacationEmployeeParams addVacationEmployeeParams);
  Future<BaseEntity> addShippingCost(ShippingCostParams addShippingCostParams);
  Future<BaseEntity> editShippingCost(ShippingCostParams editShippingCostParams);

}

@Singleton(as: BranchManagerBaseWebServices)
class BranchManagerWebServicesImpl implements BranchManagerBaseWebServices {
  final ApiConsumer _apiConsumer;

  BranchManagerWebServicesImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  Future<BaseEntity> addEmployee(AddEmployeeParams addEmployeeParams) async {
    final response = await _apiConsumer.post(EndPoints.addBMEmployee,
        body: addEmployeeParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> updateEmployee(
      UpdateEmployeeParams updateEmployeeParams) async {
    final response = await _apiConsumer.post(EndPoints.updateBMEmployee,
        body: updateEmployeeParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> updateDriver(UpdateDriverParams updateDriverParams) async {
    final response = await _apiConsumer.post(EndPoints.updateBMDriver,
        body: updateDriverParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> deleteEmployee(
      DeleteEmployeeParams deleteEmployeeParams) async {
    final response = await _apiConsumer.post(EndPoints.deleteBMEmployee,
        body: deleteEmployeeParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> addTruck(AddTruckParams addTruckParams) async {
    final response = await _apiConsumer.post(EndPoints.addBMTruck,
        body: addTruckParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> updateTruck(UpdateTruckParams updateTruckParams) async {
    final response = await _apiConsumer.post(EndPoints.updateBMTruck,
        body: updateTruckParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> deleteDriver(DeleteDriverParams deleteDriverParams) async {
    final response = await _apiConsumer.post(EndPoints.deleteBMDriver,
        body: deleteDriverParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> deleteTruck(DeleteTruckParams deleteTruckParams) async {
    final response = await _apiConsumer.post(EndPoints.deleteBMTruck,
        body: deleteTruckParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> promoteEmployee(
      PromoteEmployeeParams promoteEmployeeParams) async {
    final response = await _apiConsumer.post(EndPoints.promoteBMEmployee,
        body: promoteEmployeeParams.toJson());
    return BaseEntity.fromJson(response);
  }

  @override
  Future<BaseEntity> rateEmployee(RateEmployeeParams rateEmployeeParams) async {
    final response = await _apiConsumer.post(EndPoints.rateBMEmployee,
        body: rateEmployeeParams.toJson());
    return BaseEntity.fromJson(response);
  }
  
  @override
  Future<BaseBMTruckRecordEntity> truckRecord(TruckRecordParams truckRecordParams)async {
 final response = await _apiConsumer.get("${EndPoints.truckBMRecord}/${truckRecordParams.desk}");
 return BaseBMTruckRecordEntity.fromJson(response);
  }
  
  @override
  Future<BaseEntity> addVacationEmployee(AddVacationEmployeeParams addVacationEmployeeParams) async{
    final response = await _apiConsumer.post(EndPoints.addVacationBMEmployee,
        body: addVacationEmployeeParams.toJson());
    return BaseEntity.fromJson(response);
  }
  
  @override
  Future<BaseEntity> addVacationWarehouse(AddVacationWarehouseParams addVacationWarehouseParams) async{
    final response = await _apiConsumer.post(EndPoints.addVacationBMWarehouse,
        body: addVacationWarehouseParams.toJson());
    return BaseEntity.fromJson(response);
  }
  
  @override
  Future<BaseEntity> addShippingCost(ShippingCostParams addShippingCostParams) async{
    final response = await _apiConsumer.post(EndPoints.addShippingBMCost,
        body: addShippingCostParams.toJson());
    return BaseEntity.fromJson(response);
  }
  
  @override
  Future<BaseEntity> editShippingCost(ShippingCostParams editShippingCostParams) async{
   final response = await _apiConsumer.post(EndPoints.editShippingBMCost,
        body: editShippingCostParams.toJson());
    return BaseEntity.fromJson(response);
  }
}
