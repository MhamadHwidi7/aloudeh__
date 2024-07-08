// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_branches_paginated_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBranchesPaginatedSharedEntity
    _$GetAllBranchesPaginatedSharedEntityFromJson(Map<String, dynamic> json) =>
        GetAllBranchesPaginatedSharedEntity(
          branchId: (json['id'] as num).toInt(),
          branchAddress: json['address'] as String,
          branchDesk: json['desk'] as String,
        );

Map<String, dynamic> _$GetAllBranchesPaginatedSharedEntityToJson(
        GetAllBranchesPaginatedSharedEntity instance) =>
    <String, dynamic>{
      'id': instance.branchId,
      'address': instance.branchAddress,
      'desk': instance.branchDesk,
    };
