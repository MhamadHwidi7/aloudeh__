class TripArchiveParams {
  final String tripId;

  TripArchiveParams({
    required this.tripId,
  });

  Map<String, dynamic> toJson() => {
        'trip_id': tripId,
      };
}
