// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_employee_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseEmployeeAdminEntity _$BaseEmployeeAdminEntityFromJson(
        Map<String, dynamic> json) =>
    BaseEmployeeAdminEntity(
      data: EmployeeEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseEmployeeAdminEntityToJson(
        BaseEmployeeAdminEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

EmployeeEntity _$EmployeeEntityFromJson(Map<String, dynamic> json) =>
    EmployeeEntity(
      id: (json['id'] as num).toInt(),
      nationalId: json['national_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      branchId: (json['branch_id'] as num).toInt(),
      motherName: json['mother_name'] as String,
      gender: json['gender'] as String,
      birthDate: json['birth_date'] as String,
      birthPlace: json['birth_place'] as String,
      mobile: json['mobile'] as String,
      address: json['address'] as String,
      salary: (json['salary'] as num).toInt(),
      rank: json['rank'] as String,
      employmentDate: json['employment_date'] as String,
      resignationDate: json['resignation_date'] as String?,
      managerName: json['manager_name'] as String,
    );

Map<String, dynamic> _$EmployeeEntityToJson(EmployeeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'national_id': instance.nationalId,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'branch_id': instance.branchId,
      'mother_name': instance.motherName,
      'gender': instance.gender,
      'birth_date': instance.birthDate,
      'birth_place': instance.birthPlace,
      'mobile': instance.mobile,
      'address': instance.address,
      'salary': instance.salary,
      'rank': instance.rank,
      'employment_date': instance.employmentDate,
      'resignation_date': instance.resignationDate,
      'manager_name': instance.managerName,
    };
