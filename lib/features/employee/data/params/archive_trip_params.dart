class ArchiveTripParams {
  final int tripId;

  ArchiveTripParams({
    required this.tripId,
  });

  Map<String, dynamic> toJson() => {
        'trip_id': tripId,
      };
}
