class DeleteEmployeeParams {
  final String employeeId;

  DeleteEmployeeParams({
    required this.employeeId,
  });

  Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
      };
}
