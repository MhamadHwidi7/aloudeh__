// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseReportEntity _$BaseReportEntityFromJson(Map<String, dynamic> json) =>
    BaseReportEntity(
      reports: (json['reports'] as List<dynamic>)
          .map((e) => ReportEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BaseReportEntityToJson(BaseReportEntity instance) =>
    <String, dynamic>{
      'reports': instance.reports,
    };

ReportEntity _$ReportEntityFromJson(Map<String, dynamic> json) => ReportEntity(
      id: (json['id'] as num).toInt(),
      filePath: json['file_path'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
    );

Map<String, dynamic> _$ReportEntityToJson(ReportEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_path': instance.filePath,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };
