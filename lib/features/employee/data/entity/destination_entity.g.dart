// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseDestinationEntity _$BaseDestinationEntityFromJson(
        Map<String, dynamic> json) =>
    BaseDestinationEntity(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$BaseDestinationEntityToJson(
        BaseDestinationEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
