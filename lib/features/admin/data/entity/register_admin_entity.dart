import 'package:json_annotation/json_annotation.dart';

part 'register_admin_entity.g.dart';

@JsonSerializable()
class RegisterAdminEntity{
  final String token;

  RegisterAdminEntity({required this.token});


  factory RegisterAdminEntity.fromJson(Map<String, dynamic> json) =>
      _$RegisterAdminEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterAdminEntityToJson(this);
}