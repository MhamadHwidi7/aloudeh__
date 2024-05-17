import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/utils/shared_preference_utils.dart';
import 'package:aloudeh_company/features/admin/data/entity/log_in_admin_entity.dart';
import 'package:aloudeh_company/features/admin/data/params/log_in_admin_params.dart';
import 'package:aloudeh_company/features/admin/data/repository/admin_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'log_in_cubit.freezed.dart';
part 'log_in_state.dart';
@injectable
class LogInCubit extends Cubit<LogInState> {
 final AdminBaseRepository _adminBaseRepository;
  final SharedPreferencesUtils _sharedPreferencesUtils;
  LogInCubit(
    this._adminBaseRepository,
    this._sharedPreferencesUtils,
  ) : super(const LogInState.initial());

  Future<void> emitLogInAdmin({required LogInAdminParams logInAdminParams}) async {
    emit(const LogInState.loading());
    final response = await _adminBaseRepository.logIn(logInAdminParams:  logInAdminParams);
    response.fold((l) => emit(LogInState.error(l)), (r) async {
      _sharedPreferencesUtils.init();
      await _sharedPreferencesUtils.setToken(r.token);
      emit(LogInState.success(r));
      if (kDebugMode) {
        print("Token Here : ${_sharedPreferencesUtils.getToken()}");
      }
    });
  }}

