import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/get_good_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/params/get_good_params.dart';
import 'package:aloudeh_company/features/warehouse/data/repository/warehouse_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetGoodCubit extends Cubit<PostState<GetGoodEntity>> {
 final BaseWarehouseRepository _baseWarehouseRepository;

  GetGoodCubit(
    this._baseWarehouseRepository,
  ) : super(const PostState.idle());

  Future<void> emitGetGood({required GetGoodParams getGoodParams}) async {
    emit(const PostState.loading());
    final response = await _baseWarehouseRepository.getGood(getGoodParams:getGoodParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    });
  }}
