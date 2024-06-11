class UpdateEmployeeParams {
  final int employeeId;
  final String? address;
  final String? mobile;
  final String? name;
  final String? phoneNumber;

  UpdateEmployeeParams({
    required this.employeeId,
    this.address,
    this.mobile,
    this.name,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {'employee_id': employeeId};
    if (address != null) data['address'] = address;
    if (mobile != null) data['mobile'] = mobile;
    if (name != null) data['name'] = name;
    if (phoneNumber != null) data['phone_number'] = phoneNumber;
    return data;
  }
}
