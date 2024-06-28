
import 'package:json_annotation/json_annotation.dart';
part 'type_paginated_entity.g.dart';

@JsonSerializable()
class TypePaginatedEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'cost')
  final int cost;

  @JsonKey(name: 'type')
  final String type;


  factory TypePaginatedEntity.fromJson(Map<String, dynamic> json) =>
      _$TypePaginatedEntityFromJson(json);

  TypePaginatedEntity({required this.id, required this.cost, required this.type});

  Map<String, dynamic> toJson() => _$TypePaginatedEntityToJson(this);
}
