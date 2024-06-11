class GetAllReceiptParams {
  final String branchId;

  GetAllReceiptParams({
    required this.branchId,
  });

  Map<String, dynamic> toJson() => {
        'branch_id': branchId,
      };
}
