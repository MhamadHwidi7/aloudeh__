import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/admin/data/params/add_branch_params.dart';
import 'package:aloudeh_company/features/admin/data/repository/admin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddBranchCubit extends Cubit<PostState<BaseEntity>> {
 final AdminBaseRepository _adminBaseRepository;
  AddBranchCubit(
    this._adminBaseRepository,
  ) : super(const PostState.idle());

  Future<void> emitAddBranch({required AddBranchParams addBranchParams}) async {
    emit(const PostState.loading());
    final response = await _adminBaseRepository.addBranch(addBranchParams:addBranchParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    
    });
  }}
