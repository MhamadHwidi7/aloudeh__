import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_customer_filter_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/get_customer_filter_params.dart';
import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCustomerFilterCubit extends Cubit<PostState<GetCustomersFilterEntity>> {
  final EmployeeBaseRepository _employeeBaseRepository;
  GetCustomerFilterParams? _lastParams;

  GetCustomerFilterCubit(
    this._employeeBaseRepository,
  ) : super(const PostState.idle());

  Future<void> emitGetCustomerFilter({required GetCustomerFilterParams getCustomerFilterParams}) async {
    _lastParams = getCustomerFilterParams;
    emit(const PostState.loading());
    final response = await _employeeBaseRepository.getCustomerFilter(getCustomerFilterParams);
    response.fold(
      (l) => emit(PostState.error(l)),
      (r) async {
        emit(PostState.success(r));
      },
    );
  }

  Future<void> redoSearch() async {
    if (_lastParams != null) {
      await emitGetCustomerFilter(getCustomerFilterParams: _lastParams!);
    }
  }
}
