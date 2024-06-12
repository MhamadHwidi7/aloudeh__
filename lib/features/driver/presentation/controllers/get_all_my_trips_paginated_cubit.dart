import 'package:aloudeh_company/core/global_states/pagination_state.dart';
import 'package:aloudeh_company/features/driver/data/entity/my_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/driver/data/repository/driver_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';

const initialPage = 1;

@injectable
class GetAllMyTripsPaginatedCubit extends Cubit<PaginationState<MyTripsPaginatedEntity>> {
  final DriverBaseRepository _driverBaseRepository;
  int currentPage = initialPage;
  bool canLoadMoreData = true;

  GetAllMyTripsPaginatedCubit(
    this._driverBaseRepository,
  ) : super(const PaginationState.loading());

  Future<void> emitGetAllMyTrips({
    bool loadMore = false,
  }) async {
    if (!canLoadMoreData) {
      return;
    }

    var response = await _driverBaseRepository.getAllMyTrips(currentPage);
    response.fold(
      (l) {
            if (kDebugMode) {
          print(l);
        }
        emit(PaginationState.error(l));



      },
       (r) {
        if (r.data != null) {
          var dataList = r.data!.data.where((element) => element != null).cast<MyTripsPaginatedEntity>().toList();
          canLoadMoreData = r.data!.lastPage != null &&
              r.data!.currentPage! < r.data!.lastPage!;

          currentPage++;
          print(currentPage);
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
