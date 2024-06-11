import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/admin/data/params/delete_branch_params.dart';
import 'package:aloudeh_company/features/admin/data/repository/admin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteBranchCubit extends Cubit<PostState<BaseEntity>> {
 final AdminBaseRepository _adminBaseRepository;
  DeleteBranchCubit(
    this._adminBaseRepository,
  ) : super(const PostState.idle());

  Future<void> emitDeleteBranch({required DeleteBranchParams deleteBranchParams}) async {
    emit(const PostState.loading());
    final response = await _adminBaseRepository.deleteBranch(deleteBranchParams:deleteBranchParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    
    });
  }}
