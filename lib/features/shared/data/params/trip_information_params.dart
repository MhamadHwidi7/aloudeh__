class TripInformationSharedParams {
  final String tripNumber;

  TripInformationSharedParams({
    required this.tripNumber,
  });

  Map<String, dynamic> toJson() => {
        'trip_number': tripNumber,
      };
}
