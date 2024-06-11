class AddTripParams {
  final String branchId;
  final String destinationId;
  final String truckId;
  final String driverId;

  AddTripParams({required this.branchId, required this.destinationId, required this.truckId, required this.driverId});


  Map<String, dynamic> toJson() => {
        "branch_id": branchId,
        "destination_id": destinationId,
        "truck_id": truckId,
        "driver_id": driverId,
      };
}
