import 'package:aloudeh_company/features/driver/data/entity/driver_profile_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/driver/data/repository/driver_repository.dart';

@injectable
class DriverProfileCubit extends Cubit<GetState<BaseDriverProfileEntity>> {
  final DriverBaseRepository _driverBaseRepository;

  DriverProfileCubit(this._driverBaseRepository) : super(const GetState.loading());

  Future<void> emitGetDriverProfile() async {
    emit(const GetState.loading());
    final response = await _driverBaseRepository.getDriverProfile();
    response.fold(
      (l) => emit(GetState.error(l)),
      (r) => emit(GetState.success(r)),
    );
  }
}
