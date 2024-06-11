import 'package:json_annotation/json_annotation.dart';

part 'get_trip_information_entity.g.dart';

@JsonSerializable()
class GetTripInformationAdminEntity {
  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'data')
  final TripData data;

  GetTripInformationAdminEntity({
    required this.message,
    required this.data,
  });

  factory GetTripInformationAdminEntity.fromJson(Map<String, dynamic> json) =>
      _$GetTripInformationAdminEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetTripInformationAdminEntityToJson(this);
}

@JsonSerializable()
class TripData {
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

  TripData({
    required this.id,
    required this.truckId,
    required this.driverId,
    required this.branchId,
    required this.manifestId,
    required this.number,
    required this.date,
    required this.status,
    this.arrivalDate,
    required this.createdBy,
    this.editedBy,
    required this.archived,
    required this.destinationId,
  });

  factory TripData.fromJson(Map<String, dynamic> json) =>
      _$TripDataFromJson(json);

  Map<String, dynamic> toJson() => _$TripDataToJson(this);
}
