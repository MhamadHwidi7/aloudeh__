class DeleteDriverParams {
  final String driverId;

  DeleteDriverParams({
    required this.driverId,
  });

  Map<String, dynamic> toJson() => {
        "driver_id": driverId,
      };
}
