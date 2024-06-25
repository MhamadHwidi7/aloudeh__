import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/admin/data/entity/employee_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/employee_profile.dart';
import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfileCubit extends Cubit<GetState<EmployeeProfile>> {
 final EmployeeBaseRepository _employeeBaseRepository;
  GetProfileCubit(
    this._employeeBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetProfile() async {
    emit(const GetState.loading());
    final response = await _employeeBaseRepository.profile();
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    
    });
  }}
