// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouses_paginated_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehousesPaginatedEntity _$WarehousesPaginatedEntityFromJson(
        Map<String, dynamic> json) =>
    WarehousesPaginatedEntity(
      id: (json['id'] as num).toInt(),
      address: json['address'] as String,
      area: json['area'] as String,
      notes: json['notes'] as String?,
      branchId: (json['branch_id'] as num).toInt(),
      warehouseName: json['warehouse_name'] as String,
    );

Map<String, dynamic> _$WarehousesPaginatedEntityToJson(
        WarehousesPaginatedEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'area': instance.area,
      'notes': instance.notes,
      'branch_id': instance.branchId,
      'warehouse_name': instance.warehouseName,
    };
