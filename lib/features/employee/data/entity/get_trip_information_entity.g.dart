// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trip_information_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTripInformationEntity _$GetTripInformationEntityFromJson(
        Map<String, dynamic> json) =>
    GetTripInformationEntity(
      message: json['message'] as String,
      data: TripData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetTripInformationEntityToJson(
        GetTripInformationEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

TripData _$TripDataFromJson(Map<String, dynamic> json) => TripData(
      id: json['id'] as int,
      truckId: json['truck_id'] as int,
      driverId: json['driver_id'] as int,
      branchId: json['branch_id'] as int,
      manifestId: json['manifest_id'] as int,
      number: json['number'] as String,
      date: json['date'] as String,
      status: json['status'] as String,
      arrivalDate: json['arrival_date'] as String?,
      createdBy: json['created_by'] as String,
      editedBy: json['edited_by'] as String?,
      archived: json['archived'] as int,
      destinationId: json['destination_id'] as int,
    );

Map<String, dynamic> _$TripDataToJson(TripData instance) => <String, dynamic>{
      'id': instance.id,
      'truck_id': instance.truckId,
      'driver_id': instance.driverId,
      'branch_id': instance.branchId,
      'manifest_id': instance.manifestId,
      'number': instance.number,
      'date': instance.date,
      'status': instance.status,
      'arrival_date': instance.arrivalDate,
      'created_by': instance.createdBy,
      'edited_by': instance.editedBy,
      'archived': instance.archived,
      'destination_id': instance.destinationId,
    };