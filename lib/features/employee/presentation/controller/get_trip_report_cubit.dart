import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/employee/data/entity/report_entity.dart';
import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTripReportCubit extends Cubit<GetState<BaseReportEntity>> {
 final EmployeeBaseRepository _employeeBaseRepository;
  GetTripReportCubit(
    this._employeeBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetTripReport() async {
    emit(const GetState.loading());
    final response = await _employeeBaseRepository.getTripReport();
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    
    });
  }}
