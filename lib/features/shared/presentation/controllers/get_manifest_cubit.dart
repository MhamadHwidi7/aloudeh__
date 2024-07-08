import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_manifest_entity.dart';
import 'package:aloudeh_company/features/shared/data/params/manifest_params.dart';
import 'package:aloudeh_company/features/shared/data/repository/shared_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetManifestSharedCubit extends Cubit<GetState<GetManifestSharedEntity>> {
 final SharedBaseRepository _sharedBaseRepository;

  GetManifestSharedCubit(
    this._sharedBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetManifest({required ManifestSharedParams manifestSharedParams}) async {
    emit(const GetState.loading());
    final response = await _sharedBaseRepository.getManifest(manifestSharedParams:manifestSharedParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    });
  }}
