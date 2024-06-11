import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/delete_employee_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/repository/branch_manager_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteEmployeeCubit extends Cubit<PostState<BaseEntity>> {
 final BranchManagerBaseRepository _branchManagerBaseRepository;
  DeleteEmployeeCubit(
    this._branchManagerBaseRepository,
  ) : super(const PostState.idle());

  Future<void> emitDeleteEmployee({required DeleteEmployeeParams deleteEmployeeParams}) async {
    emit(const PostState.loading());
    final response = await _branchManagerBaseRepository.deleteEmployee(deleteEmployeeParams:deleteEmployeeParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    
    });
  }}
