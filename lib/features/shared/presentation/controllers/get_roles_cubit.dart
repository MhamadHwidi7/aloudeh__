import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_role_entity.dart';
import 'package:aloudeh_company/features/shared/data/repository/shared_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRoleCubit extends Cubit<GetState<RoleEntity>> {
 final SharedBaseRepository _sharedBaseRepository;

  GetRoleCubit(
    this._sharedBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetRole() async {
    emit(const GetState.loading());
    final response = await _sharedBaseRepository.getRole();
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    });
  }}
