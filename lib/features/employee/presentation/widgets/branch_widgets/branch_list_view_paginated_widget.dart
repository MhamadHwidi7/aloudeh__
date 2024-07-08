import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global_states/pagination_shared_state.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/branch_widgets/branch_item_tile_widget.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_all_branches_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_branches_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BranchesListViewPaginatedWidget extends StatefulWidget {
  const BranchesListViewPaginatedWidget({super.key});

  @override
  _BranchesListViewPaginatedWidgetState createState() => _BranchesListViewPaginatedWidgetState();
}

class _BranchesListViewPaginatedWidgetState extends State<BranchesListViewPaginatedWidget> {
  late GetAllBranchsPaginatedSharedCubit cubit;
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    cubit = context.read<GetAllBranchsPaginatedSharedCubit>();
    cubit.emitGetAllBranches();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    // cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<GetAllBranchsPaginatedSharedCubit, PaginationSharedState<GetAllBranchesPaginatedSharedEntity>>(
      listener: (context, state) {
        state.whenOrNull(
          error: (NetworkExceptions exception) {
            Fluttertoast.showToast(
              msg: NetworkExceptions.getErrorMessage(exception),
              toastLength: Toast.LENGTH_SHORT,
            );
          },
          success: (data, canLoadMore) {
               if (canLoadMore == cubit.lastPage) {
                        _refreshController.loadNoData();
                      } else {
                        _refreshController.loadComplete();
                      }},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CupertinoActivityIndicator()),
          success: (customers, canLoadMore) {
            return SmartRefresher(
              enablePullDown: true,
              controller: _refreshController,
              onRefresh: () => cubit.emitGetAllBranches(),
              onLoading: () => cubit.emitGetAllBranches(loadMore: true),
              enablePullUp: canLoadMore != 0,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  GetAllBranchesPaginatedSharedEntity branchesPaginatedEntity = customers[index];
                  return BranchItemTileWidget(branchName: branchesPaginatedEntity.branchAddress, branchId: branchesPaginatedEntity.branchId,);
                },
                separatorBuilder: (context, index) =>  SizedBox(height: 10.h,),
                itemCount: customers.length,
              ),
            );
          },
          orElse: () => const Center(child: Text('No Branches available')),
        );
      },
    );
  }
}