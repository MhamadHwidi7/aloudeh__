// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_customers_paginated_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomerEmployeePaginatedEntity _$GetCustomerEmployeePaginatedEntityFromJson(
        Map<String, dynamic> json) =>
    GetCustomerEmployeePaginatedEntity(
      id: json['id'] as int,
      nationalId: json['national_id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as int,
      gender: json['gender'] as String,
      mobile: json['mobile'] as int,
      address: json['address'] as String,
      addressDetail: json['address_detail'] as String,
      notes: json['notes'] as String?,
      addedBy: json['added_by'] as String,
      deviceToken: json['device_token'] as String?,
    );

Map<String, dynamic> _$GetCustomerEmployeePaginatedEntityToJson(
        GetCustomerEmployeePaginatedEntity instance) =>
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
