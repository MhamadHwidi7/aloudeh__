import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_truck_information_entity.dart';
import 'package:aloudeh_company/features/shared/data/params/truck_information_params.dart';
import 'package:aloudeh_company/features/shared/data/repository/shared_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTruckInformationSharedCubit extends Cubit<GetState<GetTruckInformationSharedEntity>> {
 final SharedBaseRepository _sharedBaseRepository;

  GetTruckInformationSharedCubit(
    this._sharedBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetTruckInformation({required TruckInformationSharedParams truckInformationSharedParams}) async {
    emit(const GetState.loading());
    final response = await _sharedBaseRepository.getTruckInformation(truckInformationSharedParams:truckInformationSharedParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    });
  }}
