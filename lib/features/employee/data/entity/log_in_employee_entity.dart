import 'package:json_annotation/json_annotation.dart';

part 'log_in_employee_entity.g.dart';

@JsonSerializable()
class LogInEmployeeEntity{
  final String token;

  LogInEmployeeEntity({required this.token});


  factory LogInEmployeeEntity.fromJson(Map<String, dynamic> json) =>
      _$LogInEmployeeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LogInEmployeeEntityToJson(this);
}