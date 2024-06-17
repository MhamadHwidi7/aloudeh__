import 'package:json_annotation/json_annotation.dart';

part 'tracking_entity.g.dart';

@JsonSerializable()
class BaseTrackingEntity {
  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'data')
  final DriverTrackingEntity data;

  BaseTrackingEntity({
    required this.message,
    required this.data,
  });

  factory BaseTrackingEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseTrackingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BaseTrackingEntityToJson(this);
}

@JsonSerializable()
class DriverTrackingEntity {
  @JsonKey(name: 'current_lat')
  final double driverCurrentLat;

  @JsonKey(name: 'current_lng')
  final double driverCurrentLng;


  factory DriverTrackingEntity.fromJson(Map<String, dynamic> json) =>
      _$DriverTrackingEntityFromJson(json);

  DriverTrackingEntity({required this.driverCurrentLat, required this.driverCurrentLng});


  Map<String, dynamic> toJson() => _$DriverTrackingEntityToJson(this);
}
