import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/admin/data/entity/vacation_entity.dart';
import 'package:aloudeh_company/features/admin/data/params/get_vacation_employee_params.dart';
import 'package:aloudeh_company/features/admin/data/repository/admin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWarehouseVacationCubit extends Cubit<GetState<BaseAdminVacationEntity>> {
 final AdminBaseRepository _adminBaseRepository;
  GetWarehouseVacationCubit(
    this._adminBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetWarehouseVacation({required GetVacationParams getVacationParams}) async {
    emit(const GetState.loading());
    final response = await _adminBaseRepository.getWarehouseVacation(getVacationWarehouseParams:  getVacationParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    
    });
  }}

