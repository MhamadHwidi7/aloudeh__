class DeleteTruckParams {
  final String truckId;

  DeleteTruckParams({
    required this.truckId,
  });

  Map<String, dynamic> toJson() => {
        "truck_id": truckId,
      };
}
