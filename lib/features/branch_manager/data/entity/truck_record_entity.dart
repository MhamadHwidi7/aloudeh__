
import 'package:json_annotation/json_annotation.dart';

part 'truck_record_entity.g.dart';

@JsonSerializable()
class BaseBMTruckRecordEntity {
  @JsonKey(name: "data")
  final List<TruckRecordEntity> data;

  BaseBMTruckRecordEntity({
    required this.data,

  });

  factory BaseBMTruckRecordEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseBMTruckRecordEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BaseBMTruckRecordEntityToJson(this);
}

@JsonSerializable()
class TruckRecordEntity {
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

  TruckRecordEntity({
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

  factory TruckRecordEntity.fromJson(Map<String, dynamic> json) =>
      _$TruckRecordEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TruckRecordEntityToJson(this);
}
