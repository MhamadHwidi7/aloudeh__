import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/admin/data/entity/truck_record_entity.dart';
import 'package:aloudeh_company/features/admin/data/params/truck_record_params.dart';
import 'package:aloudeh_company/features/admin/data/repository/admin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TruckRecordCubit extends Cubit<GetState<BaseTruckRecordEntity>> {
 final AdminBaseRepository _adminBaseRepository;
  TruckRecordCubit(
    this._adminBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitTruckRecord({required TruckRecordParams truckRecordParams}) async {
    emit(const GetState.loading());
    final response = await _adminBaseRepository.truckRecord(truckRecordParams:  truckRecordParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    
    });
  }}

