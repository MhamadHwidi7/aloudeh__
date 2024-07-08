import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/core/global_states/pagination_shared_state.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/trip_list_screen.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_truck_information_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/truck_record_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/params/truck_information_params.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_truck_record_paginted_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_truck_information_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/features/employee/presentation/widgets/trips_widget/sizing_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class TruckListScreen extends StatelessWidget {
  const TruckListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(screenHeight),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Align(
        alignment: Alignment.centerRight,
        child: TruckListTitle(),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.chevron_left,
          color: AppColors.darkBlue,
        ),
      ),
      bottom:  PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: DividerItem(),
      ),
    );
  }

  Widget buildBody(double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight / 75),
        const TruckListIntroText(),
        const DividerBetweenListElements(),
        const TruckListSearchBar(),
        SizedBox(height: screenHeight / 75),
         DividerItem(),
        const Expanded(child: TruckListView()),
      ],
    );
  }
}

class TruckListTitle extends StatelessWidget {
  const TruckListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Tru',
            style: TextStyle(
              fontSize: 23.sp,
              fontFamily: 'ScriptMT',
              color: AppColors.yellow,
            ),
          ),
          TextSpan(
            text: 'cks L',
            style: TextStyle(
              fontSize: 23.sp,
              fontFamily: 'ScriptMT',
              color: AppColors.darkBlue,
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

class TruckListIntroText extends StatelessWidget {
  const TruckListIntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello!',
            style: TextStyle(
              color: AppColors.yellow,
              fontFamily: 'bahnschrift',
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Here we will show our trucks list.',
            style: TextStyle(
              color: AppColors.darkBlue,
              fontFamily: 'bahnschrift',
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class TruckListSearchBar extends StatelessWidget {
  const TruckListSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 45.h,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                cursorColor: AppColors.darkBlue,
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: AppColors.lightBlue,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColors.darkBlue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColors.darkBlue),
                  ),
                  prefixIcon: Icon(Icons.search, color: AppColors.darkBlue),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: AppColors.darkBlue,
                    fontFamily: 'bahnschrift',
                  ),
                ),
              ),
            ),
            SizedBox(width: screenWidth / 50),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.tune, color: AppColors.darkBlue),
              elevation: 0.0,
              backgroundColor: AppColors.lightBlue,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: AppColors.darkBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TruckListView extends StatefulWidget {
  const TruckListView({super.key});

  @override
  State<TruckListView> createState() => _TruckListViewState();
}

class _TruckListViewState extends State<TruckListView> {
  late GetAllTruckRecordPaginatedSharedCubit cubit;
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    cubit = context.read<GetAllTruckRecordPaginatedSharedCubit>();
    cubit.emitGetAllTruckRecord();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllTruckRecordPaginatedSharedCubit, PaginationSharedState<TruckRecordPaginatedSharedEntity>>(
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
          success: (trucks, canLoadMore) => buildTruckList(trucks, canLoadMore),
          orElse: () => const Center(child: Text('No trucks available')),
        );
      },
    );
  }

  Widget buildTruckList(List<TruckRecordPaginatedSharedEntity> trucks, int canLoadMore) {
    return SmartRefresher(
      enablePullDown: true,
      controller: _refreshController,
      onRefresh: () => cubit.emitGetAllTruckRecord(),
      onLoading: () => cubit.emitGetAllTruckRecord(loadMore: true),
      enablePullUp: canLoadMore != 0,
      child: ListView.separated(
        itemBuilder: (context, index) {
          TruckRecordPaginatedSharedEntity truck = trucks[index];
          return TruckListItem(truckRecord: truck);
        },
        separatorBuilder: (context, index) =>  DividerItem(),
        itemCount: trucks.length,
      ),
    );
  }
}

class TruckListItem extends StatelessWidget {
  final TruckRecordPaginatedSharedEntity truckRecord;

  const TruckListItem({super.key, required this.truckRecord});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              truckRecord.line,
              style: TextStyle(
                color: AppColors.darkBlue,
                fontFamily: 'bahnschrift',
                fontSize: 16.sp,
              ),
            ),
          ),
          Expanded(
            child: Text(
              truckRecord.number.toString(),
              style: TextStyle(
                color: AppColors.darkBlue,
                fontFamily: 'bahnschrift',
                fontSize: 16.sp,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TruckDetailsScreen(truckNumber: truckRecord.number),
                ),
              );
            },
            child: Text(
              'View',
              style: TextStyle(
                color: AppColors.yellow,
                fontFamily: 'bahnschrift',
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TruckDetailsScreen extends StatefulWidget {
  final int truckNumber;

  const TruckDetailsScreen({super.key, required this.truckNumber});

  @override
  State<TruckDetailsScreen> createState() => _TruckDetailsScreenState();
}

class _TruckDetailsScreenState extends State<TruckDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetTruckInformationSharedCubit>().emitGetTruckInformation(
      truckInformationSharedParams: TruckInformationSharedParams(truckNumber: widget.truckNumber.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Align(
        alignment: Alignment.centerRight,
        child: TruckDetailsTitle(),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.chevron_left,
          color: AppColors.darkBlue,
        ),
      ),
      bottom:  PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: DividerItem(),
      ),
    );
  }

  Widget buildBody() {
    return BlocConsumer<GetTruckInformationSharedCubit, GetState<GetTruckInformationSharedEntity>>(
      listener: (context, state) {
        state.whenOrNull(
          error: (NetworkExceptions exception) {
            Fluttertoast.showToast(
              msg: NetworkExceptions.getErrorMessage(exception),
              toastLength: Toast.LENGTH_SHORT,
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CupertinoActivityIndicator()),
          success: (data) => buildTruckDetails(data),
          orElse: () => const Center(child: Text('No trucks available')),
        );
      },
    );
  }

  Widget buildTruckDetails(GetTruckInformationSharedEntity data) {
    return Column(
      children: [
         SpaceItem(),
        TruckDetailsInfo(truckInformation: data),
         DividerItem(),
         SpaceItem(),
         const TripDetailsHeader(),
         SpaceItem(),
        Expanded(child: buildTripsList(data)),
      ],
    );
  }

  Widget buildTripsList(GetTruckInformationSharedEntity data) {
    if (data.data.trips.isEmpty || data.data.drivers.isEmpty) {
      return const SizedBox();
    }

    final itemCount = data.data.trips.length < data.data.drivers.length 
        ? data.data.trips.length 
        : data.data.drivers.length;

    return ListView.separated(
      itemBuilder: (context, index) {
        final trip = data.data.trips[index];
        final driver = data.data.drivers[index];
        return buildTripItem(trip, driver);
      },
      separatorBuilder: (context, index) =>  SpaceItem(),
      itemCount: itemCount,
    );
  }

  Widget buildTripItem(Trip trip, Driver driver) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        margin: EdgeInsets.symmetric(horizontal: 20.0.w),
        decoration: BoxDecoration(
          color: AppColors.lightBlue,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.r),
            topRight: Radius.circular(50.r),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                trip.number,
                style: TextStyle(
                  color: AppColors.pureBlack,
                  fontFamily: 'bahnschrift',
                  fontSize: 16.sp,
                ),
              ),
            ),
            Expanded(
              child: Text(
                driver.name,
                style: TextStyle(
                  color: AppColors.pureBlack,
                  fontFamily: 'bahnschrift',
                  fontSize: 16.sp,
                ),
              ),
            ),
            Expanded(
              child: Text(
                trip.date,
                style: TextStyle(
                  color: AppColors.pureBlack,
                  fontFamily: 'bahnschrift',
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TruckDetailsTitle extends StatelessWidget {
  const TruckDetailsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Tru',
            style: TextStyle(
              fontSize: 23.sp,
              fontFamily: 'ScriptMT',
              color: AppColors.yellow,
            ),
          ),
          TextSpan(
            text: 'ck Infor',
            style: TextStyle(
              fontSize: 23.sp,
              fontFamily: 'ScriptMT',
              color: AppColors.darkBlue,
            ),
          ),
          TextSpan(
            text: 'mation',
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

class TruckDetailsInfo extends StatelessWidget {
  final GetTruckInformationSharedEntity truckInformation;

  const TruckDetailsInfo({super.key, required this.truckInformation});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          buildInfoRow('ID', truckInformation.data.number.toString(), screenWidth / 5.5),
           SpaceItem(),
          buildInfoRow('Line', truckInformation.data.line, screenWidth / 7),
           SpaceItem(),
          buildInfoRow('Created By', truckInformation.data.createdBy, screenWidth / 10),
           SpaceItem(),
          buildInfoRow('Last Edited By', truckInformation.data.editingBy ?? " - ", screenWidth / 16),
           SpaceItem(),
          buildInfoRow('Last Edited Date', truckInformation.data.editingDate ?? " - ", screenWidth / 10),
           SpaceItem(),
        ],
      ),
    );
  }

  Widget buildInfoRow(String label, String value, double spacing) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'bahnschrift',
            color: AppColors.darkBlue,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(width: spacing),
        Expanded(
          child: Container(
            height: 40.h,
            decoration: BoxDecoration(
 color: AppColors.mediumBlue,
                borderRadius: BorderRadius.circular(10.0),            ),
            child: Center(
              child: Text(
                value,
                style: TextStyle(
                  fontFamily: 'bahnschrift',
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TripDetailsHeader extends StatelessWidget {
  const TripDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          buildHeaderCell('Trip'),
          buildHeaderCell('Driver'),
          buildHeaderCell('Date'),
        ],
      ),
    );
  }

Widget buildHeaderCell(String text) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 10.w),
        
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.yellow,
            fontFamily: 'bahnschrift',
            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
          ),
        ),
      ),
    );
  }}

