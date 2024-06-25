import 'package:json_annotation/json_annotation.dart';

part 'get_branch_location_entity.g.dart';

@JsonSerializable()
class GetBranchLocationEntity {
  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'data')
  final BranchLocationEntity data;

  GetBranchLocationEntity({
    required this.message,
    required this.data,
  });

  factory GetBranchLocationEntity.fromJson(Map<String, dynamic> json) =>
      _$GetBranchLocationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetBranchLocationEntityToJson(this);
}

@JsonSerializable()
class BranchLocationEntity {
  @JsonKey(name: 'branch_lat')
  final String branchLat;

  @JsonKey(name: 'branch_lng')
  final String branchLng;


  factory BranchLocationEntity.fromJson(Map<String, dynamic> json) =>
      _$BranchLocationEntityFromJson(json);

  BranchLocationEntity({required this.branchLat, required this.branchLng});

  Map<String, dynamic> toJson() => _$BranchLocationEntityToJson(this);
}
