import 'package:json_annotation/json_annotation.dart';

part 'get_customer_filter_entity.g.dart';

@JsonSerializable()
class GetCustomersFilterEntity {
  final bool success;
  final String message;
  final List<CustomerData> data;

  GetCustomersFilterEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetCustomersFilterEntity.fromJson(Map<String, dynamic> json) =>
      _$GetCustomersFilterEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetCustomersFilterEntityToJson(this);
}

@JsonSerializable()
class CustomerData {
  final int id;
  @JsonKey(name: 'national_id')
  final String nationalId;
  final String name;
  @JsonKey(name: 'phone_number')
  final int phoneNumber;
  final String gender;
  final int mobile;
  final String address;
  @JsonKey(name: 'address_detail')
  final String addressDetail;


  CustomerData({
    required this.id,
    required this.nationalId,
    required this.name,
    required this.phoneNumber,
    required this.gender,
    required this.mobile,
    required this.address,
    required this.addressDetail,

  });

  factory CustomerData.fromJson(Map<String, dynamic> json) =>
      _$CustomerDataFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDataToJson(this);
}
