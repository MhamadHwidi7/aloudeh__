import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/archive_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/pagination_state_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';

@injectable
class GetAllArchiveTripsPaginatedCubit extends Cubit<PaginationStateTest<ArchiveTripsPaginatedEntity>> {
  final EmployeeBaseRepository _employeeBaseRepository;
  int currentPage = 1;
  int? lastPage;
  List<ArchiveTripsPaginatedEntity?> _trips = [];

  GetAllArchiveTripsPaginatedCubit(
    this._employeeBaseRepository,
  ) : super(const PaginationStateTest.loading());

  Future<void> emitGetAllArchiveTrips({
    bool loadMore = false,
  }) async {
    if (loadMore) {
      if (lastPage != null && currentPage > lastPage!) return;
      currentPage++;
    } else {
      currentPage = 1;
      emit(const PaginationStateTest.loading());
    }

    var response = await _employeeBaseRepository.getAllArchiveTrips(currentPage);
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
          emit(PaginationStateTest.success(data: _trips.where((element) => element != null).cast<ArchiveTripsPaginatedEntity>().toList(), canLoadMore: currentPage));
        }
      },
    );
  }

  void _addIncomingDataToClassMemberData(bool loadMore, BasePaginationEntity<PaginationEntity<ArchiveTripsPaginatedEntity?>> model) {
    if (loadMore) {
      _trips.addAll(model.data!.data);
    } else {
      _trips = model.data!.data;
    }
  }
}
