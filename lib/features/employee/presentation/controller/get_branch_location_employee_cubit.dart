import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_branch_location_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/get_branch_location_params.dart';
import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBranchLocationEmployeeCubit extends Cubit<GetState<GetBranchLocationEntity>> {
 final EmployeeBaseRepository _employeeBaseRepository;
  GetBranchLocationEmployeeCubit(
    this._employeeBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetBranchLocation({required GetBranchLocationParams getBranchLocationParams}) async {
    emit(const GetState.loading());
    final response = await _employeeBaseRepository.getBranchLocation(getBranchLocationParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    
    });
  }}

