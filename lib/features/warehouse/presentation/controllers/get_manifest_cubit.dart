import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/get_manifest_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/params/get_manifest_params.dart';
import 'package:aloudeh_company/features/warehouse/data/repository/warehouse_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetManifestWarehouseCubit extends Cubit<GetState<GetManifestWarehouseEntity>> {
 final BaseWarehouseRepository _baseWarehouseRepository;
  GetManifestWarehouseCubit(
    this._baseWarehouseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetManifest({required GetManifestParams getManifestParams}) async {
    emit(const GetState.loading());
    final response = await _baseWarehouseRepository.getManifest(getManifestParams:  getManifestParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    
    });
  }}
