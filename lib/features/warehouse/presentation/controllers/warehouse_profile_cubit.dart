import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/warehouse_profile_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/repository/warehouse_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfileWarehouseCubit extends Cubit<GetState<WarehouseProfileEntity>> {
 final BaseWarehouseRepository _baseWarehouseRepository;

  GetProfileWarehouseCubit(
    this._baseWarehouseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetProfile() async {
    emit(const GetState.loading());
    final response = await _baseWarehouseRepository.profile();
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    });
  }}
