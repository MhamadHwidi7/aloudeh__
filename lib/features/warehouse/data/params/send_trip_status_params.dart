class SendTripStatusParams {
  final String tripNumber;
  final String status;

  SendTripStatusParams({required this.tripNumber,required this.status});

  Map<String, dynamic> toJson() => {"trip_number": tripNumber,"status":status};
}
