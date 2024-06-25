import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/role_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/repository/warehouse_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRoleCubit extends Cubit<GetState<RoleEntity>> {
 final BaseWarehouseRepository _baseWarehouseRepository;

  GetRoleCubit(
    this._baseWarehouseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetRole() async {
    emit(const GetState.loading());
    final response = await _baseWarehouseRepository.getRole();
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    });
  }}
