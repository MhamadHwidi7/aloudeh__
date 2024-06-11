import 'package:json_annotation/json_annotation.dart';

part 'get_employee_entity.g.dart';

///!Mark:this entity  class for get employee by id 
@JsonSerializable()
class BaseEmployeeAdminEntity {
  @JsonKey(name: "data")
  final EmployeeEntity data;

  BaseEmployeeAdminEntity({
    required this.data,

  });

  factory BaseEmployeeAdminEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseEmployeeAdminEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BaseEmployeeAdminEntityToJson(this);
}

@JsonSerializable()
class EmployeeEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'national_id')
  final String nationalId;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'branch_id')
  final int branchId;

  @JsonKey(name: 'mother_name')
  final String motherName;

  @JsonKey(name: 'gender')
  final String gender;

  @JsonKey(name: 'birth_date')
  final String birthDate;

  @JsonKey(name: 'birth_place')
  final String birthPlace;

  @JsonKey(name: 'mobile')
  final String mobile;

  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'salary')
  final int salary;

  @JsonKey(name: 'rank')
  final String rank;

  @JsonKey(name: 'employment_date')
  final String employmentDate;

  @JsonKey(name: 'resignation_date')
  final String? resignationDate;

  @JsonKey(name: 'manager_name')
  final String managerName;

  EmployeeEntity({
    required this.id,
    required this.nationalId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.branchId,
    required this.motherName,
    required this.gender,
    required this.birthDate,
    required this.birthPlace,
    required this.mobile,
    required this.address,
    required this.salary,
    required this.rank,
    required this.employmentDate,
    this.resignationDate,
    required this.managerName,
  });

  factory EmployeeEntity.fromJson(Map<String, dynamic> json) =>
      _$EmployeeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeEntityToJson(this);
}
