import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/employee/data/params/delete_customer_params.dart';
import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteCustomerCubit extends Cubit<PostState<BaseEntity>> {
 final EmployeeBaseRepository _employeeBaseRepository;
  DeleteCustomerCubit(
    this._employeeBaseRepository,
  ) : super(const PostState.idle());

  Future<void> emitDeleteCustomer({required DeleteCustomerParams deleteCustomerParams}) async {
    emit(const PostState.loading());
    final response = await _employeeBaseRepository.deleteCustomer(deleteCustomerParams:deleteCustomerParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    
    });
  }}
