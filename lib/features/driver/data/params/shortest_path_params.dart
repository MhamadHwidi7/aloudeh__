import 'package:aloudeh_company/core/api/end_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'get_shortest_path_parameters.g.dart';

// @JsonSerializable(converters: [LatLngConverter()])

class ShortestPathParams {
  final LatLng origin;
  final LatLng destination;
  ShortestPathParams({
    required this.origin,
    required this.destination,
  });

  Map<String, dynamic> toJson() => {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
      'key':EndPoints.googleMapsApiKey
      };
}


class LatLngConverter implements JsonConverter<LatLng, Map<String, dynamic>> {
  const LatLngConverter();

  @override
  LatLng fromJson(Map<String, dynamic> json) {
    return LatLng(json['latitude'] as double, json['longitude'] as double);
  }

  @override
  Map<String, dynamic> toJson(LatLng object) {
    return {'latitude': object.latitude, 'longitude': object.longitude};
  }
}