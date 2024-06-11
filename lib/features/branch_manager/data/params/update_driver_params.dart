class UpdateDriverParams {
  final int driverId;
  final int? branchId;

  final String? address;
  final String? mobile;
  final String? name;
  final String? phoneNumber;

  UpdateDriverParams({
    required this.driverId,
     this.branchId,
    this.address,
    this.mobile,
    this.name,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'driver_id': driverId,
    };
    if (address != null) data['address'] = address;
    if (mobile != null) data['mobile'] = mobile;
    if (branchId != null) data['branch_id'] = branchId;
    if (name != null) data['name'] = name;
    if (phoneNumber != null) data['phone_number'] = phoneNumber;
    return data;
  }
}
