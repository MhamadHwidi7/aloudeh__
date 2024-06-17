import 'package:json_annotation/json_annotation.dart';

part 'destination_entity.g.dart';
@JsonSerializable()
class BaseDestinationEntity {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'data')
  final List<Destination> data;

  @JsonKey(name: 'message')
  final String message;

  BaseDestinationEntity({
    required this.success,
    required this.data,
    required this.message,
  });

  factory BaseDestinationEntity.fromJson(Map<String, dynamic> json) => _$BaseDestinationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BaseDestinationEntityToJson(this);
}

@JsonSerializable()
class Destination {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  Destination({
    required this.id,
    required this.name,
  });

  factory Destination.fromJson(Map<String, dynamic> json) => _$DestinationFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}

