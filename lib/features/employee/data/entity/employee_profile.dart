import 'package:json_annotation/json_annotation.dart';

part 'employee_profile.g.dart';

@JsonSerializable()
class EmployeeProfile {
  final bool success;
  @JsonKey(name: 'data')
  final ProfileDataEntity profileData;
  final String message;

  EmployeeProfile({required this.success, required this.profileData, required this.message});

  factory EmployeeProfile.fromJson(Map<String, dynamic> json) => _$EmployeeProfileFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeProfileToJson(this);
}

@JsonSerializable()
class ProfileDataEntity {
  final String rank;
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String address;
  @JsonKey(name: 'birth_date')
  final String birthDate;
  final int rating;
  final List<VacationEntity> vacations;

  ProfileDataEntity({
    required this.rank,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.birthDate,
    required this.rating,
    required this.vacations,
  });

  factory ProfileDataEntity.fromJson(Map<String, dynamic> json) => _$ProfileDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDataEntityToJson(this);
}

@JsonSerializable()
class VacationEntity {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'user_type')
  final String userType;
  final String start;
  final String end;
  final String reason;
  @JsonKey(name: 'created_by')
  final String createdBy;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  VacationEntity({
    required this.id,
    required this.userId,
    required this.userType,
    required this.start,
    required this.end,
    required this.reason,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VacationEntity.fromJson(Map<String, dynamic> json) => _$VacationEntityFromJson(json);
  Map<String, dynamic> toJson() => _$VacationEntityToJson(this);
}
