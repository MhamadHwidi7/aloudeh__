// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_branches_paginated_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBranchesPaginatedEntity _$GetAllBranchesPaginatedEntityFromJson(
        Map<String, dynamic> json) =>
    GetAllBranchesPaginatedEntity(
      branchId: (json['id'] as num).toInt(),
      branchAddress: json['address'] as String,
      branchDesk: json['desk'] as String,
    );

Map<String, dynamic> _$GetAllBranchesPaginatedEntityToJson(
        GetAllBranchesPaginatedEntity instance) =>
    <String, dynamic>{
      'id': instance.branchId,
      'address': instance.branchAddress,
      'desk': instance.branchDesk,
    };
