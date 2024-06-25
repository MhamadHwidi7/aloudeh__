import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/core/utils/shared_preference_utils.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/log_in_warehouse_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/params/log_in_warehouse_params.dart';
import 'package:aloudeh_company/features/warehouse/data/repository/warehouse_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogInWarehouseCubit extends Cubit<PostState<LogInWarehouseEntity>> {
 final BaseWarehouseRepository _baseWarehouseRepository;
   final SharedPreferencesUtils _sharedPreferencesUtils;

  LogInWarehouseCubit(
    this._baseWarehouseRepository,
    this._sharedPreferencesUtils
  ) : super(const PostState.idle());

  Future<void> emitLogInWarehouse({required LogInWarehouseParams logInWarehouseParams}) async {
    emit(const PostState.loading());
    final response = await _baseWarehouseRepository.login(logInWarehouseParams:logInWarehouseParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
       _sharedPreferencesUtils.init();
      await _sharedPreferencesUtils.setToken(r.token);
      emit(PostState.success(r));
      if (kDebugMode) {
        print("Token Here : ${_sharedPreferencesUtils.getToken()}");
      }
    
    });
  }}
