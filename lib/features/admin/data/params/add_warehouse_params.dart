class AddWarehouseParams {
  final String warehouseAddress;
  final int branchId;
  final String warehouseName;
  final String area;
  final String notes;

  AddWarehouseParams({
    required this.warehouseAddress,
    required this.branchId,
    required this.warehouseName,
    required this.area,
    required this.notes,
  });

  Map<String, dynamic> toJson() => {
        "warehouse_address": warehouseAddress,
        "branch_id": branchId,
        "warehouse_name": warehouseName,
        "area": area,
        "notes": notes,
      };
}
