// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_manager_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseWarehouseManagerAdminEntity _$BaseWarehouseManagerAdminEntityFromJson(
        Map<String, dynamic> json) =>
    BaseWarehouseManagerAdminEntity(
      success: json['success'] as bool,
      message: json['message'] as String,
      data:
          WarehouseManagerEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseWarehouseManagerAdminEntityToJson(
        BaseWarehouseManagerAdminEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

WarehouseManagerEntity _$WarehouseManagerEntityFromJson(
        Map<String, dynamic> json) =>
    WarehouseManagerEntity(
      id: (json['id'] as num).toInt(),
      nationalId: json['national_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phoneNumber: (json['phone_number'] as num).toInt(),
      gender: json['gender'] as String,
      warehouseId: (json['warehouse_id'] as num).toInt(),
      motherName: json['mother_name'] as String,
      dateOfBirth: json['date_of_birth'] as String,
      managerAddress: json['manager_address'] as String,
      salary: (json['salary'] as num).toInt(),
      rank: json['rank'] as String,
      employmentDate: json['employment_date'] as String,
    );

Map<String, dynamic> _$WarehouseManagerEntityToJson(
        WarehouseManagerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'national_id': instance.nationalId,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone_number': instance.phoneNumber,
      'gender': instance.gender,
      'warehouse_id': instance.warehouseId,
      'mother_name': instance.motherName,
      'date_of_birth': instance.dateOfBirth,
      'manager_address': instance.managerAddress,
      'salary': instance.salary,
      'rank': instance.rank,
      'employment_date': instance.employmentDate,
    };
