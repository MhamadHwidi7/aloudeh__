// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseDriverSharedEntity _$BaseDriverSharedEntityFromJson(
        Map<String, dynamic> json) =>
    BaseDriverSharedEntity(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => DriverEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$BaseDriverSharedEntityToJson(
        BaseDriverSharedEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

DriverEntity _$DriverEntityFromJson(Map<String, dynamic> json) => DriverEntity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String,
      address: json['address'] as String,
      employmentDate: json['employment_date'] as String,
    );

Map<String, dynamic> _$DriverEntityToJson(DriverEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'employment_date': instance.employmentDate,
    };
