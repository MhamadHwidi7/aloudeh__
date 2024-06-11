import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/employee/data/params/update_customer_params.dart';
import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateCustomerCubit extends Cubit<PostState<BaseEntity>> {
 final EmployeeBaseRepository _employeeBaseRepository;
  UpdateCustomerCubit(
    this._employeeBaseRepository,
  ) : super(const PostState.idle());

  Future<void> emitUpdateCustomer({required UpdateCustomerParams updateCustomerParams}) async {
    emit(const PostState.loading());
    final response = await _employeeBaseRepository.updateCustomer(updateCustomerParams:updateCustomerParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    
    });
  }}
