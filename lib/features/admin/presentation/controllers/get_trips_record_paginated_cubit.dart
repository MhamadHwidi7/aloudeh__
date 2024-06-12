import 'package:aloudeh_company/core/global_states/pagination_state.dart';
import 'package:aloudeh_company/features/admin/data/entity/get_all_trips_admin_paginated_entity.dart';
import 'package:aloudeh_company/features/admin/data/repository/admin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';

const initialPage = 1;

@injectable
class GetAllTripsRecordPaginatedCubit extends Cubit<PaginationState<GetAllTripsAdminPaginatedEntity>> {
  final AdminBaseRepository _adminBaseRepository;
  int currentPage = initialPage;
  bool canLoadMoreData = true;

  GetAllTripsRecordPaginatedCubit(
    this._adminBaseRepository,
  ) : super(const PaginationState.loading());

  Future<void> emitGetAllTrips({
    bool loadMore = false,
  }) async {
    if (!canLoadMoreData) {
      return;
    }

    var response = await _adminBaseRepository.getAllTrips();
    response.fold(
      (l) {
            if (kDebugMode) {
          print(l);
        }
        emit(PaginationState.error(l));



      },
       (r) {
        if (r.data != null) {
          var dataList = r.data!.data.where((element) => element != null).cast<GetAllTripsAdminPaginatedEntity>().toList();
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
