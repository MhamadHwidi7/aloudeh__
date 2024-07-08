// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_trips_paginated_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveTripsPaginatedSharedEntity _$ActiveTripsPaginatedSharedEntityFromJson(
        Map<String, dynamic> json) =>
    ActiveTripsPaginatedSharedEntity(
      id: (json['id'] as num).toInt(),
      truckId: (json['truck_id'] as num).toInt(),
      driverId: (json['driver_id'] as num).toInt(),
      branchId: (json['branch_id'] as num).toInt(),
      manifestId: (json['manifest_id'] as num).toInt(),
      number: json['number'] as String,
      date: json['date'] as String,
      status: json['status'] as String,
      destinationName: json['destination_name'] as String,
      arrivalDate: json['arrival_date'] as String?,
      createdBy: json['created_by'] as String,
      editedBy: json['edited_by'] as String?,
      archived: (json['archived'] as num).toInt(),
      destinationId: (json['destination_id'] as num).toInt(),
      driver: Driver.fromJson(json['driver'] as Map<String, dynamic>),
      branch: Branch.fromJson(json['branch'] as Map<String, dynamic>),
      truck: Truck.fromJson(json['truck'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActiveTripsPaginatedSharedEntityToJson(
        ActiveTripsPaginatedSharedEntity instance) =>
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
      'destination_name': instance.destinationName,
      'driver': instance.driver,
      'branch': instance.branch,
      'truck': instance.truck,
    };

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
      id: (json['id'] as num).toInt(),
      address: json['address'] as String,
      desk: json['desk'] as String,
    );

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'desk': instance.desk,
    };

Truck _$TruckFromJson(Map<String, dynamic> json) => Truck(
      id: (json['id'] as num).toInt(),
      number: (json['number'] as num).toInt(),
    );

Map<String, dynamic> _$TruckToJson(Truck instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
    };
