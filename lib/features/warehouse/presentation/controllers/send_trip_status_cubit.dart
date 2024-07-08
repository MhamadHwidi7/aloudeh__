import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/warehouse/data/params/receiving_good_params.dart';
import 'package:aloudeh_company/features/warehouse/data/params/send_trip_status_params.dart';
import 'package:aloudeh_company/features/warehouse/data/repository/warehouse_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendTripStatusCubit extends Cubit<PostState<BaseEntity>> {
  final BaseWarehouseRepository _baseWarehouseRepository;

  SendTripStatusCubit(this._baseWarehouseRepository) : super(const PostState.idle());

  Future<void> emitSendTripStatus({required SendTripStatusParams sendTripStatusParams}) async {
    emit(const PostState.loading());
    final response = await _baseWarehouseRepository.sendTripStatus(sendTripStatusParams: sendTripStatusParams);
    response.fold(
      (l) => emit(PostState.error(l)),
      (r) async {
        emit(PostState.success(r));
      },
    );
  }}