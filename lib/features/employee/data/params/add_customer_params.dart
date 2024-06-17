class AddCustomerParams {
  final String nationalId;
  final String name;
  final String phoneNumber;
  final String gender;
  final String mobile;
  final String address;
  final String addressDetail;
  final String? notes;

  AddCustomerParams({required this.nationalId, required this.name, required this.phoneNumber, required this.gender, required this.mobile, required this.address, required this.addressDetail,  this.notes});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "national_id": nationalId,
      "name": name,
      "phone_number": phoneNumber,
      "gender": gender,
      "mobile": mobile,
      "address": address,
      "address_detail": addressDetail,
    };
    if (notes != null && notes!.isNotEmpty) {
      data['notes'] = notes;
    }
    return data;
  }
}
