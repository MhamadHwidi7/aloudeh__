class EditDriverProfileParams {
  final String? name;
  final String? address;
  final String? phoneNumber;

  EditDriverProfileParams( {required this.name, required this.address, required this.phoneNumber});


  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
    };
    if (name != null) data['name'] = name;
    if (address != null) data['address'] = address;
    if (phoneNumber != null) data['phone_number'] = phoneNumber;
    return data;
  }
}
