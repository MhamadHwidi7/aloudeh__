class RateEmployeeParams {
  final String employeeId;
  final String rate;

  RateEmployeeParams(
      {required this.employeeId, required this.rate});

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "employee_id": employeeId,
      };
}
