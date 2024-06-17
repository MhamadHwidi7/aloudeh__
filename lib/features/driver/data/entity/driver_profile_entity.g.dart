// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseDriverProfileEntity _$BaseDriverProfileEntityFromJson(
        Map<String, dynamic> json) =>
    BaseDriverProfileEntity(
      message: json['message'] as String,
      driverProfileEntity: (json['data'] as List<dynamic>)
          .map((e) => DriverProfileEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BaseDriverProfileEntityToJson(
        BaseDriverProfileEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.driverProfileEntity,
    };

DriverProfileEntity _$DriverProfileEntityFromJson(Map<String, dynamic> json) =>
    DriverProfileEntity(
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String,
      address: json['address'] as String,
      employmentDate: json['employment_date'] as String,
    );

Map<String, dynamic> _$DriverProfileEntityToJson(
        DriverProfileEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'employment_date': instance.employmentDate,
    };
