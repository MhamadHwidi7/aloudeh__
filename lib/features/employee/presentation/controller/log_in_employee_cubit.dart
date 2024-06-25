import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/core/utils/shared_preference_utils.dart';
import 'package:aloudeh_company/features/admin/data/params/add_branch_params.dart';
import 'package:aloudeh_company/features/admin/data/repository/admin_repository.dart';
import 'package:aloudeh_company/features/driver/data/entity/log_in_driver_entity.dart';
import 'package:aloudeh_company/features/driver/data/params/log_in_driver_params.dart';
import 'package:aloudeh_company/features/driver/data/repository/driver_repository.dart';
import 'package:aloudeh_company/features/employee/data/entity/log_in_employee_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/log_in_employee_params.dart';
import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogInEmployeeCubit extends Cubit<PostState<LogInEmployeeEntity>> {
 final EmployeeBaseRepository _employeeBaseRepository;
   final SharedPreferencesUtils _sharedPreferencesUtils;

  LogInEmployeeCubit(
    this._employeeBaseRepository,
    this._sharedPreferencesUtils
  ) : super(const PostState.idle());

  Future<void> emitLogInEmployee({required LogInEmployeeParams logInEmployeeParams}) async {
    emit(const PostState.loading());
    final response = await _employeeBaseRepository.login(logInEmployeeParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
       _sharedPreferencesUtils.init();
      await _sharedPreferencesUtils.setToken(r.token);
      emit(PostState.success(r));
      if (kDebugMode) {
        print("Token Here : ${_sharedPreferencesUtils.getToken()}");
      }
    
    });
  }}
