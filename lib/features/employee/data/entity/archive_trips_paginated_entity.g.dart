// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_trips_paginated_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArchiveTripsPaginatedEntity _$ArchiveTripsPaginatedEntityFromJson(
        Map<String, dynamic> json) =>
    ArchiveTripsPaginatedEntity(
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
      destinationId: json['destination_id'] as int,
      driver: Driver.fromJson(json['driver'] as Map<String, dynamic>),
      branch: Branch.fromJson(json['branch'] as Map<String, dynamic>),
      truck: Truck.fromJson(json['truck'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArchiveTripsPaginatedEntityToJson(
        ArchiveTripsPaginatedEntity instance) =>
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
      'destination_id': instance.destinationId,
      'driver': instance.driver,
      'branch': instance.branch,
      'truck': instance.truck,
    };

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
      id: json['id'] as int,
      address: json['address'] as String,
    );

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
    };

Truck _$TruckFromJson(Map<String, dynamic> json) => Truck(
      id: json['id'] as int,
      number: json['number'] as int,
    );

Map<String, dynamic> _$TruckToJson(Truck instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
    };
