class TruckInformationParams {
  final String truckNumber;

  TruckInformationParams({required this.truckNumber});

  Map<String, dynamic> toJson() => {
        "truck_number": truckNumber,
      };
}
