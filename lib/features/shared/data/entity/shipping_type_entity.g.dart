// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_type_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypePaginatedSharedEntity _$TypePaginatedSharedEntityFromJson(
        Map<String, dynamic> json) =>
    TypePaginatedSharedEntity(
      id: (json['id'] as num).toInt(),
      cost: (json['cost'] as num).toInt(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$TypePaginatedSharedEntityToJson(
        TypePaginatedSharedEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cost': instance.cost,
      'type': instance.type,
    };
