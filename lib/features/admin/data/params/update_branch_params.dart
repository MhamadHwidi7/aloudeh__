class UpdateBranchParams {
  final int branchId;
  final String? address;
  final String? phone;
  final String? name;
  final String? phoneNumber;

  UpdateBranchParams({
    required this.branchId,
    this.address,
    this.phone,
    this.name,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {'branch_id': branchId};
    if (address != null) data['address'] = address;
    if (phone != null) data['phone'] = phone;
    if (name != null) data['name'] = name;
    if (phoneNumber != null) data['phone_number'] = phoneNumber;
    return data;
  }
}
