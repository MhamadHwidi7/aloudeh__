import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_place_directions_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class BasePlaceDirectionsEntity {
  @LatLngBoundsConverter()
  final LatLngBounds bounds;

  @JsonKey(name: 'polylinePoints')
  @PointLatLngConverter()
  final List<PointLatLng> polylinePoints;

  @JsonKey(name: 'totalDistance')
  final String totalDistance;

  @JsonKey(name: 'totalDuration')
  final String totalDuration;

  BasePlaceDirectionsEntity({
    required this.bounds,
    required this.polylinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  factory BasePlaceDirectionsEntity.fromJson(Map<String, dynamic> json) {
    final routes = json['routes'] as List<dynamic>? ?? [];
    if (routes.isEmpty) {
      throw Exception("No routes available");
    }
    
    final data = routes[0] as Map<String, dynamic>;
    final northeast = data['bounds']['northeast'];
    final southwest = data['bounds']['southwest'];
    final bounds = LatLngBounds(
      northeast: LatLng(northeast['lat'], northeast['lng']),
      southwest: LatLng(southwest['lat'], southwest['lng']),
    );

    late String distance;
    late String duration;

    if ((data['legs'] as List).isNotEmpty) {
      final leg = data['legs'][0];
      distance = leg['distance']['text'];
      duration = leg['duration']['text'];
    } else {
      throw Exception("No legs data available");
    }

    return BasePlaceDirectionsEntity(
      bounds: bounds,
      polylinePoints: PolylinePoints().decodePolyline(data['overview_polyline']['points']),
      totalDistance: distance,
      totalDuration: duration,
    );
  }

  Map<String, dynamic> toJson() => _$BasePlaceDirectionsEntityToJson(this);
}

class PointLatLngConverter implements JsonConverter<PointLatLng, Map<String, dynamic>> {
  const PointLatLngConverter();

  @override
  PointLatLng fromJson(Map<String, dynamic> json) {
    return PointLatLng(json['latitude'], json['longitude']);
  }

  @override
  Map<String, dynamic> toJson(PointLatLng point) {
    return {
      'latitude': point.latitude,
      'longitude': point.longitude,
    };
  }
}

class LatLngBoundsConverter implements JsonConverter<LatLngBounds, Map<String, dynamic>> {
  const LatLngBoundsConverter();

  @override
  LatLngBounds fromJson(Map<String, dynamic> json) {
    final northeast = json['northeast'];
    final southwest = json['southwest'];
    return LatLngBounds(
      northeast: LatLng(northeast['lat'], northeast['lng']),
      southwest: LatLng(southwest['lat'], southwest['lng']),
    );
  }

  @override
  Map<String, dynamic> toJson(LatLngBounds bounds) {
    return {
      'northeast': {
        'lat': bounds.northeast.latitude,
        'lng': bounds.northeast.longitude,
      },
      'southwest': {
        'lat': bounds.southwest.latitude,
        'lng': bounds.southwest.longitude,
      },
    };
  }
}
