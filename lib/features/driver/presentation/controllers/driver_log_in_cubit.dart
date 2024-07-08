import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/core/utils/shared_preference_utils.dart';
import 'package:aloudeh_company/features/driver/data/entity/log_in_driver_entity.dart';
import 'package:aloudeh_company/features/driver/data/params/log_in_driver_params.dart';
import 'package:aloudeh_company/features/driver/data/repository/driver_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogInDriverCubit extends Cubit<PostState<LogInDriverEntity>> {
 final DriverBaseRepository _driverBaseRepository;
   final SharedPreferencesUtils _sharedPreferencesUtils;

  LogInDriverCubit(
    this._driverBaseRepository,
    this._sharedPreferencesUtils
  ) : super(const PostState.idle());

  Future<void> emitLogInDriver({required LogInDriverParams logInDriverParams}) async {
    emit(const PostState.loading());
    final response = await _driverBaseRepository.logIn(logInDriverParams:logInDriverParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
       _sharedPreferencesUtils.init();
      await _sharedPreferencesUtils.setToken(r.token);
      emit(PostState.success(r));
      if (kDebugMode) {
        print("Token Here : ${_sharedPreferencesUtils.getToken()}");
      }
    
    });
  }}
