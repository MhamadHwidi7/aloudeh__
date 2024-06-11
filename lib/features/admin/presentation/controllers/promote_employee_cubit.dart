import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/admin/data/params/promote_employee_params.dart';
import 'package:aloudeh_company/features/admin/data/repository/admin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PromoteEmployeeCubit extends Cubit<PostState<BaseEntity>> {
 final AdminBaseRepository _adminBaseRepository;
  PromoteEmployeeCubit(
    this._adminBaseRepository,
  ) : super(const PostState.idle());

  Future<void> emitPromoteEmployee({required PromoteEmployeeParams promoteEmployeeParams}) async {
    emit(const PostState.loading());
    final response = await _adminBaseRepository.promoteEmployee(promoteEmployeeParams:  promoteEmployeeParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    
    });
  }}
