import 'package:json_annotation/json_annotation.dart';

part 'report_entity.g.dart';

@JsonSerializable()
class BaseReportEntity {
  @JsonKey(name: 'reports')
  final List<ReportEntity> reports;

  BaseReportEntity({required this.reports});

  factory BaseReportEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseReportEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BaseReportEntityToJson(this);
}


@JsonSerializable()
class ReportEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'file_path')
  final String filePath;

  @JsonKey(name: 'start_date')
  final String startDate;

  @JsonKey(name: 'end_date')
  final String endDate;

  ReportEntity({
    required this.id,
    required this.filePath,
    required this.startDate,
    required this.endDate,

  });

  factory ReportEntity.fromJson(Map<String, dynamic> json) =>
      _$ReportEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReportEntityToJson(this);
}
