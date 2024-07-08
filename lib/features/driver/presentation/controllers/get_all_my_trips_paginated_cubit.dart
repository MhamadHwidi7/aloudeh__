import 'package:aloudeh_company/core/global_states/pagination_state.dart';
import 'package:aloudeh_company/features/driver/data/entity/my_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/driver/data/repository/driver_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';


import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/core/global_states/pagination_shared_state.dart';
import 'package:aloudeh_company/features/shared/data/entity/archive_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/params/paginated_params.dart';
import 'package:aloudeh_company/features/shared/data/repository/shared_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';

@injectable
class GetAllMyTripsPaginatedCubit extends Cubit<PaginationSharedState<MyTripsPaginatedEntity>> {
  final DriverBaseRepository _driverBaseRepository;
  int currentPage = 1;
  int? lastPage;
  List<MyTripsPaginatedEntity?> _trips = [];
  bool canLoadMoreData = true;

  GetAllMyTripsPaginatedCubit(this._driverBaseRepository)
      : super(const PaginationSharedState.loading());

  Future<void> emitGetAllTrips({
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
    var response = await _driverBaseRepository.getAllMyTrips(params);
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
            data: _trips.where((element) => element != null).cast<MyTripsPaginatedEntity>().toList(),
            canLoadMore: currentPage,
          ));
        }
      },
    );
  }

  void _addIncomingDataToClassMemberData(
      bool loadMore, BasePaginationEntity<PaginationEntity<MyTripsPaginatedEntity?>> model) {
    if (loadMore) {
      _trips.addAll(model.data!.data);
    } else {
      _trips = model.data!.data;
    }
  }
}
