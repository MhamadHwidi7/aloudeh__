class EditTripParams {
  final String tripId;
  final int? branchId;
  final int? truckId;
  final int? driverId;
  final int? manifestId;
  final String? tripNumber;
  final String? source;
  final String? destination;
  final String? arrivalDate;
  final String? status;

  EditTripParams({
    required this.tripId,
    this.branchId,
    this.truckId,
    this.driverId,
    this.manifestId,
    this.tripNumber,
    this.source,
    this.destination,
    this.arrivalDate,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'trip_id': tripId,
    };
    if (branchId != null) data['branch_id'] = branchId;
    if (truckId != null) data['truck_id'] = truckId;
    if (driverId != null) data['driver_id'] = driverId;
    if (manifestId != null) data['manifest_id'] = manifestId;
    if (tripNumber != null) data['trip_number'] = tripNumber;
    if (source != null) data['source'] = source;
    if (destination != null) data['destination'] = destination;
    if (arrivalDate != null) data['arrival_date'] = arrivalDate;
    if (status != null) data['status'] = status;
    return data;
  }
}
