class AddVacationEmployeeParams {
  final String employeeId;
  final String start;
  final String end;
  final String reason;

  AddVacationEmployeeParams(
      {required this.employeeId,
      required this.start,
      required this.end,
      required this.reason});

  Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "start": start,
        "end": end,
        "reason": reason,
      };
}
