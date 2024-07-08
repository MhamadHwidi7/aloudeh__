
import 'package:json_annotation/json_annotation.dart';
part 'get_all_customers_paginated_entity.g.dart';

@JsonSerializable()
class GetAllCustomersPaginatedSharedEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'national_id')
  final String nationalId;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'phone_number')
  final int phoneNumber;

  @JsonKey(name: 'gender')
  final String gender;

  @JsonKey(name: 'mobile')
  final int mobile;

  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'address_detail')
  final String addressDetail;

  @JsonKey(name: 'notes')
  final String? notes;

  @JsonKey(name: 'added_by')
  final String addedBy;

  @JsonKey(name: 'device_token')
  final String? deviceToken;

  GetAllCustomersPaginatedSharedEntity({
    required this.id,
    required this.nationalId,
    required this.name,
    required this.phoneNumber,
    required this.gender,
    required this.mobile,
    required this.address,
    required this.addressDetail,
    required this.notes,
    required this.addedBy,
    this.deviceToken,
  });

  factory GetAllCustomersPaginatedSharedEntity.fromJson(Map<String, dynamic> json) =>
      _$GetAllCustomersPaginatedSharedEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCustomersPaginatedSharedEntityToJson(this);
}
