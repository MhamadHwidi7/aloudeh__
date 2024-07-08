import 'package:json_annotation/json_annotation.dart';

part 'log_in_entity.g.dart';

@JsonSerializable()
class LogInEntity{
  final String token;

  LogInEntity({required this.token});


  factory LogInEntity.fromJson(Map<String, dynamic> json) =>
      _$LogInEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LogInEntityToJson(this);
}