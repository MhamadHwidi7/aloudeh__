import 'package:json_annotation/json_annotation.dart';

part 'get_all_branches_paginated_entity.g.dart';

@JsonSerializable()
class GetAllBranchesPaginatedSharedEntity{
  @JsonKey(name: "id")
  final int branchId;
    @JsonKey(name: "address")
  final String branchAddress;
    @JsonKey(name: "desk")

  final String branchDesk;



  factory GetAllBranchesPaginatedSharedEntity.fromJson(Map<String, dynamic> json) =>
      _$GetAllBranchesPaginatedSharedEntityFromJson(json);

  GetAllBranchesPaginatedSharedEntity({required this.branchId, required this.branchAddress, required this.branchDesk});

  Map<String, dynamic> toJson() => _$GetAllBranchesPaginatedSharedEntityToJson(this);
}