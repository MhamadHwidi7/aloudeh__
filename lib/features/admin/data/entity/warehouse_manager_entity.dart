import 'package:json_annotation/json_annotation.dart';

part 'warehouse_manager_entity.g.dart';


@JsonSerializable()
class BaseWarehouseManagerAdminEntity {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'data')
  final WarehouseManagerEntity data;

  BaseWarehouseManagerAdminEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  factory BaseWarehouseManagerAdminEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseWarehouseManagerAdminEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BaseWarehouseManagerAdminEntityToJson(this);
}



@JsonSerializable()
class WarehouseManagerEntity {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'national_id')
  final String nationalId;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'phone_number')
  final int phoneNumber;
  @JsonKey(name: 'gender')
  final String gender;
  @JsonKey(name: 'warehouse_id')
  final int warehouseId;
  @JsonKey(name: 'mother_name')
  final String motherName;
  @JsonKey(name: 'date_of_birth')
  final String dateOfBirth;

  @JsonKey(name: 'manager_address')
  final String managerAddress;

  @JsonKey(name: 'salary')
  final int salary;

  @JsonKey(name: 'rank')
  final String rank;

  @JsonKey(name: 'employment_date')
  final String employmentDate;


  WarehouseManagerEntity({
    required this.id,
    required this.nationalId,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.gender,
    required this.warehouseId,
    required this.motherName,
    required this.dateOfBirth,
    required this.managerAddress,
    required this.salary,
    required this.rank,
    required this.employmentDate,
  });

  factory WarehouseManagerEntity.fromJson(Map<String, dynamic> json) =>
      _$WarehouseManagerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseManagerEntityToJson(this);
}
