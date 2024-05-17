class AddBranchParams {
  final String address;
  final String desk;
  final String phone;
  final String managerName;
  final String email;
  final String phoneNumber;
  final String motherName;
  final String gender;
  final String dateOfBirth;
  final String managerAddress;
  final String salary;
  final String rank;
  final String nationalId;

  AddBranchParams({
    required this.address,
    required this.desk,
    required this.phone,
    required this.managerName,
    required this.email,
    required this.phoneNumber,
    required this.motherName,
    required this.gender,
    required this.dateOfBirth,
    required this.managerAddress,
    required this.salary,
    required this.rank,
    required this.nationalId,
  });

  Map<String, dynamic> toJson() => {
        "address": address,
        "desk": desk,
        "phone": phone,
        "manager_name": managerName,
        "email": email,
        "phone_number": phoneNumber,
        "mother_name": motherName,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "manager_address": managerAddress,
        "salary": salary,
        "rank": rank,
        "national_id": nationalId,
      };
}
