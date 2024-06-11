import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/admin/data/entity/get_trip_information_entity.dart';
import 'package:aloudeh_company/features/admin/data/repository/admin_repository.dart';
import 'package:aloudeh_company/features/employee/data/params/get_trip_information.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTripInformationCubit extends Cubit<GetState<GetTripInformationAdminEntity>> {
 final AdminBaseRepository _adminBaseRepository;
  GetTripInformationCubit(
    this._adminBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetTripInformation({required GetTripInformationParams getTripInformationParams}) async {
    emit(const GetState.loading());
    final response = await _adminBaseRepository.getTripInformation(getTripInformationParams:  getTripInformationParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    
    });
  }}
