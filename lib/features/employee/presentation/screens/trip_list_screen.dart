import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/pagination_shared_state.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/employee/data/params/cancel_trip_params.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/cancel_trip_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/active_trip_record_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/add_trip_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/archive_trip_record_screen.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/trips_search_screen.dart';
import 'package:aloudeh_company/features/shared/data/entity/active_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/archive_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/close_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_active_trips_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_archive_trips_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_closed_trips_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// Main screen with tabs for effective and archived trips
class TripsListForEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          title: Align(
            alignment: Alignment.centerRight,
            child: TripsListText(),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left,
              color: AppColors.yellow,
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.unarchive), text: "Effective"),
                            Tab(icon: Icon(Icons.close), text: "Closed"),

              Tab(icon: Icon(Icons.archive), text: "Archived"),
            ],
            unselectedLabelColor: AppColors.mediumBlue,
          ),
        ),
        body: TabBarView(
          children: [
            EffectiveTripsScreen(),
                        ClosedTripsScreen(),

            ArchivedTripsScreen(),
          ],
        ),
      ),
    );
  }
}

// Text for the app bar title
class TripsListText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Tri',
            style: TextStyle(
              fontSize: 23.sp,
              fontFamily: 'ScriptMT',
              color: AppColors.yellow,
            ),
          ),
          TextSpan(
            text: 'ps l',
            style: TextStyle(
              fontSize: 23.sp,
              fontFamily: 'ScriptMT',
              color: AppColors.mediumBlue,
            ),
          ),
          TextSpan(
            text: 'ist',
            style: TextStyle(
              fontSize: 23.sp,
              fontFamily: 'ScriptMT',
              color: AppColors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}

// Screen for effective trips
class EffectiveTripsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpaceItem(),
        TripSearchButton(),
        SpaceItem(),
        DividerItem(),
        Expanded(
          child: EffectiveTripsList(),
        ),
        AddTripButton(),
      ],
    );
  }
}

class ClosedTripsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpaceItem(),
        TripSearchButton(),
        SpaceItem(),
        DividerItem(),
        Expanded(
          child: ClosedTripsList(),
        ),
        AddTripButton(),
      ],
    );
  }
}

// Screen for archived trips
class ArchivedTripsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpaceItem(),
        TripSearchButton(),
        SpaceItem(),
        DividerItem(),
        Expanded(
          child: ArchivedTripsList(),
        ),
      ],
    );
  }
}

// Search button used in both screens
class TripSearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return TripsSearchScreen();
          },
          backgroundColor: AppColors.pureWhite,
        );
      },
      child: Container(
        height: 40.h,
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: AppColors.lightBlue,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color: AppColors.darkBlue,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: AppColors.darkBlue,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              'Search',
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 17.sp,
                fontFamily: 'Bauhaus',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClosedTripsList extends StatefulWidget {
  @override
  _ClosedTripsListState createState() => _ClosedTripsListState();
}

class _ClosedTripsListState extends State<ClosedTripsList> {
  late GetAllClosedTripsPaginatedSharedCubit cubit;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    cubit = context.read<GetAllClosedTripsPaginatedSharedCubit>();
    cubit.emitGetAllClosedTrips();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    // cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllClosedTripsPaginatedSharedCubit,
        PaginationSharedState<ClosedTripsPaginatedSharedEntity>>(
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
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (trips, canLoadMore) {
            return SmartRefresher(
              enablePullDown: true,
              controller: _refreshController,
              onRefresh: () => cubit.emitGetAllClosedTrips(),
              onLoading: () => cubit.emitGetAllClosedTrips(loadMore: true),
              enablePullUp: canLoadMore != 0,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  ClosedTripsPaginatedSharedEntity trip = trips[index];
                  return ClosedTripItem(trip: trip, tripType: 'Closed');
                },
                separatorBuilder: (context, index) => DividerItem(),
                itemCount: trips.length,
              ),
            );
          },
          orElse: () => const Center(child: Text('No trips available')),
        );
      },
    );
  }
}


// Effective trips list with pagination
class EffectiveTripsList extends StatefulWidget {
  @override
  _EffectiveTripsListState createState() => _EffectiveTripsListState();
}

class _EffectiveTripsListState extends State<EffectiveTripsList> {
  late GetAllActiveTripsPaginatedSharedCubit cubit;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    cubit = context.read<GetAllActiveTripsPaginatedSharedCubit>();
    cubit.emitGetAllActiveTrips();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    // cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllActiveTripsPaginatedSharedCubit,
        PaginationSharedState<ActiveTripsPaginatedSharedEntity>>(
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
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (trips, canLoadMore) {
            return SmartRefresher(
              enablePullDown: true,
              controller: _refreshController,
              onRefresh: () => cubit.emitGetAllActiveTrips(),
              onLoading: () => cubit.emitGetAllActiveTrips(loadMore: true),
              enablePullUp: canLoadMore != 0,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  ActiveTripsPaginatedSharedEntity trip = trips[index];
                  return ActiveTripItem(trip: trip, tripType: 'effective');
                },
                separatorBuilder: (context, index) => DividerItem(),
                itemCount: trips.length,
              ),
            );
          },
          orElse: () => const Center(child: Text('No trips available')),
        );
      },
    );
  }
}

// Archived trips list with pagination
class ArchivedTripsList extends StatefulWidget {
  @override
  _ArchivedTripsListState createState() => _ArchivedTripsListState();
}

class _ArchivedTripsListState extends State<ArchivedTripsList> {
  late GetAllArchiveTripsPaginatedSharedCubit cubit;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    cubit = context.read<GetAllArchiveTripsPaginatedSharedCubit>();
    cubit.emitGetAllArchiveTrips();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    // cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllArchiveTripsPaginatedSharedCubit,
        PaginationSharedState<ArchiveTripsPaginatedSharedEntity>>(
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
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (trips, canLoadMore) {
            return SmartRefresher(
              enablePullDown: true,
              controller: _refreshController,
              onRefresh: () => cubit.emitGetAllArchiveTrips(),
              onLoading: () => cubit.emitGetAllArchiveTrips(loadMore: true),
              enablePullUp: canLoadMore != 0,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  ArchiveTripsPaginatedSharedEntity trip = trips[index];
                  return TripItem(trip: trip, tripType: 'archived');
                },
                separatorBuilder: (context, index) => DividerItem(),
                itemCount: trips.length,
              ),
            );
          },
          orElse: () => const Center(child: Text('No trips available')),
        );
      },
    );
  }
}
class ClosedTripItem extends StatelessWidget {
  final ClosedTripsPaginatedSharedEntity trip;
  final String tripType;

  const ClosedTripItem({required this.trip, required this.tripType});

  void _deleteTrip(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) {
        return BlocConsumer<CancelTripCubit, PostState<BaseEntity>>(
          listener: (ctx, state) {
            state.whenOrNull(
              success: (data) {
                Navigator.pop(context);

                context
                    .read<GetAllActiveTripsPaginatedSharedCubit>()
                    .emitGetAllActiveTrips();
              },
              error: (NetworkExceptions error) {
                Fluttertoast.showToast(
                  msg:NetworkExceptions.getErrorMessage(error),
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
            );
          },
          builder: (context, state) {
            return CupertinoAlertDialog(
              title: Text(
                "Cancel Trip",
                style: TextStyle(
                  fontFamily: 'Bahnschrift',
                  color: AppColors.darkBlue,
                  fontSize: 16.sp,
                ),
              ),
              content: Text(
                "Do you want to delete?",
                style: TextStyle(
                  fontFamily: 'Bahnschrift',
                  color: AppColors.darkBlue,
                  fontSize: 14.sp,
                ),
              ),
              actions: [
                CupertinoDialogAction(
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontFamily: 'Bahnschrift',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    print("Delete customer button pressed");
                    context.read<CancelTripCubit>().emitCancelTrip(
                          cancelTripParams: CancelTripParams(tripId: trip.id),
                        );
                  },
                ),
                CupertinoDialogAction(
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontFamily: 'Bahnschrift',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10, 10, 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              trip.number,
              style: TextStyle(
                fontFamily: 'bahnschrift',
                fontWeight: FontWeight.bold,
                color: AppColors.darkBlue,
                fontSize: 16.sp,
              ),
            ),
          ),
          ActionButton(
            text: 'View',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ActiveTripRecordScreen(tripNumber: trip.number,)));
            },
          ),
          // ActionButton(
          //   text: 'Edit',
          //   onPressed: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => EditTripScreen(manifestNumber: trip.number,status: trip.status,destination: trip.destinationName,dateTrip: trip.date,tripId: trip.id.toString(),)));
          //   },
          // ),
          // ActionButton(
          //   text: 'Cancel',
          //   onPressed: () {
          //     _deleteTrip(context);
          //   },
          // ),
        ],
      ),
    );
  }
}

// Trip item widget with conditional buttons
class ActiveTripItem extends StatelessWidget {
  final ActiveTripsPaginatedSharedEntity trip;
  final String tripType;

  const ActiveTripItem({required this.trip, required this.tripType});

  void _deleteTrip(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (ctx) {
        return BlocConsumer<CancelTripCubit, PostState<BaseEntity>>(
          listener: (ctx, state) {
            state.whenOrNull(
              success: (data) {
                Navigator.pop(context);

                context
                    .read<GetAllActiveTripsPaginatedSharedCubit>()
                    .emitGetAllActiveTrips();
              },
              error: (NetworkExceptions error) {
                Fluttertoast.showToast(
                  msg:NetworkExceptions.getErrorMessage(error),
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
            );
          },
          builder: (context, state) {
            return CupertinoAlertDialog(
              title: Text(
                "Cancel Trip",
                style: TextStyle(
                  fontFamily: 'Bahnschrift',
                  color: AppColors.darkBlue,
                  fontSize: 16.sp,
                ),
              ),
              content: Text(
                "Do you want to delete?",
                style: TextStyle(
                  fontFamily: 'Bahnschrift',
                  color: AppColors.darkBlue,
                  fontSize: 14.sp,
                ),
              ),
              actions: [
                CupertinoDialogAction(
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontFamily: 'Bahnschrift',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    print("Delete customer button pressed");
                    context.read<CancelTripCubit>().emitCancelTrip(
                          cancelTripParams: CancelTripParams(tripId: trip.id),
                        );
                  },
                ),
                CupertinoDialogAction(
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontFamily: 'Bahnschrift',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10, 10, 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              trip.number,
              style: TextStyle(
                fontFamily: 'bahnschrift',
                fontWeight: FontWeight.bold,
                color: AppColors.darkBlue,
                fontSize: 16.sp,
              ),
            ),
          ),
          ActionButton(
            text: 'View',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ActiveTripRecordScreen(tripNumber: trip.number,)));
            },
          ),
          // ActionButton(
          //   text: 'Edit',
          //   onPressed: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => EditTripScreen(manifestNumber: trip.number,status: trip.status,destination: trip.destinationName,dateTrip: trip.date,tripId: trip.id.toString(),)));
          //   },
          // ),
          ActionButton(
            text: 'Cancel',
            onPressed: () {
              _deleteTrip(context);
            },
          ),
        ],
      ),
    );
  }
}

// Trip item widget with conditional buttons
class TripItem extends StatelessWidget {
  final ArchiveTripsPaginatedSharedEntity trip;
  final String tripType;

  const TripItem({required this.trip, required this.tripType});

  void _deleteTrip(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Do you want to delete this trip?",
          style: TextStyle(
            fontFamily: 'bahnschrift',
            color: AppColors.darkBlue,
            fontSize: 16.sp,
          ),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Yes',
                style: TextStyle(
                  color: AppColors.yellow,
                  fontFamily: 'bahnschrift',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'No',
                style: TextStyle(
                  color: AppColors.yellow,
                  fontFamily: 'bahnschrift',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10, 10, 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              trip.number,
              style: TextStyle(
                fontFamily: 'bahnschrift',
                fontWeight: FontWeight.bold,
                color: AppColors.darkBlue,
                fontSize: 16.sp,
              ),
            ),
          ),
          if (tripType == 'effective') ...[
            ActionButton(
              text: 'View',
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ViewTripAfterInvoiceEmployee()));
              },
            ),
            ActionButton(
              text: 'Edit',
              onPressed: () {
                // Navigator.push(context,
                //   MaterialPageRoute(builder: (context) => EditTripScreen(manifestNumber: trip.number,status: trip.status,destination: trip.destinationName,)));
              },
            ),
            ActionButton(
              text: 'Delete',
              onPressed: () {
                _deleteTrip(context);
              },
            ),
          ] else if (tripType == 'archived') ...[
            Container(
              height: 35.h,
              decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ArchivedTripRecordScreen(
                                tripNumber: trip.number,
                              )));
                },
                icon: Icon(
                  Icons.remove_red_eye,
                  color: AppColors.darkBlue,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// Reusable action button
class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ActionButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'bahnschrift',
          color: AppColors.darkBlue,
        ),
      ),
    );
  }
}

// Button to add a new trip
class AddTripButton extends StatelessWidget {
  const AddTripButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTripScreen()));
        },
        child: Text(
          'Add Trip',
          style: TextStyle(
            fontFamily: 'bahnschrift',
            fontWeight: FontWeight.bold,
            fontSize: 17.0.sp,
            color: AppColors.mediumBlue,
          ),
        ),
        backgroundColor: AppColors.darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(37.r),
            topLeft: Radius.circular(37.r),
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(37.r),
        color: AppColors.darkBlue,
      ),
    );
  }
}

// Space item widget
class SpaceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight / 50,
    );
  }
}

// Divider item widget
class DividerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.darkBlue,
      height: 1.0,
    );
  }
}
