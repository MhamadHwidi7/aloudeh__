import 'package:json_annotation/json_annotation.dart';

part 'get_trip_information_entity.g.dart';

@JsonSerializable()
class GetTripInformationSharedEntity {
  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'data')
  final TripData data;

  GetTripInformationSharedEntity({
    required this.message,
    required this.data,
  });

  factory GetTripInformationSharedEntity.fromJson(Map<String, dynamic> json) =>
      _$GetTripInformationSharedEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetTripInformationSharedEntityToJson(this);
}

@JsonSerializable()
class TripData {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'truck_id')
  final int truckId;
  @JsonKey(name: 'truck_name')
  final String truckName;

  @JsonKey(name: 'driver_id')
  final int driverId;
  @JsonKey(name: 'driver_name')
  final String driverName;
  @JsonKey(name: 'branch_id')
  final int branchId;
  @JsonKey(name: 'branch_name')
  final String branchName;
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

    @JsonKey(name: 'manifest')
  final ManifestData? manifestData;
  factory TripData.fromJson(Map<String, dynamic> json) =>
      _$TripDataFromJson(json);

  TripData({required this.id, required this.truckId, required this.truckName, required this.driverId, required this.driverName, required this.branchId, required this.branchName, required this.manifestId, required this.number, required this.date, required this.status, required this.arrivalDate, required this.createdBy, required this.editedBy, required this.archived, required this.destinationId, required this.destinationName, required this.manifestData});



  Map<String, dynamic> toJson() => _$TripDataToJson(this);
}



@JsonSerializable()
class ManifestData {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'number')
  final String number;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'general_total')
  final String? generalTotal;

  @JsonKey(name: 'discount')
  final String? discount;

  @JsonKey(name: 'net_total')
  final String? netTotal;

  @JsonKey(name: 'misc_paid')
  final String? miscPaid;

  @JsonKey(name: 'against_shipping')
  final String? againstShipping;

  @JsonKey(name: 'adapter')
  final String? adapter;

  @JsonKey(name: 'advance')
  final String? advance;

  @JsonKey(name: 'collection')
  final String? collection;

  @JsonKey(name: 'trip_id')
  final int tripId;

  factory ManifestData.fromJson(Map<String, dynamic> json) =>
      _$ManifestDataFromJson(json);

  ManifestData({required this.id, required this.number, required this.status, required this.generalTotal, required this.discount, required this.netTotal, required this.miscPaid, required this.againstShipping, required this.adapter, required this.advance, required this.collection, required this.tripId});



  Map<String, dynamic> toJson() => _$ManifestDataToJson(this);
}
