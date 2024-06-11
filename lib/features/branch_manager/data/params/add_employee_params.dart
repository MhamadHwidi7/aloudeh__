class AddEmployeeParams {
  final String name;
  final String email;
  final String phoneNumber;
  final String gender;
  final String branchId;
  final String motherName;
  final String birthDate;
  final String birthPlace;
  final String mobile;
  final String address;
  final String salary;
  final String rank;
  final String nationalId;

  AddEmployeeParams(
      {required this.name,
      required this.address,
      required this.birthDate,
      required this.birthPlace,
      required this.email,
      required this.phoneNumber,
      required this.motherName,
      required this.gender,
      required this.branchId,
      required this.mobile,
      required this.salary,
      required this.rank,
      required this.nationalId});

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "gender": gender,
        "branch_id": branchId,
        "mother_name": motherName,
        "birth_date": birthDate,
        "birth_place": birthPlace,
        "mobile": mobile,
        "address": address,
        "salary": salary,
        "rank": rank,
        "national_id": nationalId,
      };
}
