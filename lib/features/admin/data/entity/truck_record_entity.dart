import 'package:json_annotation/json_annotation.dart';

part 'truck_record_entity.g.dart';

@JsonSerializable()
class BaseTruckRecordEntity {
  @JsonKey(name: "data")
  final List<TruckRecordEntity> data;

  BaseTruckRecordEntity({
    required this.data,

  });

  factory BaseTruckRecordEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseTruckRecordEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BaseTruckRecordEntityToJson(this);
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
