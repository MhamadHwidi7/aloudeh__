class GetBranchLocationParams {
  final String branchId;

  GetBranchLocationParams({required this.branchId});



  Map<String, dynamic> toJson() => {
        "branch_id": branchId,


      };
}
