import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/admin/data/entity/truck_information_entity.dart';
import 'package:aloudeh_company/features/admin/data/params/truck_information_params.dart';
import 'package:aloudeh_company/features/admin/data/repository/admin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TruckInformationCubit extends Cubit<GetState<TruckInformationEntity>> {
 final AdminBaseRepository _adminBaseRepository;
  TruckInformationCubit(
    this._adminBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitTruckInformation({required TruckInformationParams truckInformationParams}) async {
    emit(const GetState.loading());
    final response = await _adminBaseRepository.getTruckInformation(truckInformationParams:  truckInformationParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    
    });
  }}

