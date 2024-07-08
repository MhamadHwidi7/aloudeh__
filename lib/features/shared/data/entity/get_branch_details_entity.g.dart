// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_branch_details_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBranchDetailSharedEntity _$GetBranchDetailSharedEntityFromJson(
        Map<String, dynamic> json) =>
    GetBranchDetailSharedEntity(
      success: json['success'] as bool,
      data: BranchData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetBranchDetailSharedEntityToJson(
        GetBranchDetailSharedEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

BranchData _$BranchDataFromJson(Map<String, dynamic> json) => BranchData(
      openingDate: json['opening_date'] as String,
      desk: json['desk'] as String,
      address: json['address'] as String,
      phone: (json['phone'] as num).toInt(),
      trips: (json['trips'] as List<dynamic>)
          .map((e) => Trip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BranchDataToJson(BranchData instance) =>
    <String, dynamic>{
      'opening_date': instance.openingDate,
      'desk': instance.desk,
      'address': instance.address,
      'phone': instance.phone,
      'trips': instance.trips,
    };

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      date: json['date'] as String,
      number: json['number'] as String,
      driverName: json['driver_name'] as String,
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'date': instance.date,
      'number': instance.number,
      'driver_name': instance.driverName,
    };
