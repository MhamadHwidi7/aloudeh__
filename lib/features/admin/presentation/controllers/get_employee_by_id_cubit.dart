import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/admin/data/entity/get_employee_entity.dart';
import 'package:aloudeh_company/features/admin/data/params/get_employee_by_id_params.dart';
import 'package:aloudeh_company/features/admin/data/repository/admin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetEmployeeByIdCubit extends Cubit<GetState<BaseEmployeeAdminEntity>> {
 final AdminBaseRepository _adminBaseRepository;
  GetEmployeeByIdCubit(
    this._adminBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetEmployeeById({required GetEmployeeByIdParams getEmployeeByIdParams}) async {
    emit(const GetState.loading());
    final response = await _adminBaseRepository.getEmployeeById(getEmployeeByIdParams:  getEmployeeByIdParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    
    });
  }}
