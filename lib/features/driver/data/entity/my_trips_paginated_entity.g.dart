// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_trips_paginated_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyTripsPaginatedEntity _$MyTripsPaginatedEntityFromJson(
        Map<String, dynamic> json) =>
    MyTripsPaginatedEntity(
      date: json['date'] as String,
      number: json['number'] as String,
      branchId: json['branch_id'] as int,
    );

Map<String, dynamic> _$MyTripsPaginatedEntityToJson(
        MyTripsPaginatedEntity instance) =>
    <String, dynamic>{
      'date': instance.date,
      'number': instance.number,
      'branch_id': instance.branchId,
    };
