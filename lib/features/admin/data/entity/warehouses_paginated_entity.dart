import 'package:json_annotation/json_annotation.dart';

part 'warehouses_paginated_entity.g.dart';

@JsonSerializable()
class WarehousesPaginatedEntity {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'address')
  final String address;
  @JsonKey(name: 'area')
  final String area;
  @JsonKey(name: 'notes')
  final String? notes;
  @JsonKey(name: 'branch_id')
  final int branchId;
  @JsonKey(name: 'warehouse_name')
  final String warehouseName;

  WarehousesPaginatedEntity({
    required this.id,
    required this.address,
    required this.area,
    this.notes,
    required this.branchId,
    required this.warehouseName,
  });

  factory WarehousesPaginatedEntity.fromJson(Map<String, dynamic> json) =>
      _$WarehousesPaginatedEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WarehousesPaginatedEntityToJson(this);
}
