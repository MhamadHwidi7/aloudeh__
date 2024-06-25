// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_branch_location_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBranchLocationEntity _$GetBranchLocationEntityFromJson(
        Map<String, dynamic> json) =>
    GetBranchLocationEntity(
      message: json['message'] as String,
      data: BranchLocationEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetBranchLocationEntityToJson(
        GetBranchLocationEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

BranchLocationEntity _$BranchLocationEntityFromJson(
        Map<String, dynamic> json) =>
    BranchLocationEntity(
      branchLat: json['branch_lat'] as String,
      branchLng: json['branch_lng'] as String,
    );

Map<String, dynamic> _$BranchLocationEntityToJson(
        BranchLocationEntity instance) =>
    <String, dynamic>{
      'branch_lat': instance.branchLat,
      'branch_lng': instance.branchLng,
    };
