// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_paginated_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypePaginatedEntity _$TypePaginatedEntityFromJson(Map<String, dynamic> json) =>
    TypePaginatedEntity(
      id: json['id'] as int,
      cost: json['cost'] as int,
      type: json['type'] as String,
    );

Map<String, dynamic> _$TypePaginatedEntityToJson(
        TypePaginatedEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cost': instance.cost,
      'type': instance.type,
    };
