class DeleteWarehouseParams {
  final int warehouseId;

  DeleteWarehouseParams({required this.warehouseId});

  Map<String, dynamic> toJson() => {
        "warehouse_id": warehouseId,
      };
}
