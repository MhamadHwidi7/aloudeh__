
import 'package:json_annotation/json_annotation.dart';
part 'truck_record_paginated_entity.g.dart';

@JsonSerializable()
class TruckRecordPaginatedSharedEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'number')
  final int number;

  @JsonKey(name: 'line')
  final String line;

  @JsonKey(name: 'created_by')
  final String createdBy;

  @JsonKey(name: 'adding_data')
  final String addingDate;

  @JsonKey(name: 'editing_by')
  final String? editingBy;

  @JsonKey(name: 'editing_date')
  final String? editingDate;

  @JsonKey(name: 'notes')
  final String? notes;

  @JsonKey(name: 'branch_id')
  final int branchId;

  TruckRecordPaginatedSharedEntity({
    required this.id,
    required this.number,
    required this.line,
    required this.createdBy,
    required this.addingDate,
    required this.editingBy,
    required this.editingDate,
    required this.notes,
    required this.branchId,
  });

  factory TruckRecordPaginatedSharedEntity.fromJson(Map<String, dynamic> json) =>
      _$TruckRecordPaginatedSharedEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TruckRecordPaginatedSharedEntityToJson(this);
}
