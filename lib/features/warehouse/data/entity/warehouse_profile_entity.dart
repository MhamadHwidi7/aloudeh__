import 'package:json_annotation/json_annotation.dart';

part 'warehouse_profile_entity.g.dart';

@JsonSerializable()
class WarehouseProfileEntity {
  final bool success;
  @JsonKey(name: 'data')
  final ProfileDataEntity profileData;
  final String message;

  WarehouseProfileEntity({required this.success, required this.profileData, required this.message});

  factory WarehouseProfileEntity.fromJson(Map<String, dynamic> json) => _$WarehouseProfileEntityFromJson(json);
  Map<String, dynamic> toJson() => _$WarehouseProfileEntityToJson(this);
}

@JsonSerializable()
class ProfileDataEntity {
  final String rank;
  final String email;
  @JsonKey(name: 'phone_number')
  final int phoneNumber;
    @JsonKey(name: 'manager_address')
  final String address;
  @JsonKey(name: 'date_of_birth')
  final String birthDate;


  ProfileDataEntity({
    required this.rank,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.birthDate,

  });

  factory ProfileDataEntity.fromJson(Map<String, dynamic> json) => _$ProfileDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDataEntityToJson(this);
}
