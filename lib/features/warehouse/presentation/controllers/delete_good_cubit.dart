import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/warehouse/data/params/delete_good_params.dart';
import 'package:aloudeh_company/features/warehouse/data/repository/warehouse_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteGoodCubit extends Cubit<PostState<BaseEntity>> {
 final BaseWarehouseRepository _baseWarehouseRepository;

  DeleteGoodCubit(
    this._baseWarehouseRepository,
  ) : super(const PostState.idle());

  Future<void> emitDeleteGood({required DeleteGoodParams deleteGoodParams}) async {
    emit(const PostState.loading());
    final response = await _baseWarehouseRepository.deleteGood(deleteGoodParams:deleteGoodParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    });
  }}
