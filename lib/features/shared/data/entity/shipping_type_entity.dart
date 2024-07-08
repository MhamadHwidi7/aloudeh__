
import 'package:json_annotation/json_annotation.dart';
part 'shipping_type_entity.g.dart';

@JsonSerializable()
class TypePaginatedSharedEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'cost')
  final int cost;

  @JsonKey(name: 'type')
  final String type;


  factory TypePaginatedSharedEntity.fromJson(Map<String, dynamic> json) =>
      _$TypePaginatedSharedEntityFromJson(json);

  TypePaginatedSharedEntity({required this.id, required this.cost, required this.type});

  Map<String, dynamic> toJson() => _$TypePaginatedSharedEntityToJson(this);
}
