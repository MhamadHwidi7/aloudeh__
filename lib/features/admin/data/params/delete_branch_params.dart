class DeleteBranchParams {
  final int branchId;

  DeleteBranchParams({required this.branchId});

  Map<String, dynamic> toJson() => {
        "branch_id": branchId,
      };
}
