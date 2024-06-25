import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/warehouse/data/params/receiving_good_params.dart';
import 'package:aloudeh_company/features/warehouse/data/repository/warehouse_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReceivingGoodCubit extends Cubit<PostState<BaseEntity>> {
  final BaseWarehouseRepository _baseWarehouseRepository;
  bool _hasScanned = false;

  ReceivingGoodCubit(this._baseWarehouseRepository) : super(const PostState.idle());

  Future<void> emitReceivingGood({required ReceivingGoodParams receivingGoodParams}) async {
    emit(const PostState.loading());
    final response = await _baseWarehouseRepository.receivingGood(receivingGoodParams: receivingGoodParams);
    response.fold(
      (l) => emit(PostState.error(l)),
      (r) async {
        emit(PostState.success(r));
      },
    );
  }

  void handleQrCodeScanned(String barcode) {
    if (!_hasScanned) {
      _hasScanned = true;
      emitReceivingGood(receivingGoodParams: ReceivingGoodParams(barcode: barcode));
    }
  }

  void resetScanState() {
    _hasScanned = false;
  }
}
