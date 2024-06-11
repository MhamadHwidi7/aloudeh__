class AddVacationWarehouseParams {
  final String warehouseManagerId;
  final String start;
  final String end;
  final String reason;

  AddVacationWarehouseParams(
      {required this.warehouseManagerId,
      required this.start,
      required this.end,
      required this.reason});

  Map<String, dynamic> toJson() => {
        "wmanager_id": warehouseManagerId,
        "start": start,
        "end": end,
        "reason": reason,
      };
}
