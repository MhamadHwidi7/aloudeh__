import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global_states/pagination_state.dart';
import 'package:aloudeh_company/features/driver/data/entity/my_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/get_all_my_trips_paginated_cubit.dart';

class TripsScreen extends StatefulWidget {
  @override
  _TripsScreenState createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  late GetAllMyTripsPaginatedCubit cubit;
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    cubit = context.read<GetAllMyTripsPaginatedCubit>();
    cubit.emitGetAllMyTrips();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: Text(
          'My Trips',
          style: TextStyle(color: AppColors.yellow),
        ),
      ),
      body: Container(
        color: AppColors.lightBlue,
        child: BlocConsumer<GetAllMyTripsPaginatedCubit, PaginationState<MyTripsPaginatedEntity>>(
          listener: (context, state) {
            state.whenOrNull(
              error: (NetworkExceptions exception) => Fluttertoast.showToast(
                msg: NetworkExceptions.getErrorMessage(exception),
                toastLength: Toast.LENGTH_SHORT,
              ),
              success: (data, canLoadMore) {
                _refreshController.refreshCompleted();
                if (!canLoadMore) {
                  _refreshController.loadNoData();
                } else {
                  _refreshController.loadComplete();
                }
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => Center(child: CircularProgressIndicator()),
              success: (trips, canLoadMore) {
                return SmartRefresher(
                  controller: _refreshController,
                  onRefresh: () => cubit.emitGetAllMyTrips(),
                  onLoading: () => cubit.emitGetAllMyTrips(loadMore: true),
                  enablePullUp: canLoadMore,
                  child: ListView.builder(
                    itemCount: trips.length,
                    itemBuilder: (context, index) {
                      MyTripsPaginatedEntity trip = trips[index];
                      return Card(
                        color: AppColors.pureWhite,
                        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(16.w),
                          leading: Icon(
                            Icons.directions_bus,
                            color: AppColors.darkBlue,
                          ),
                          title: Text(
                            trip.number,
                            style: TextStyle(
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          subtitle: Text(
                            trip.date,
                            style: TextStyle(
                              color: AppColors.mediumBlue,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              orElse: () => Center(child: Text('No trips available')),
            );
          },
        ),
      ),
    );
  }
}
