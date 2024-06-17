// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseTrackingEntity _$BaseTrackingEntityFromJson(Map<String, dynamic> json) =>
    BaseTrackingEntity(
      message: json['message'] as String,
      data: DriverTrackingEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseTrackingEntityToJson(BaseTrackingEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

DriverTrackingEntity _$DriverTrackingEntityFromJson(
        Map<String, dynamic> json) =>
    DriverTrackingEntity(
      driverCurrentLat: (json['current_lat'] as num).toDouble(),
      driverCurrentLng: (json['current_lng'] as num).toDouble(),
    );

Map<String, dynamic> _$DriverTrackingEntityToJson(
        DriverTrackingEntity instance) =>
    <String, dynamic>{
      'current_lat': instance.driverCurrentLat,
      'current_lng': instance.driverCurrentLng,
    };
