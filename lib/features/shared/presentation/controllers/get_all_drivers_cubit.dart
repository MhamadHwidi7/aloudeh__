import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/shared/data/entity/driver_entity.dart';
import 'package:aloudeh_company/features/shared/data/repository/shared_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllDriversSharedCubit extends Cubit<GetState<BaseDriverSharedEntity>> {
 final SharedBaseRepository _sharedBaseRepository;

  GetAllDriversSharedCubit(
    this._sharedBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetAllDrivers() async {
    emit(const GetState.loading());
    final response = await _sharedBaseRepository.getAllDrivers();
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    });
  }}
