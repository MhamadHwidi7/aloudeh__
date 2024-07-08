import 'package:aloudeh_company/core/global_states/pagination_shared_state.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/getx/location_controller.dart';
import 'package:aloudeh_company/features/driver/presentation/screens/driver_profile_screen.dart';
import 'package:aloudeh_company/features/driver/presentation/screens/shortest_path_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global_states/pagination_state.dart';
import 'package:aloudeh_company/features/driver/data/entity/my_trips_paginated_entity.dart';
import 'package:aloudeh_company/features/driver/presentation/controllers/get_all_my_trips_paginated_cubit.dart';

// class DriverTripsScreen extends StatefulWidget {
//   const DriverTripsScreen({super.key});

//   @override
//   _DriverTripsScreenState createState() => _DriverTripsScreenState();
// }

// class _DriverTripsScreenState extends State<DriverTripsScreen> {
//   late GetAllMyTripsPaginatedCubit cubit;
//   final RefreshController _refreshController = RefreshController(initialRefresh: false);
//   final LocationController locationController = Get.put(LocationController());

//   @override
//   void initState() {
//     super.initState();
//     cubit = context.read<GetAllMyTripsPaginatedCubit>();
//     cubit.emitGetAllMyTrips();
//         // locationController.onInit();
// print(locationController.currentLocation);
//   }

//   @override
//   void dispose() {
//     _refreshController.dispose();
//     cubit.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.darkBlue,
//         title: const Text(
//           'My Trips',
//           style: TextStyle(color: AppColors.yellow),
//         ),
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(right: 8.0.w),
//             child: GestureDetector(
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const DriverProfileScreen()),
//               ),
//               child: CircleAvatar(
//                 radius: 18.r,
//                 backgroundColor: AppColors.mediumBlue,
//                 child: Icon(
//                   Icons.person,
//                   color: AppColors.darkBlue,
//                   size: 20.r,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         color: AppColors.lightBlue,
//         child: BlocConsumer<GetAllMyTripsPaginatedCubit, PaginationState<MyTripsPaginatedEntity>>(
//           listener: (context, state) {
//             state.whenOrNull(
//               error: (NetworkExceptions exception) => Fluttertoast.showToast(
//                 msg: NetworkExceptions.getErrorMessage(exception),
//                 toastLength: Toast.LENGTH_SHORT,
//               ),
//               success: (data, canLoadMore) {
//                 if (!canLoadMore) {
//                   _refreshController.loadNoData();
//                 } else {
//                   _refreshController.loadComplete();
//                 }
//                 _refreshController.refreshCompleted();
//               },
//             );
//           },
//           builder: (context, state) {
//             return state.maybeWhen(
//               loading: () => const Center(child: CupertinoActivityIndicator()),
//               success: (trips, canLoadMore) {
//                 return SmartRefresher(
//                   enablePullDown: canLoadMore,
//                   controller: _refreshController,
//                   onRefresh: () => cubit.emitGetAllMyTrips(),
//                   onLoading: () => cubit.emitGetAllMyTrips(loadMore: true),
//                 //!Mark:Check this if works fine 
//                   enablePullUp: canLoadMore,
//                   child: ListView.builder(
//                     itemCount: trips.length,
//                     itemBuilder: (context, index) {
//                       MyTripsPaginatedEntity trip = trips[index];
//                       return _buildTripCard(trip);
//                     },
//                   ),
//                 );
//               },
//               orElse: () => const Center(child: Text('No trips available')),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildTripCard(MyTripsPaginatedEntity trip) {
//     return GestureDetector(
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(builder: (_) => ShortestPathScreen(tripNumber: trip.number,branchId: trip.branchId)),
//       ),
//       child: Card(
//         color: AppColors.pureWhite,
//         margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.r),
//         ),
//         elevation: 5,
//         shadowColor: AppColors.darkBlue.withOpacity(0.3),
//         child: ListTile(
//           contentPadding: EdgeInsets.all(16.w),
//           leading: Container(
//             padding: EdgeInsets.all(10.w),
//             decoration: BoxDecoration(
//               color: AppColors.darkBlue.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(10.r),
//             ),
//             child: Icon(
//               Icons.directions_bus,
//               color: AppColors.darkBlue,
//               size: 28.r,
//             ),
//           ),
//           title: Text(
//             trip.number,
//             style: TextStyle(
//               color: AppColors.darkBlue,
//               fontWeight: FontWeight.bold,
//               fontSize: 18.sp,
//             ),
//           ),
//           subtitle: Text(
//             trip.date,
//             style: TextStyle(
//               color: AppColors.mediumBlue,
//               fontSize: 16.sp,
//             ),
//           ),
//           trailing: Icon(
//             Icons.arrow_forward_ios,
//             color: AppColors.darkBlue,
//             size: 20.r,
//           ),
//         ),
//       ),
//     );
//   }
// }
// class LocationHelper {

//   static Future<Position> getCurrentLocation() async {
//     bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!isServiceEnabled) {
//       await Geolocator.requestPermission();
//     }

//     return await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//   }
// }
class DriverTripsScreen extends StatefulWidget {
  const DriverTripsScreen({super.key});

  @override
  _DriverTripsScreenState createState() => _DriverTripsScreenState();
}

class _DriverTripsScreenState extends State<DriverTripsScreen> {
  late GetAllMyTripsPaginatedCubit cubit;
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  final LocationController locationController = Get.put(LocationController());

  @override
  void initState() {
    super.initState();
    cubit = context.read<GetAllMyTripsPaginatedCubit>();
    cubit.emitGetAllTrips();
    print(locationController.currentLocation);
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
        title: const Text(
          'My Trips',
          style: TextStyle(color: AppColors.yellow),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0.w),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DriverProfileScreen()),
              ),
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor: AppColors.mediumBlue,
                child: Icon(
                  Icons.person,
                  color: AppColors.darkBlue,
                  size: 20.r,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors.lightBlue,
        child: BlocConsumer<GetAllMyTripsPaginatedCubit, PaginationSharedState<MyTripsPaginatedEntity>>(
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
              loading: () => const Center(child: CupertinoActivityIndicator()),
              success: (trips, canLoadMore) {
                return SmartRefresher(
                   enablePullDown: true,
              controller: _refreshController,
              onRefresh: () => cubit.emitGetAllTrips(),
              onLoading: () => cubit.emitGetAllTrips(loadMore: true),
              enablePullUp: canLoadMore != 0,
                  child: ListView.builder(
                    itemCount: trips.length,
                    itemBuilder: (context, index) {
                      MyTripsPaginatedEntity trip = trips[index];
                      return _buildTripCard(trip);
                    },
                  ),
                );
              },
              orElse: () => const Center(child: Text('No trips available')),
            );
          },
        ),
      ),
    );
  }
Widget _buildTripCard(MyTripsPaginatedEntity trip) {
  String status = trip.currentLng == null ? 'Available' : 'On Road';
  Color statusColor = trip.currentLng == null ? Colors.green : Colors.red;

  return GestureDetector(
    onTap: () {
     
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ShortestPathScreen(tripNumber: trip.number, branchId: trip.branchId)),
        );
      
    },
    child: Card(
      color: AppColors.pureWhite,
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      elevation: 8,
      shadowColor: AppColors.darkBlue.withOpacity(0.3),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                Icons.directions_bus,
                color: AppColors.darkBlue,
                size: 28.r,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trip.number,
                    style: TextStyle(
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        color: AppColors.mediumBlue,
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        trip.date,
                        style: TextStyle(
                          color: AppColors.mediumBlue,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          color: statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.darkBlue,
              size: 20.r,
            ),
          ],
        ),
      ),
    ),
  );
}
}

class LocationHelper {
  static Future<Position> getCurrentLocation() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
