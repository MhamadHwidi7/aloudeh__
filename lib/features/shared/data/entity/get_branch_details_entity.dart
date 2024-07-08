import 'package:json_annotation/json_annotation.dart';

part 'get_branch_details_entity.g.dart';

@JsonSerializable()
class GetBranchDetailSharedEntity {
  final bool success;
  final BranchData data;
  final String message;

  GetBranchDetailSharedEntity({
    required this.success,
    required this.data,
    required this.message,
  });

  factory GetBranchDetailSharedEntity.fromJson(Map<String, dynamic> json) =>
      _$GetBranchDetailSharedEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetBranchDetailSharedEntityToJson(this);
}

@JsonSerializable()
class BranchData {
  @JsonKey(name: 'opening_date')
  final String openingDate;
  final String desk;
  final String address;
  final int phone;
  final List<Trip> trips;

  BranchData({
    required this.openingDate,
    required this.desk,
    required this.address,
    required this.phone,
    required this.trips,
  });

  factory BranchData.fromJson(Map<String, dynamic> json) =>
      _$BranchDataFromJson(json);

  Map<String, dynamic> toJson() => _$BranchDataToJson(this);
}

@JsonSerializable()
class Trip {
  final String date;
  final String number;
  @JsonKey(name: 'driver_name')
  final String driverName;

  Trip({
    required this.date,
    required this.number,
    required this.driverName,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  Map<String, dynamic> toJson() => _$TripToJson(this);
}
