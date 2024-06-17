import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/pagination_state_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';
import 'package:aloudeh_company/features/admin/data/entity/get_all_active_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/admin/data/repository/admin_repository.dart';


@injectable
class GetAllActiveTripsPaginatedCubit extends Cubit<PaginationStateTest<ActiveTripsPaginatedAdminEntity>> {
  final AdminBaseRepository _adminBaseRepository;
  int currentPage = 1;
  int? lastPage;
  List<ActiveTripsPaginatedAdminEntity?> _trips = [];
  bool canLoadMoreData = true;

  GetAllActiveTripsPaginatedCubit(this._adminBaseRepository)
      : super(const PaginationStateTest.loading());

  Future<void> emitGetAllActiveTrips({
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
      emit(const PaginationStateTest.loading());
    }

    var response = await _adminBaseRepository.getAllActiveTrips(currentPage);
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
                  emit(PaginationStateTest.success(data: _trips.where((element) => element != null).cast<ActiveTripsPaginatedAdminEntity>().toList(), canLoadMore: currentPage));

        }
      },
    );
  }

  void _addIncomingDataToClassMemberData(
      bool loadMore, BasePaginationEntity<PaginationEntity<ActiveTripsPaginatedAdminEntity?>> model) {
    if (loadMore) {
      _trips.addAll(model.data!.data);
    } else {
      _trips = model.data!.data;
    }
  }
}
