import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_truck_record_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/get_truck_record_params.dart';
import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTruckRecordCubit extends Cubit<GetState<GetTruckRecordEntity>> {
 final EmployeeBaseRepository _employeeBaseRepository;
  GetTruckRecordCubit(
    this._employeeBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetTruckRecord({required GetTruckRecordParams getTruckRecordParams}) async {
    emit(const GetState.loading());
    final response = await _employeeBaseRepository.getTruckRecord(getTruckRecordParams:  getTruckRecordParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    
    });
  }}
