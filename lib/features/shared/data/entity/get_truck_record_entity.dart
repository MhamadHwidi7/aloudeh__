import 'package:json_annotation/json_annotation.dart';

part 'get_truck_record_entity.g.dart';

@JsonSerializable()
class GetTruckRecordSharedEntity {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'data')
  final List<TruckRecord> data;

  GetTruckRecordSharedEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetTruckRecordSharedEntity.fromJson(Map<String, dynamic> json) =>
      _$GetTruckRecordSharedEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetTruckRecordSharedEntityToJson(this);
}

@JsonSerializable()
class TruckRecord {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'number')
  final int number;

  @JsonKey(name: 'line')
  final String line;

  @JsonKey(name: 'created_by')
  final String createdBy;

  @JsonKey(name: 'adding_data')
  final String addingData;

  @JsonKey(name: 'editing_by')
  final String? editingBy;

  @JsonKey(name: 'editing_date')
  final String? editingDate;

  @JsonKey(name: 'notes')
  final String? notes;

  @JsonKey(name: 'branch_id')
  final int branchId;

  TruckRecord({
    required this.id,
    required this.number,
    required this.line,
    required this.createdBy,
    required this.addingData,
    this.editingBy,
    this.editingDate,
    this.notes,
    required this.branchId,
  });

  factory TruckRecord.fromJson(Map<String, dynamic> json) =>
      _$TruckRecordFromJson(json);

  Map<String, dynamic> toJson() => _$TruckRecordToJson(this);
}
