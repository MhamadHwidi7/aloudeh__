// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeProfile _$EmployeeProfileFromJson(Map<String, dynamic> json) =>
    EmployeeProfile(
      success: json['success'] as bool,
      profileData:
          ProfileDataEntity.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$EmployeeProfileToJson(EmployeeProfile instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.profileData,
      'message': instance.message,
    };

ProfileDataEntity _$ProfileDataEntityFromJson(Map<String, dynamic> json) =>
    ProfileDataEntity(
      rank: json['rank'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      address: json['address'] as String,
      birthDate: json['birth_date'] as String,
      rating: (json['rating'] as num).toInt(),
      vacations: (json['vacations'] as List<dynamic>)
          .map((e) => VacationEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileDataEntityToJson(ProfileDataEntity instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'birth_date': instance.birthDate,
      'rating': instance.rating,
      'vacations': instance.vacations,
    };

VacationEntity _$VacationEntityFromJson(Map<String, dynamic> json) =>
    VacationEntity(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      userType: json['user_type'] as String,
      start: json['start'] as String,
      end: json['end'] as String,
      reason: json['reason'] as String,
      createdBy: json['created_by'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$VacationEntityToJson(VacationEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user_type': instance.userType,
      'start': instance.start,
      'end': instance.end,
      'reason': instance.reason,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
