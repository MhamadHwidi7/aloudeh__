import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/notification_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/repository/warehouse_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetNotificationCubit extends Cubit<GetState<BaseNotificationEntity>> {
 final BaseWarehouseRepository _baseWarehouseRepository;

  GetNotificationCubit(
    this._baseWarehouseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetNotification() async {
    emit(const GetState.loading());
    final response = await _baseWarehouseRepository.getNotifications();
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    });
  }}
