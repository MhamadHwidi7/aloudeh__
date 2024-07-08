import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/pagination_state_test.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_paginated_goods_cubit.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/get_all_good_paginated_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/get_archive_goods_paginated_entity.dart';
import 'package:aloudeh_company/features/warehouse/data/params/delete_good_params.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/delete_good_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/get_all_good_paginated_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/get_archive_goods_paginated_cubit.dart';
import 'package:aloudeh_company/features/warehouse/presentation/screens/notification_screen.dart';
import 'package:aloudeh_company/features/warehouse/presentation/screens/profile_screen.dart';
import 'package:aloudeh_company/features/warehouse/presentation/screens/qr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GoodsApp extends StatelessWidget {
  const GoodsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Goods Management',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
          ),
          backgroundColor: AppColors.darkBlue,
          actions: [
                        IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>NotificationScreen()));
                        }, icon: Icon(Icons.notifications,color: Colors.white,))
          ,  SizedBox(width: 12.w),

            GestureDetector(
              onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (_)=>const WarehouseProfileScreen()));

              },
              child: CircleAvatar(
                radius: 14.r,
                backgroundColor: AppColors.lightBlue,
                child: const Icon(Icons.person, color: AppColors.darkBlue),
              ),
            ),
                        SizedBox(width: 8.w),

          ],
          bottom: const TabBar(
            indicatorColor: AppColors.yellow,
            labelColor: AppColors.yellow,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.list_alt), text: 'Goods List'),
              Tab(icon: Icon(Icons.archive), text: 'Archived Goods'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GoodsListScreen(),
            ArchivedGoodsScreen(),
          ],
        ),
      ),
    );
  }
}

class GoodsListScreen extends StatefulWidget {
  @override
  State<GoodsListScreen> createState() => _GoodsListScreenState();
}

class _GoodsListScreenState extends State<GoodsListScreen> {
  late GetAllGoodsPaginatedSharedCubit cubit;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    cubit = context.read<GetAllGoodsPaginatedSharedCubit>();
    cubit.emitGetAllGoods();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    // cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.settings),
          fabSize: ExpandableFabSize.regular,
          shape: const CircleBorder(),
        ),
        children: [
          IconButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>const QRScannerScreen()));

            
          }, icon: const Icon(Icons.adf_scanner_outlined)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const ReceivingGoodScreen()));
              }, icon: const Icon(Icons.qr_code_scanner_rounded)),
          IconButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddGoodBarcodeScannerScreen()));

          }, icon: const Icon(Icons.add)),
          IconButton(onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const GetGoodBarcodeScannerScreen()));

          }, icon: const Icon(Icons.read_more)),
        ],
      ),
      body: BlocConsumer<GetAllGoodsPaginatedSharedCubit,
          PaginationStateTest<GetAllGoodPaginatedEntity>>(
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
              }
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: Text("No data available")),
            loading: () => const Center(
              child: CupertinoActivityIndicator(),
            ),
            success: (data, canLoadMore) => SmartRefresher(
              enablePullDown: true,
              controller: _refreshController,
              onRefresh: () => cubit.emitGetAllGoods(),
              onLoading: () => cubit.emitGetAllGoods(loadMore: true),
              enablePullUp: canLoadMore != 0,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.darkBlue,
                        width: 2,
                      ),
                    ),
                    margin:
                        const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: ListTile(
                      tileColor: AppColors.mediumBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text(
                        'Type: ${item.type}',
                        style: const TextStyle(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quantity: ${item.quantity}',
                            style: const TextStyle(color: AppColors.pureBlack),
                          ),
                          Text(
                            'Destination: ${item.destination}',
                            style: const TextStyle(color: AppColors.pureBlack),
                          ),
                          Text(
                            'Barcode: ${item.barcode}',
                            style: const TextStyle(color: AppColors.yellow),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                          onPressed: () =>
                              _showDeleteDialog(context, index, item),
                          icon: const Icon(Icons.delete)),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _showDeleteDialog(
      BuildContext context, int index, GetAllGoodPaginatedEntity item) {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text('Delete Item', style: TextStyle(color: AppColors.darkBlue)),
        content: Text(
          'Are you sure you want to delete this item ${item.barcode}?',
          style: const TextStyle(color: AppColors.pureBlack),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel', style: TextStyle(color: AppColors.yellow)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          BlocConsumer<DeleteGoodCubit, PostState<BaseEntity>>(
            listener: (context, state) {
              state.whenOrNull(
                error: (NetworkExceptions exception) {
              Fluttertoast.showToast(
                msg: NetworkExceptions.getErrorMessage(exception),
                toastLength: Toast.LENGTH_SHORT,
              );
            },
            success: (data) {

              
              context.read<GetAllGoodsPaginatedCubit>().emitGetAllGoods();
            Navigator.pop(context);
            
            },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(orElse: () => CupertinoDialogAction(
                child: const Text('Delete',
                    style: TextStyle(color: AppColors.pureBlack)),
                onPressed: () {
                  context.read<DeleteGoodCubit>().emitDeleteGood(deleteGoodParams: DeleteGoodParams(barcode: item.barcode));
                },
              ),loading: () => const Center(child: CupertinoActivityIndicator(),),idle: () => CupertinoDialogAction(
                child: const Text('Delete',
                    style: const TextStyle(color: AppColors.pureBlack)),
                onPressed: () {
                                    context.read<DeleteGoodCubit>().emitDeleteGood(deleteGoodParams: DeleteGoodParams(barcode: item.barcode));

                },
              ),);
            },
          ),
        ],
      ),
    );
  }
}

class ArchivedGoodsScreen extends StatefulWidget {
  @override
  State<ArchivedGoodsScreen> createState() => _ArchivedGoodsScreenState();
}

class _ArchivedGoodsScreenState extends State<ArchivedGoodsScreen> {
late GetArchiveGoodsPaginatedCubit cubit;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    cubit = context.read<GetArchiveGoodsPaginatedCubit>();
    cubit.emitGetArchiveGoods();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    // cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.settings),
          fabSize: ExpandableFabSize.regular,
          shape: const CircleBorder(),
        ),
        children: [
           IconButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>const QRScannerScreen()));

            
          }, icon: const Icon(Icons.adf_scanner_outlined)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const ReceivingGoodScreen()));
              }, icon: const Icon(Icons.qr_code_scanner_rounded)),
          IconButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>const AddGoodBarcodeScannerScreen()));

          }, icon: const Icon(Icons.add)),
          IconButton(onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const GetGoodBarcodeScannerScreen()));

          }, icon: const Icon(Icons.read_more)),
        ],
      ),
      body: BlocConsumer<GetArchiveGoodsPaginatedCubit,
          PaginationStateTest<GetArchiveGoodsPaginatedEntity>>(
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
              }
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: Text("No data available")),
            loading: () => const Center(
              child: CupertinoActivityIndicator(),
            ),
            success: (data, canLoadMore) => SmartRefresher(
              enablePullDown: true,
              controller: _refreshController,
              onRefresh: () => cubit.emitGetArchiveGoods(),
              onLoading: () => cubit.emitGetArchiveGoods(loadMore: true),
              enablePullUp: canLoadMore != 0,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.darkBlue,
                        width: 2,
                      ),
                    ),
                    margin:
                        const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: ListTile(
                      tileColor: AppColors.mediumBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text(
                        'Type: ${item.type}',
                        style: const TextStyle(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quantity: ${item.quantity}',
                            style: const TextStyle(color: AppColors.pureBlack),
                          ),
                          Text(
                            'Destination: ${item.destination}',
                            style: const TextStyle(color: AppColors.pureBlack),
                          ),
                          Text(
                            'Barcode: ${item.barcode}',
                            style: const TextStyle(color: AppColors.yellow),
                          ),
                        ],
                      ),
                    
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
