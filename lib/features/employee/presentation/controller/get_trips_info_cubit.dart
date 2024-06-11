import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_trip_information_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/get_trip_information.dart';
import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTripsInfoCubit extends Cubit<GetState<GetTripInformationEntity>> {
 final EmployeeBaseRepository _employeeBaseRepository;
  GetTripsInfoCubit(
    this._employeeBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetTripsInfo({required GetTripInformationParams getTripInformationParams}) async {
    emit(const GetState.loading());
    final response = await _employeeBaseRepository.getTripInfo(getTripInformationParams:  getTripInformationParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    
    });
  }}
