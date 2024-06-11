import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/admin/data/entity/employee_entity.dart';
import 'package:aloudeh_company/features/admin/data/params/get_branches_employee_by_id_params.dart';
import 'package:aloudeh_company/features/admin/data/repository/admin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBranchEmployeeByIdCubit extends Cubit<GetState<BaseEmployeeEntity>> {
 final AdminBaseRepository _adminBaseRepository;
  GetBranchEmployeeByIdCubit(
    this._adminBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetBranchEmployeeById({required GetBranchEmployeeByIdParams getBranchEmployeeByIdParams}) async {
    emit(const GetState.loading());
    final response = await _adminBaseRepository.getBranchEmployees(getBranchesEmployeeByIdParams:getBranchEmployeeByIdParams );
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    
    });
  }}
