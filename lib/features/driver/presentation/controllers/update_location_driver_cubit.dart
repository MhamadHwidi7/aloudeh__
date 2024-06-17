import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/driver/data/params/update_location_driver_params.dart';
import 'package:aloudeh_company/features/driver/data/repository/driver_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateLocationDriverCubit extends Cubit<PostState<BaseEntity>> {
 final DriverBaseRepository _driverBaseRepository;

  UpdateLocationDriverCubit(
    this._driverBaseRepository,
  ) : super(const PostState.idle());

  Future<void> emitUpdateLocationDriver({required UpdateLocationDriverParams updateLocationDriverParams}) async {
    emit(const PostState.loading());
    final response = await _driverBaseRepository.updateeLocationDriver(updateLocationDriverParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    
    });
  }}
