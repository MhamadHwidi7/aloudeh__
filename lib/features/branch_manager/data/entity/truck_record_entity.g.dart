// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'truck_record_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseBMTruckRecordEntity _$BaseBMTruckRecordEntityFromJson(
        Map<String, dynamic> json) =>
    BaseBMTruckRecordEntity(
      data: (json['data'] as List<dynamic>)
          .map((e) => TruckRecordEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BaseBMTruckRecordEntityToJson(
        BaseBMTruckRecordEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

TruckRecordEntity _$TruckRecordEntityFromJson(Map<String, dynamic> json) =>
    TruckRecordEntity(
      id: json['id'] as int,
      number: json['number'] as int,
      line: json['line'] as String,
      createdBy: json['created_by'] as String,
      addingDate: json['adding_data'] as String,
      editingBy: json['editing_by'] as String?,
      editingDate: json['editing_date'] as String?,
      notes: json['notes'] as String?,
      branchId: json['branch_id'] as int,
    );

Map<String, dynamic> _$TruckRecordEntityToJson(TruckRecordEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'line': instance.line,
      'created_by': instance.createdBy,
      'adding_data': instance.addingDate,
      'editing_by': instance.editingBy,
      'editing_date': instance.editingDate,
      'notes': instance.notes,
      'branch_id': instance.branchId,
    };
