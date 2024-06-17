import 'package:json_annotation/json_annotation.dart';

part 'get_all_drivers_entity.g.dart';

@JsonSerializable()
class DriverEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'employment_date')
  final String employmentDate;

  DriverEntity({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.employmentDate,
  });

  factory DriverEntity.fromJson(Map<String, dynamic> json) => _$DriverEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DriverEntityToJson(this);
}

@JsonSerializable()
class BaseDriverEntity {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'data')
  final List<DriverEntity> data;

  @JsonKey(name: 'message')
  final String message;

  BaseDriverEntity({
    required this.success,
    required this.data,
    required this.message,
  });

  factory BaseDriverEntity.fromJson(Map<String, dynamic> json) => _$BaseDriverEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BaseDriverEntityToJson(this);
}
