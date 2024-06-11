class GetTruckInformationParams {
  final String truckNumber;

  GetTruckInformationParams({
    required this.truckNumber,
  });

  Map<String, dynamic> toJson() => {
        'truck_number': truckNumber,
      };
}
