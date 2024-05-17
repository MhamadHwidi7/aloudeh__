class AddWarehouseManagerParams {
  final int nationalId;
  final String managerName;
  final int warehouseId;
  final String email;
  final String phoneNumber;
  final String gender;
  final String motherName;
  final String dateOfBirth;
  final String managerAddress;
  final String salary;
  final String rank;

  AddWarehouseManagerParams({
    required this.nationalId,
    required this.managerName,
    required this.warehouseId,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.motherName,
    required this.dateOfBirth,
    required this.managerAddress,
    required this.salary,
    required this.rank,
  });

  Map<String, dynamic> toJson() => {
        "national_id": nationalId,
        "manager_name": managerName,
        "warehouse_id": warehouseId,
        "email": email,
        "phone_number": phoneNumber,
        "gender": gender,
        "mother_name": motherName,
        "date_of_birth": dateOfBirth,
        "manager_address": managerAddress,
        "salary": salary,
        "rank": rank,
      };
}
