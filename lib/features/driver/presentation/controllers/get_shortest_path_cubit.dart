import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/driver/data/entity/base_place_directions_entity.dart';
import 'package:aloudeh_company/features/driver/data/params/shortest_path_params.dart';
import 'package:aloudeh_company/features/driver/data/repository/driver_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetShortestPathCubit extends Cubit<GetState<BasePlaceDirectionsEntity>> {
 final DriverBaseRepository _driverBaseRepository;
  GetShortestPathCubit(
    this._driverBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetShortestPath({required ShortestPathParams shortestPathParams}) async {
    emit(const GetState.loading());
    final response = await _driverBaseRepository.getShortestPath(shortestPathParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    
    });
  }}

