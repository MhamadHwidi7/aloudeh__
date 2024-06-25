import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/warehouse/data/params/inventory_good_params.dart';
import 'package:aloudeh_company/features/warehouse/data/repository/warehouse_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class InventoryGoodCubit extends Cubit<PostState<BaseEntity>> {
 final BaseWarehouseRepository _baseWarehouseRepository;

  InventoryGoodCubit(
    this._baseWarehouseRepository,
  ) : super(const PostState.idle());

  Future<void> emitInventoryGood({required InventoryGoodsParams inventoryGoodsParams}) async {
    emit(const PostState.loading());
    final response = await _baseWarehouseRepository.inventoryGood(inventoryGoodsParams:inventoryGoodsParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    });
  }}
