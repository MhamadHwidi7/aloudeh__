import 'package:json_annotation/json_annotation.dart';

part 'my_trips_paginated_entity.g.dart';

@JsonSerializable()
class MyTripsPaginatedEntity {
  @JsonKey(name: 'date')
  final String date;

  @JsonKey(name: 'number')
  final String number;
  MyTripsPaginatedEntity({
    required this.date,
    required this.number,
  });

  factory MyTripsPaginatedEntity.fromJson(Map<String, dynamic> json) => _$MyTripsPaginatedEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MyTripsPaginatedEntityToJson(this);
}
