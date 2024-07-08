// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_customers_paginated_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCustomersPaginatedSharedEntity
    _$GetAllCustomersPaginatedSharedEntityFromJson(Map<String, dynamic> json) =>
        GetAllCustomersPaginatedSharedEntity(
          id: (json['id'] as num).toInt(),
          nationalId: json['national_id'] as String,
          name: json['name'] as String,
          phoneNumber: (json['phone_number'] as num).toInt(),
          gender: json['gender'] as String,
          mobile: (json['mobile'] as num).toInt(),
          address: json['address'] as String,
          addressDetail: json['address_detail'] as String,
          notes: json['notes'] as String?,
          addedBy: json['added_by'] as String,
          deviceToken: json['device_token'] as String?,
        );

Map<String, dynamic> _$GetAllCustomersPaginatedSharedEntityToJson(
        GetAllCustomersPaginatedSharedEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'national_id': instance.nationalId,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'gender': instance.gender,
      'mobile': instance.mobile,
      'address': instance.address,
      'address_detail': instance.addressDetail,
      'notes': instance.notes,
      'added_by': instance.addedBy,
      'device_token': instance.deviceToken,
    };
