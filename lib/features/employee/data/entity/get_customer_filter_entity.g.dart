// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_filter_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomersFilterEntity _$GetCustomersFilterEntityFromJson(
        Map<String, dynamic> json) =>
    GetCustomersFilterEntity(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CustomerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCustomersFilterEntityToJson(
        GetCustomersFilterEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) => CustomerData(
      id: (json['id'] as num).toInt(),
      nationalId: json['national_id'] as String,
      name: json['name'] as String,
      phoneNumber: (json['phone_number'] as num).toInt(),
      gender: json['gender'] as String,
      mobile: (json['mobile'] as num).toInt(),
      address: json['address'] as String,
      addressDetail: json['address_detail'] as String,
    );

Map<String, dynamic> _$CustomerDataToJson(CustomerData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'national_id': instance.nationalId,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'gender': instance.gender,
      'mobile': instance.mobile,
      'address': instance.address,
      'address_detail': instance.addressDetail,
    };
