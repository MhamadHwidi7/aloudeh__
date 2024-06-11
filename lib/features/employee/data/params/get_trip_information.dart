class GetTripInformationParams {
  final String tripNumber;

  GetTripInformationParams({
    required this.tripNumber,
  });

  Map<String, dynamic> toJson() => {
        'trip_number': tripNumber,
      };
}
