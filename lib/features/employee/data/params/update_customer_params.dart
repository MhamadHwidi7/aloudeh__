class UpdateCustomerParams {
  final String customerId;

  final String? nationalId;
  final String? name;
  final String? phoneNumber;
  final String? gender;
  final String? mobile;
  final String? address;
  final String? addressDetail;
  final String? notes;

  UpdateCustomerParams({
    required this.customerId,
    this.nationalId,
    this.name,
    this.phoneNumber,
    this.gender,
    this.mobile,
    this.address,
    this.addressDetail,
    this.notes,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "customer_id": customerId,
    };
    if (nationalId != null) data['national_id'] = nationalId;
    if (name != null) data['name'] = name;
    if (phoneNumber != null) data['phone_number'] = phoneNumber;
    if (gender != null) data['gender'] = gender;
    if (mobile != null) data['mobile'] = mobile;
    if (address != null) data['address'] = address;
    if (addressDetail != null) data['address_detail'] = addressDetail;
    if (notes != null) data['notes'] = notes;
    return data;
  }
}
