import 'package:json_annotation/json_annotation.dart';

part 'get_all_branches_paginated_entity.g.dart';

@JsonSerializable()
class GetAllBranchesPaginatedEntity{
  @JsonKey(name: "id")
  final int branchId;
    @JsonKey(name: "address")

  final String branchAddress;
    @JsonKey(name: "desk")

  final String branchDesk;



  factory GetAllBranchesPaginatedEntity.fromJson(Map<String, dynamic> json) =>
      _$GetAllBranchesPaginatedEntityFromJson(json);

  GetAllBranchesPaginatedEntity({required this.branchId, required this.branchAddress, required this.branchDesk});

  Map<String, dynamic> toJson() => _$GetAllBranchesPaginatedEntityToJson(this);
}