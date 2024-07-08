import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/features/shared/data/repository/shared_repository.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/get_all_good_paginated_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/pagination_state_test.dart';

@injectable
class GetAllGoodsPaginatedSharedCubit extends Cubit<PaginationStateTest<GetAllGoodPaginatedEntity>> {
  final SharedBaseRepository _sharedBaseRepository;
  int currentPage = 1;
  int? lastPage;
  List<GetAllGoodPaginatedEntity?> _goods = [];
  bool canLoadMoreData = true;

  GetAllGoodsPaginatedSharedCubit(this._sharedBaseRepository)
      : super(const PaginationStateTest.loading());

  Future<void> emitGetAllGoods({
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

    var response = await _sharedBaseRepository.getAllGoodPaginated(currentPage);
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
            data: _goods.where((element) => element != null).cast<GetAllGoodPaginatedEntity>().toList(),
            canLoadMore: currentPage,
          ));
        }
      },
    );
  }

  void _addIncomingDataToClassMemberData(
      bool loadMore, BasePaginationEntity<PaginationEntity<GetAllGoodPaginatedEntity?>> model) {
    if (loadMore) {
      _goods.addAll(model.data!.data);
    } else {
      _goods = model.data!.data;
    }
  }
}
