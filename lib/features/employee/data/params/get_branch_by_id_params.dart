class GetBranchByIdParams {
  final String branchId;

  GetBranchByIdParams({required this.branchId});

  Map<String, dynamic> toJson() => {
        "branch_id": branchId,
      };
}
