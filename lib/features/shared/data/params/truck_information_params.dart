class TruckInformationSharedParams {
  final String truckNumber;

  TruckInformationSharedParams({
    required this.truckNumber,
  });

  Map<String, dynamic> toJson() => {
        'truck_number': truckNumber,
      };
}
