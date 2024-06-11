import 'package:aloudeh_company/core/global_states/pagination_state.dart';
import 'package:aloudeh_company/features/employee/data/entity/active_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';

const initialPage = 1;

@injectable
class GetAllActiveTripsPaginatedCubit extends Cubit<PaginationState<ActiveTripsPaginatedEntity>> {
  final EmployeeBaseRepository _employeeBaseRepository;
  int currentPage = initialPage;
  bool canLoadMoreData = true;

  GetAllActiveTripsPaginatedCubit(
    this._employeeBaseRepository,
  ) : super(const PaginationState.loading());

  Future<void> emitGetAllBranches({
    bool loadMore = false,
  }) async {
    if (!canLoadMoreData) {
      return;
    }

    var response = await _employeeBaseRepository.getAllActiveTrips();
    response.fold(
      (l) {
            if (kDebugMode) {
          print(l);
        }
        emit(PaginationState.error(l));



      },
       (r) {
        if (r.data != null) {
          var dataList = r.data!.data.where((element) => element != null).cast<ActiveTripsPaginatedEntity>().toList();
          canLoadMoreData = r.data!.lastPage != null &&
              r.data!.currentPage! < r.data!.lastPage!;

          currentPage++;
          emit(
            PaginationState.success(
              canLoadMore: canLoadMoreData,
              data: state.maybeWhen(
                orElse: () => [...dataList],
                success: (sys, canLoadMore) => [...sys, ...dataList],
              ),
            ),
          );
        }},
    );
  }
}
