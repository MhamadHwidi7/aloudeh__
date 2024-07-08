import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/core/global_states/pagination_shared_state.dart';
import 'package:aloudeh_company/features/shared/data/entity/close_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/params/paginated_params.dart';
import 'package:aloudeh_company/features/shared/data/repository/shared_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';

@injectable
class GetAllClosedTripsPaginatedSharedCubit extends Cubit<PaginationSharedState<ClosedTripsPaginatedSharedEntity>> {
  final SharedBaseRepository _sharedBaseRepository;
  int currentPage = 1;
  int? lastPage;
  List<ClosedTripsPaginatedSharedEntity?> _trips = [];
  bool canLoadMoreData = true;

  GetAllClosedTripsPaginatedSharedCubit(this._sharedBaseRepository)
      : super(const PaginationSharedState.loading());

  Future<void> emitGetAllClosedTrips({
    bool loadMore = false,
  }) async {
    if (!canLoadMoreData) {
      return;
    }



    if (loadMore) {
      if (lastPage != null && currentPage >= lastPage!) return;
      currentPage++;
    } else {
      currentPage = 1;
      emit(const PaginationSharedState.loading());
    }
   final params = PaginatedParams(page: currentPage);
    var response = await _sharedBaseRepository.getAllClosedTrips(paginatedParams:params);
    response.fold(
      (l) {
        if (kDebugMode) {
          print(l);
        }
        emit(PaginationSharedState.error(l));
      },
      (r) {
        if (r.data != null) {
          lastPage = r.data!.lastPage;
          _addIncomingDataToClassMemberData(loadMore, r);
          emit(PaginationSharedState.success(
            data: _trips.where((element) => element != null).cast<ClosedTripsPaginatedSharedEntity>().toList(),
            canLoadMore: currentPage,
          ));
        }
      },
    );
  }

  void _addIncomingDataToClassMemberData(
      bool loadMore, BasePaginationEntity<PaginationEntity<ClosedTripsPaginatedSharedEntity?>> model) {
    if (loadMore) {
      _trips.addAll(model.data!.data);
    } else {
      _trips = model.data!.data;
    }
  }
}
