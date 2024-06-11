
import 'package:json_annotation/json_annotation.dart';

part 'vacation_entity.g.dart';

@JsonSerializable()
class BaseAdminVacationEntity {
  @JsonKey(name: "data")
  final List<VacationEntity> data;

  BaseAdminVacationEntity({
    required this.data,

  });

  factory BaseAdminVacationEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseAdminVacationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BaseAdminVacationEntityToJson(this);
}

@JsonSerializable()
class VacationEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'user_type')
  final String userType;

  @JsonKey(name: 'created_by')
  final String createdBy;

  @JsonKey(name: 'end')
  final String end;

  @JsonKey(name: 'start')
  final String start;

  @JsonKey(name: 'reason')
  final String reason;


  
  factory VacationEntity.fromJson(Map<String, dynamic> json) =>
      _$VacationEntityFromJson(json);

  VacationEntity({required this.id, required this.userId, required this.userType, required this.createdBy, required this.end, required this.start, required this.reason});

  Map<String, dynamic> toJson() => _$VacationEntityToJson(this);
}
