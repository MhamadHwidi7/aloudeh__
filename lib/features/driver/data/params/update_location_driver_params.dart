
class UpdateLocationDriverParams {
  final double driverCurrentLat;
  final double driverCurrentLng;
final String tripNumber;
  UpdateLocationDriverParams({required this.tripNumber,required this.driverCurrentLat, required this.driverCurrentLng});



  Map<String, dynamic> toJson() => {
        "current_lng": driverCurrentLng,
        "current_lat": driverCurrentLat,
"trip_number":tripNumber
      };
}
