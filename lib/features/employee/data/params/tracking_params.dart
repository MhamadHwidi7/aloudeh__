class TrackingParams {
  final String tripNumber;

  TrackingParams({required this.tripNumber});

  Map<String, dynamic> toJson() => {
        "trip_number": tripNumber,
      };
}
