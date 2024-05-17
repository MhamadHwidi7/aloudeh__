import 'package:json_annotation/json_annotation.dart';

part 'log_in_admin_entity.g.dart';

@JsonSerializable()
class LogInAdminEntity{
  final String token;

  LogInAdminEntity({required this.token});


  factory LogInAdminEntity.fromJson(Map<String, dynamic> json) =>
      _$LogInAdminEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LogInAdminEntityToJson(this);
}