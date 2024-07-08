// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseProfileEntity _$WarehouseProfileEntityFromJson(
        Map<String, dynamic> json) =>
    WarehouseProfileEntity(
      success: json['success'] as bool,
      profileData:
          ProfileDataEntity.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$WarehouseProfileEntityToJson(
        WarehouseProfileEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.profileData,
      'message': instance.message,
    };

ProfileDataEntity _$ProfileDataEntityFromJson(Map<String, dynamic> json) =>
    ProfileDataEntity(
      rank: json['rank'] as String,
      email: json['email'] as String,
      phoneNumber: (json['phone_number'] as num).toInt(),
      address: json['manager_address'] as String,
      birthDate: json['date_of_birth'] as String,
    );

Map<String, dynamic> _$ProfileDataEntityToJson(ProfileDataEntity instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'manager_address': instance.address,
      'date_of_birth': instance.birthDate,
    };
