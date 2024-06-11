import 'package:json_annotation/json_annotation.dart';

part 'get_truck_information_entity.g.dart';

@JsonSerializable()
class GetTruckInformationEntity {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'data')
  final TruckData data;

  GetTruckInformationEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetTruckInformationEntity.fromJson(Map<String, dynamic> json) =>
      _$GetTruckInformationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetTruckInformationEntityToJson(this);
}

@JsonSerializable()
class TruckData {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'number')
  final int number;

  @JsonKey(name: 'line')
  final String line;

  @JsonKey(name: 'created_by')
  final String createdBy;

  @JsonKey(name: 'adding_data')
  final String addingData;

  @JsonKey(name: 'editing_by')
  final String? editingBy;

  @JsonKey(name: 'editing_date')
  final String? editingDate;

  @JsonKey(name: 'notes')
  final String? notes;

  @JsonKey(name: 'branch_id')
  final int branchId;

  @JsonKey(name: 'trips')
  final List<Trip> trips;

  @JsonKey(name: 'drivers')
  final List<Driver> drivers;

  TruckData({
    required this.id,
    required this.number,
    required this.line,
    required this.createdBy,
    required this.addingData,
    this.editingBy,
    this.editingDate,
    this.notes,
    required this.branchId,
    required this.trips,
    required this.drivers,
  });

  factory TruckData.fromJson(Map<String, dynamic> json) =>
      _$TruckDataFromJson(json);

  Map<String, dynamic> toJson() => _$TruckDataToJson(this);
}

@JsonSerializable()
class Trip {
  @JsonKey(name: 'number')
  final String number;

  @JsonKey(name: 'date')
  final String date;

  @JsonKey(name: 'driver_id')
  final int driverId;

  Trip({
    required this.number,
    required this.date,
    required this.driverId,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  Map<String, dynamic> toJson() => _$TripToJson(this);
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
