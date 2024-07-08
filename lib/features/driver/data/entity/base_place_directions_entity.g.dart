// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_place_directions_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePlaceDirectionsEntity _$BasePlaceDirectionsEntityFromJson(
        Map<String, dynamic> json) =>
    BasePlaceDirectionsEntity(
      bounds: const LatLngBoundsConverter()
          .fromJson(json['bounds'] as Map<String, dynamic>),
      routes: (json['routes'] as List<dynamic>)
          .map((e) => RouteInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BasePlaceDirectionsEntityToJson(
        BasePlaceDirectionsEntity instance) =>
    <String, dynamic>{
      'bounds': const LatLngBoundsConverter().toJson(instance.bounds),
      'routes': instance.routes.map((e) => e.toJson()).toList(),
    };

RouteInfo _$RouteInfoFromJson(Map<String, dynamic> json) => RouteInfo(
      polylinePoints: (json['polylinePoints'] as List<dynamic>)
          .map((e) =>
              const PointLatLngConverter().fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDistance: json['totalDistance'] as String,
      totalDuration: json['totalDuration'] as String,
    );

Map<String, dynamic> _$RouteInfoToJson(RouteInfo instance) => <String, dynamic>{
      'polylinePoints': instance.polylinePoints
          .map(const PointLatLngConverter().toJson)
          .toList(),
      'totalDistance': instance.totalDistance,
      'totalDuration': instance.totalDuration,
    };
