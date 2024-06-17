class CancelTripParams {
  final int tripId;

  CancelTripParams({
    required this.tripId,
  });

  Map<String, dynamic> toJson() => {
        'trip_id': tripId,
      };
}
