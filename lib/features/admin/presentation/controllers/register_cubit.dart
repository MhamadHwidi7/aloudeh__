import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/utils/shared_preference_utils.dart';
import 'package:aloudeh_company/features/admin/data/entity/register_admin_entity.dart';
import 'package:aloudeh_company/features/admin/data/params/register_admin_params.dart';
import 'package:aloudeh_company/features/admin/data/repository/admin_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';
@injectable
class RegisterCubit extends Cubit<RegisterState> {
 final AdminBaseRepository _adminBaseRepository;
  final SharedPreferencesUtils _sharedPreferencesUtils;
  RegisterCubit(
    this._adminBaseRepository,
    this._sharedPreferencesUtils,
  ) : super(const RegisterState.initial());

  Future<void> emitRegisterAdmin({required RegisterAdminParams registerAdminParams}) async {
    emit(const RegisterState.loading());
    final response = await _adminBaseRepository.register(registerAdminParams:  registerAdminParams);
    response.fold((l) => emit(RegisterState.error(l)), (r) async {
      _sharedPreferencesUtils.init();
      await _sharedPreferencesUtils.setToken(r.token);
      emit(RegisterState.success(r));
      if (kDebugMode) {
        print("Token Here : ${_sharedPreferencesUtils.getToken()}");
      }
    });
  }}
