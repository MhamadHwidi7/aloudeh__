import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/core/global_states/pagination_shared_state.dart';
import 'package:aloudeh_company/features/shared/data/entity/shipping_type_entity.dart';
import 'package:aloudeh_company/features/shared/data/params/paginated_params.dart';
import 'package:aloudeh_company/features/shared/data/repository/shared_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';

@injectable
class GetShippingPricesPaginatedSharedCubit extends Cubit<PaginationSharedState<TypePaginatedSharedEntity>> {
  final SharedBaseRepository _sharedBaseRepository;
  int currentPage = 1;
  int? lastPage;
  List<TypePaginatedSharedEntity?> _prices = [];
  bool canLoadMoreData = true;

  GetShippingPricesPaginatedSharedCubit(this._sharedBaseRepository)
      : super(const PaginationSharedState.loading());

  Future<void> emitGetAllShippingPrices({
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
    var response = await _sharedBaseRepository.shippingPriceList(paginatedParams:params);
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
            data: _prices.where((element) => element != null).cast<TypePaginatedSharedEntity>().toList(),
            canLoadMore: currentPage,
          ));
        }
      },
    );
  }

  void _addIncomingDataToClassMemberData(
      bool loadMore, BasePaginationEntity<PaginationEntity<TypePaginatedSharedEntity?>> model) {
    if (loadMore) {
      _prices.addAll(model.data!.data);
    } else {
      _prices = model.data!.data;
    }
  }
}
