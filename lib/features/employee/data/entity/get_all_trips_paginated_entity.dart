import 'package:json_annotation/json_annotation.dart';

part 'get_all_trips_paginated_entity.g.dart';

@JsonSerializable()
class GetAllTripsPaginatedEntity {
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
  final String arrivalDate;

  @JsonKey(name: 'created_by')
  final String createdBy;

  @JsonKey(name: 'edited_by')
  final String editedBy;

  @JsonKey(name: 'archived')
  final int archived;

  @JsonKey(name: 'destination_id')
  final int destinationId;

  GetAllTripsPaginatedEntity({
    required this.id,
    required this.truckId,
    required this.driverId,
    required this.branchId,
    required this.manifestId,
    required this.number,
    required this.date,
    required this.status,
    required this.arrivalDate,
    required this.createdBy,
    required this.editedBy,
    required this.archived,
    required this.destinationId,
  });

  factory GetAllTripsPaginatedEntity.fromJson(Map<String, dynamic> json) =>
      _$GetAllTripsPaginatedEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllTripsPaginatedEntityToJson(this);
}
