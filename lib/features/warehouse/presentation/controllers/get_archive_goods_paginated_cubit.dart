import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/get_all_good_paginated_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/get_archive_goods_paginated_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/repository/warehouse_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/pagination_state_test.dart';

@injectable
class GetArchiveGoodsPaginatedCubit extends Cubit<PaginationStateTest<GetArchiveGoodsPaginatedEntity>> {
  final BaseWarehouseRepository _baseWarehouseRepository;
  int currentPage = 1;
  int? lastPage;
  List<GetArchiveGoodsPaginatedEntity?> _goods = [];
  bool canLoadMoreData = true;

  GetArchiveGoodsPaginatedCubit(this._baseWarehouseRepository)
      : super(const PaginationStateTest.loading());

  Future<void> emitGetArchiveGoods({
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

    var response = await _baseWarehouseRepository.getArchiveGoodPaginated(currentPage);
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
            data: _goods.where((element) => element != null).cast<GetArchiveGoodsPaginatedEntity>().toList(),
            canLoadMore: currentPage,
          ));
        }
      },
    );
  }

  void _addIncomingDataToClassMemberData(
      bool loadMore, BasePaginationEntity<PaginationEntity<GetArchiveGoodsPaginatedEntity?>> model) {
    if (loadMore) {
      _goods.addAll(model.data!.data);
    } else {
      _goods = model.data!.data;
    }
  }
}
