class PromoteEmployeeParams {
  final String rank;
  final String employeeId;
  final String branchId;

  PromoteEmployeeParams({required this.rank, required this.employeeId, required this.branchId});


  Map<String, dynamic> toJson() => {
        "rank": rank,
        "employee_id":employeeId,
        "branch_id":branchId,
      };
}
