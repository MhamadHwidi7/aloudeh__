import 'package:aloudeh_company/core/global/base_pagination_entity.dart';
import 'package:aloudeh_company/core/global/pagination_entity.dart';
import 'package:aloudeh_company/core/global_states/pagination_shared_state.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_all_branches_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/params/paginated_params.dart';
import 'package:aloudeh_company/features/shared/data/repository/shared_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';

@injectable
class GetAllBranchsPaginatedSharedCubit extends Cubit<PaginationSharedState<GetAllBranchesPaginatedSharedEntity>> {
  final SharedBaseRepository _sharedBaseRepository;
  int currentPage = 1;
  int? lastPage;
  List<GetAllBranchesPaginatedSharedEntity?> _branches = [];
  bool canLoadMoreData = true;

  GetAllBranchsPaginatedSharedCubit(this._sharedBaseRepository)
      : super(const PaginationSharedState.loading());

  Future<void> emitGetAllBranches({
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
    var response = await _sharedBaseRepository.getAllBranches(paginatedParams:params);
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
            data: _branches.where((element) => element != null).cast<GetAllBranchesPaginatedSharedEntity>().toList(),
            canLoadMore: currentPage,
          ));
        }
      },
    );
  }

  void _addIncomingDataToClassMemberData(
      bool loadMore, BasePaginationEntity<PaginationEntity<GetAllBranchesPaginatedSharedEntity?>> model) {
    if (loadMore) {
      _branches.addAll(model.data!.data);
    } else {
      _branches = model.data!.data;
    }
  }
}
