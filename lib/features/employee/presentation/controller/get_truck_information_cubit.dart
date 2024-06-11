import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_truck_information_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/get_truck_information_params.dart';
import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTruckInformationCubit extends Cubit<GetState<GetTruckInformationEntity>> {
 final EmployeeBaseRepository _employeeBaseRepository;
  GetTruckInformationCubit(
    this._employeeBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetTruckInformation({required GetTruckInformationParams getTruckInformationParams}) async {
    emit(const GetState.loading());
    final response = await _employeeBaseRepository.getTruckInformation(getTruckInformationParams:  getTruckInformationParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    
    });
  }}
