class AddCustomerParams {
  final String nationalId;
  final String name;
  final String phoneNumber;
  final String gender;
  final String mobile;
  final String address;
  final String addressDetail;
  final String notes;

  AddCustomerParams({required this.nationalId, required this.name, required this.phoneNumber, required this.gender, required this.mobile, required this.address, required this.addressDetail, required this.notes});

  Map<String, dynamic> toJson() => {
        "national_id": nationalId,
        "name": name,
        "phone_number": phoneNumber,
        "gender": gender,
        "mobile": mobile,
        "address": address,
        "address_detail": addressDetail,
        "notes": notes,
      };
}
