import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/core/global_states/pagination_state.dart';
import 'package:aloudeh_company/features/employee/data/entity/truck_record_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/pagination_state_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';

const initialPage = 1;

@injectable
class GetAllTruckRecordPaginatedCubit extends Cubit<PaginationStateTest<TruckRecordPaginatedEntity>> {
  final EmployeeBaseRepository _employeeBaseRepository;
  int currentPage = initialPage;
  int? lastPage;
  List<TruckRecordPaginatedEntity?> _truckRecords = [];

  GetAllTruckRecordPaginatedCubit(
    this._employeeBaseRepository,
  ) : super(const PaginationStateTest.loading());

  Future<void> emitGetAllTruckRecords({
    bool loadMore = false,
  }) async {
    if (loadMore) {
      if (lastPage != null && currentPage > lastPage!) return;
      currentPage++;
    } else {
      currentPage = initialPage;
      emit(const PaginationStateTest.loading());
    }

    var response = await _employeeBaseRepository.getAllTruckRecordPaginated(currentPage);
    response.fold(
      (l) {
        if (kDebugMode) {
          print(l);
        }
        emit(PaginationStateTest.error(l));
      },
      (r) {
        if (r.data != null) {
          lastPage = r.data!.lastPage;
          _addIncomingDataToClassMemberData(loadMore, r);
          emit(PaginationStateTest.success(
            data: _truckRecords.where((element) => element != null).cast<TruckRecordPaginatedEntity>().toList(),
            canLoadMore: currentPage,
          ));
        }
      },
    );
  }

  void _addIncomingDataToClassMemberData(bool loadMore, BasePaginationEntity<PaginationEntity<TruckRecordPaginatedEntity?>> model) {
    if (loadMore) {
      _truckRecords.addAll(model.data!.data);
    } else {
      _truckRecords = model.data!.data;
    }
  }
}
