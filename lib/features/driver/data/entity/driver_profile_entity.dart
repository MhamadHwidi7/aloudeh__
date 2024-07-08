import 'package:json_annotation/json_annotation.dart';

part 'driver_profile_entity.g.dart';
@JsonSerializable()
class BaseDriverProfileEntity {
  final String message;
  @JsonKey(name: "data")
final List<DriverProfileEntity> driverProfileEntity;

  factory BaseDriverProfileEntity.fromJson(Map<String, dynamic> json) => _$BaseDriverProfileEntityFromJson(json);

  BaseDriverProfileEntity({required this.message, required this.driverProfileEntity});

  Map<String, dynamic> toJson() => _$BaseDriverProfileEntityToJson(this);
}

@JsonSerializable()
class DriverProfileEntity {
  // @JsonKey(name: 'id')
  // final int driverId;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'employment_date')
  final String employmentDate;



  factory DriverProfileEntity.fromJson(Map<String, dynamic> json) => _$DriverProfileEntityFromJson(json);

  DriverProfileEntity({ required this.name, required this.phoneNumber, required this.address, required this.employmentDate});

  Map<String, dynamic> toJson() => _$DriverProfileEntityToJson(this);
}