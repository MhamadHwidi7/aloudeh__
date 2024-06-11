class PromoteEmployeeParams {
  final String employeeId;
  final String branchId;
  final String rank;

  PromoteEmployeeParams(
      {required this.employeeId, required this.branchId, required this.rank});

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "branch_id": branchId,
        "employee_id": employeeId,
      };
}
