// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_trips_admin_paginated_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllTripsAdminPaginatedEntity _$GetAllTripsAdminPaginatedEntityFromJson(
        Map<String, dynamic> json) =>
    GetAllTripsAdminPaginatedEntity(
      id: (json['id'] as num).toInt(),
      truckId: (json['truck_id'] as num).toInt(),
      driverId: (json['driver_id'] as num).toInt(),
      branchId: (json['branch_id'] as num).toInt(),
      manifestId: (json['manifest_id'] as num).toInt(),
      number: json['number'] as String,
      date: json['date'] as String,
      status: json['status'] as String,
      arrivalDate: json['arrival_date'] as String,
      createdBy: json['created_by'] as String,
      editedBy: json['edited_by'] as String,
      archived: (json['archived'] as num).toInt(),
      destinationId: (json['destination_id'] as num).toInt(),
    );

Map<String, dynamic> _$GetAllTripsAdminPaginatedEntityToJson(
        GetAllTripsAdminPaginatedEntity instance) =>
    <String, dynamic>{
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
