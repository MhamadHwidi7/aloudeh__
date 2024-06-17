import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_all_customers_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/pagination_state_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';

@injectable
class GetAllCustomersEmployeePaginatedCubit extends Cubit<PaginationStateTest<GetCustomerEmployeePaginatedEntity>> {
  final EmployeeBaseRepository _employeeBaseRepository;
  int currentPage = 1;
  int? lastPage;
  List<GetCustomerEmployeePaginatedEntity?> _customers = [];

  GetAllCustomersEmployeePaginatedCubit(
    this._employeeBaseRepository,
  ) : super(const PaginationStateTest.loading());

  Future<void> emitGetAllCustomers({
    bool loadMore = false,
  }) async {
    if (loadMore) {
      if (lastPage != null && currentPage > lastPage!) return;
      currentPage++;
    } else {
      currentPage = 1;
      emit(const PaginationStateTest.loading());
    }

    var response = await _employeeBaseRepository.getAllCustomers(currentPage);
    response.fold(
      (l) {
        if (kDebugMode) {
          print("ssssssssssssssss");
          print(l);
        }
        emit(PaginationStateTest.error(l));
      },
      (r) {
        if (r.data != null) {
          lastPage = r.data!.lastPage;
          _addIncomingDataToClassMemberData(loadMore, r);
          emit(PaginationStateTest.success(data: _customers.where((element) => element != null).cast<GetCustomerEmployeePaginatedEntity>().toList(), canLoadMore: currentPage));
        }
      },
    );
  }

  void _addIncomingDataToClassMemberData(bool loadMore, BasePaginationEntity<PaginationEntity<GetCustomerEmployeePaginatedEntity?>> model) {
    if (loadMore) {
      _customers.addAll(model.data!.data);
    } else {
      _customers = model.data!.data;
    }
  }
}
