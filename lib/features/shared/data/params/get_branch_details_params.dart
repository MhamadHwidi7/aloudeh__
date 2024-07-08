class GetBranchDetailsSharedParams {
  final String branchId;

  GetBranchDetailsSharedParams({required this.branchId});

  Map<String, dynamic> toJson() => {
        "branch_id": branchId,
      };
}
