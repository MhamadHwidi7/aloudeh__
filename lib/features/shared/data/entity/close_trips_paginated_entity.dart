import 'package:json_annotation/json_annotation.dart';

part 'close_trips_paginated_entity.g.dart';

@JsonSerializable()
class ClosedTripsPaginatedSharedEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'truck_id')
  final int truckId;

  @JsonKey(name: 'driver_id')
  final int driverId;

  @JsonKey(name: 'branch_id')
  final int branchId;

  @JsonKey(name: 'manifest_id')
  final int manifestId;

  @JsonKey(name: 'number')
  final String number;

  @JsonKey(name: 'date')
  final String date;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'arrival_date')
  final String? arrivalDate;

  @JsonKey(name: 'created_by')
  final String createdBy;

  @JsonKey(name: 'edited_by')
  final String? editedBy;

  @JsonKey(name: 'archived')
  final int archived;

  @JsonKey(name: 'destination_id')
  final int destinationId;

  @JsonKey(name: 'destination_name')
  final String destinationName;

  @JsonKey(name: 'driver')
  final Driver driver;

  @JsonKey(name: 'branch')
  final Branch branch;

  @JsonKey(name: 'truck')
  final Truck truck;

  ClosedTripsPaginatedSharedEntity({
    required this.id,
    required this.truckId,
    required this.driverId,
    required this.branchId,
    required this.manifestId,
    required this.number,
    required this.date,
    required this.status,
    required this.destinationName,
    this.arrivalDate,
    required this.createdBy,
    this.editedBy,
    required this.archived,
    required this.destinationId,
    required this.driver,
    required this.branch,
    required this.truck,
  });

  factory ClosedTripsPaginatedSharedEntity.fromJson(Map<String, dynamic> json) =>
      _$ClosedTripsPaginatedSharedEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ClosedTripsPaginatedSharedEntityToJson(this);
}

@JsonSerializable()
class Driver {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  Driver({
    required this.id,
    required this.name,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);
}

@JsonSerializable()
class Branch {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'desk')
  final String desk;

  Branch({
    required this.id,
    required this.address,
    required this.desk,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);
}

@JsonSerializable()
class Truck {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'number')
  final int number;
  Truck({
    required this.id,
    required this.number,
  });

  factory Truck.fromJson(Map<String, dynamic> json) => _$TruckFromJson(json);

  Map<String, dynamic> toJson() => _$TruckToJson(this);
}
