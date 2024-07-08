// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_truck_information_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTruckInformationSharedEntity _$GetTruckInformationSharedEntityFromJson(
        Map<String, dynamic> json) =>
    GetTruckInformationSharedEntity(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: TruckData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetTruckInformationSharedEntityToJson(
        GetTruckInformationSharedEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

TruckData _$TruckDataFromJson(Map<String, dynamic> json) => TruckData(
      id: (json['id'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      line: json['line'] as String,
      createdBy: json['created_by'] as String,
      addingData: json['adding_data'] as String,
      editingBy: json['editing_by'] as String?,
      editingDate: json['editing_date'] as String?,
      notes: json['notes'] as String?,
      branchId: (json['branch_id'] as num).toInt(),
      trips: (json['trips'] as List<dynamic>)
          .map((e) => Trip.fromJson(e as Map<String, dynamic>))
          .toList(),
      drivers: (json['drivers'] as List<dynamic>)
          .map((e) => Driver.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TruckDataToJson(TruckData instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'line': instance.line,
      'created_by': instance.createdBy,
      'adding_data': instance.addingData,
      'editing_by': instance.editingBy,
      'editing_date': instance.editingDate,
      'notes': instance.notes,
      'branch_id': instance.branchId,
      'trips': instance.trips,
      'drivers': instance.drivers,
    };

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      number: json['number'] as String,
      date: json['date'] as String,
      driverId: (json['driver_id'] as num).toInt(),
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'number': instance.number,
      'date': instance.date,
      'driver_id': instance.driverId,
    };

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
