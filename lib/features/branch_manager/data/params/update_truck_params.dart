class UpdateTruckParams {
  final String line;
  final String number;
  final String truckId;

  UpdateTruckParams({
    required this.number,
    required this.line,
    required this.truckId,
  });

  Map<String, dynamic> toJson() => {
        "number": number,
        "truck_id": truckId,
        "line": line,
      };
}
