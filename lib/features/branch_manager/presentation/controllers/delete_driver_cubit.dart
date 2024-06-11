import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/delete_driver_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/repository/branch_manager_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteDriverCubit extends Cubit<PostState<BaseEntity>> {
 final BranchManagerBaseRepository _branchManagerBaseRepository;
  DeleteDriverCubit(
    this._branchManagerBaseRepository,
  ) : super(const PostState.idle());

  Future<void> emitDeleteDriver({required DeleteDriverParams deleteDriverParams}) async {
    emit(const PostState.loading());
    final response = await _branchManagerBaseRepository.deleteDriver(deleteDriverParams:deleteDriverParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    
    });
  }}
