class UpdateCustomerParams {
  final String customerId;

   String? nationalId;
   String? name;
   String? phoneNumber;
   String? gender;
   String? mobile;
   String? address;
   String? addressDetail;
   String? notes;

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
     Map<String, dynamic> data = {
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
