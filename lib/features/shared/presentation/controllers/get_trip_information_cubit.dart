import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_trip_information_entity.dart';
import 'package:aloudeh_company/features/shared/data/params/trip_information_params.dart';
import 'package:aloudeh_company/features/shared/data/repository/shared_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTripInformationSharedCubit extends Cubit<GetState<GetTripInformationSharedEntity>> {
 final SharedBaseRepository _sharedBaseRepository;

  GetTripInformationSharedCubit(
    this._sharedBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetTripInformation({required TripInformationSharedParams tripInformationSharedParams}) async {
    emit(const GetState.loading());
    final response = await _sharedBaseRepository.getTripInformation(tripInformationSharedParams:tripInformationSharedParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    });
  }}
