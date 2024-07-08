// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseBMVacationEntity _$BaseBMVacationEntityFromJson(
        Map<String, dynamic> json) =>
    BaseBMVacationEntity(
      data: (json['Vacations'] as List<dynamic>)
          .map((e) => VacationEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BaseBMVacationEntityToJson(
        BaseBMVacationEntity instance) =>
    <String, dynamic>{
      'Vacations': instance.data,
    };

VacationEntity _$VacationEntityFromJson(Map<String, dynamic> json) =>
    VacationEntity(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      userType: json['user_type'] as String,
      createdBy: json['created_by'] as String,
      end: json['end'] as String,
      start: json['start'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$VacationEntityToJson(VacationEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user_type': instance.userType,
      'created_by': instance.createdBy,
      'end': instance.end,
      'start': instance.start,
      'reason': instance.reason,
    };
