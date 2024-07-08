import 'package:json_annotation/json_annotation.dart';

part 'get_role_entity.g.dart';

@JsonSerializable()
class RoleEntity{
  final String role;

  RoleEntity({required this.role});


  factory RoleEntity.fromJson(Map<String, dynamic> json) =>
      _$RoleEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RoleEntityToJson(this);
}