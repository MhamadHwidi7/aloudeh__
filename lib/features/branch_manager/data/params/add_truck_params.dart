class AddTruckParams {
  final String line;
  final String number;
  final String branchId;

  AddTruckParams({
    required this.number,
    required this.line,
    required this.branchId,
  });

  Map<String, dynamic> toJson() => {
        "number": number,
        "branch_id": branchId,
        "line": line,
      };
}
