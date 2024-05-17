class UpdateWarehouseParams {
  final int warehouseId;
  final String? warehouseName;
  final String? managerAddress;
  final String? address;
  final double? salary;
  final String? area;

  UpdateWarehouseParams({
    required this.warehouseId,
    this.warehouseName,
    this.managerAddress,
    this.address,
    this.salary,
    this.area,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {'warehouse_id': warehouseId};
    if (warehouseName != null) data['name'] = warehouseName;
    if (managerAddress != null) data['manager_address'] = managerAddress;
    if (address != null) data['address'] = address;
    if (salary != null) data['salary'] = salary;
    if (area != null) data['area'] = area;
    return data;
  }
}
