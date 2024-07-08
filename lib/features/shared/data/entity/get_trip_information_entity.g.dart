// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trip_information_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTripInformationSharedEntity _$GetTripInformationSharedEntityFromJson(
        Map<String, dynamic> json) =>
    GetTripInformationSharedEntity(
      message: json['message'] as String,
      data: TripData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetTripInformationSharedEntityToJson(
        GetTripInformationSharedEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

TripData _$TripDataFromJson(Map<String, dynamic> json) => TripData(
      id: (json['id'] as num).toInt(),
      truckId: (json['truck_id'] as num).toInt(),
      truckName: json['truck_name'] as String,
      driverId: (json['driver_id'] as num).toInt(),
      driverName: json['driver_name'] as String,
      branchId: (json['branch_id'] as num).toInt(),
      branchName: json['branch_name'] as String,
      manifestId: (json['manifest_id'] as num).toInt(),
      number: json['number'] as String,
      date: json['date'] as String,
      status: json['status'] as String,
      arrivalDate: json['arrival_date'] as String?,
      createdBy: json['created_by'] as String,
      editedBy: json['edited_by'] as String?,
      archived: (json['archived'] as num).toInt(),
      destinationId: (json['destination_id'] as num).toInt(),
      destinationName: json['destination_name'] as String,
      manifestData: json['manifest'] == null
          ? null
          : ManifestData.fromJson(json['manifest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TripDataToJson(TripData instance) => <String, dynamic>{
      'id': instance.id,
      'truck_id': instance.truckId,
      'truck_name': instance.truckName,
      'driver_id': instance.driverId,
      'driver_name': instance.driverName,
      'branch_id': instance.branchId,
      'branch_name': instance.branchName,
      'manifest_id': instance.manifestId,
      'number': instance.number,
      'date': instance.date,
      'status': instance.status,
      'arrival_date': instance.arrivalDate,
      'created_by': instance.createdBy,
      'edited_by': instance.editedBy,
      'archived': instance.archived,
      'destination_id': instance.destinationId,
      'destination_name': instance.destinationName,
      'manifest': instance.manifestData,
    };

ManifestData _$ManifestDataFromJson(Map<String, dynamic> json) => ManifestData(
      id: (json['id'] as num).toInt(),
      number: json['number'] as String,
      status: json['status'] as String,
      generalTotal: json['general_total'] as String?,
      discount: json['discount'] as String?,
      netTotal: json['net_total'] as String?,
      miscPaid: json['misc_paid'] as String?,
      againstShipping: json['against_shipping'] as String?,
      adapter: json['adapter'] as String?,
      advance: json['advance'] as String?,
      collection: json['collection'] as String?,
      tripId: (json['trip_id'] as num).toInt(),
    );

Map<String, dynamic> _$ManifestDataToJson(ManifestData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'status': instance.status,
      'general_total': instance.generalTotal,
      'discount': instance.discount,
      'net_total': instance.netTotal,
      'misc_paid': instance.miscPaid,
      'against_shipping': instance.againstShipping,
      'adapter': instance.adapter,
      'advance': instance.advance,
      'collection': instance.collection,
      'trip_id': instance.tripId,
    };
