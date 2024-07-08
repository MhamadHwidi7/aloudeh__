import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/core/global_states/pagination_shared_state.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/employee/data/params/add_trip_params.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/add_trip_cubit.dart';
import 'package:aloudeh_company/features/shared/data/entity/driver_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_all_branches_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/data/entity/truck_record_paginated_entity.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_active_trips_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_branches_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_drivers_cubit.dart';
import 'package:aloudeh_company/features/shared/presentation/controllers/get_all_truck_record_paginted_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class BranchDropdown extends StatefulWidget {
  final ValueChanged<GetAllBranchesPaginatedSharedEntity> onChanged;
  final GetAllBranchesPaginatedSharedEntity? selectedValue;

  const BranchDropdown({
    super.key, 
    required this.onChanged,
    required this.selectedValue,
  });

  @override
  _BranchDropdownState createState() => _BranchDropdownState();
}

class _BranchDropdownState extends State<BranchDropdown> {
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
    super.dispose();
  }

  void _showDropdown(BuildContext context) {
    cubit.emitGetAllBranches();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: BlocConsumer<GetAllBranchsPaginatedSharedCubit, PaginationSharedState<GetAllBranchesPaginatedSharedEntity>>(
            listener: (context, state) {
              state.whenOrNull(
                error: (exception) {
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
                loading: () => const Center(child: CupertinoActivityIndicator()),
                success: (data, canLoadMore) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: SmartRefresher(
                      enablePullDown: true,
                      enablePullUp: canLoadMore != 0,
                      controller: _refreshController,
                      onRefresh: () => cubit.emitGetAllBranches(),
                      onLoading: () => cubit.emitGetAllBranches(loadMore: true),
                      child: ListView.separated(
                        itemCount: data.length,
                        separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey[300]),
                        itemBuilder: (context, index) {
                          GetAllBranchesPaginatedSharedEntity branch = data[index];
                          return ListTile(
                            title: Text(
                              branch.branchDesk.toString(),
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'bahnschrift',
                              ),
                            ),
                            onTap: () {
                              widget.onChanged(branch);
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropdown(context),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.mediumBlue),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedValue?.branchDesk.toString() ?? 'Select Branch',
              style: const TextStyle(
                color: AppColors.darkBlue,
                fontSize: 16,
                fontFamily: 'bahnschrift',
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: AppColors.darkBlue),
          ],
        ),
      ),
    );
  }
}
class DestinationDropdown extends StatefulWidget {
  final ValueChanged<GetAllBranchesPaginatedSharedEntity> onChanged;
  final GetAllBranchesPaginatedSharedEntity? selectedValue;

  DestinationDropdown({
    required this.onChanged,
    required this.selectedValue,
  });

  @override
  _DestinationDropdownState createState() => _DestinationDropdownState();
}

class _DestinationDropdownState extends State<DestinationDropdown> {
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
    super.dispose();
  }

  void _showDropdown(BuildContext context) {
    cubit.emitGetAllBranches();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: BlocConsumer<GetAllBranchsPaginatedSharedCubit, PaginationSharedState<GetAllBranchesPaginatedSharedEntity>>(
            listener: (context, state) {
              state.whenOrNull(
                error: (exception) {
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
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (data, canLoadMore) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: SmartRefresher(
                      enablePullDown: true,
                      enablePullUp: canLoadMore != 0,
                      controller: _refreshController,
                      onRefresh: () => cubit.emitGetAllBranches(),
                      onLoading: () => cubit.emitGetAllBranches(loadMore: true),
                      child: ListView.separated(
                        itemCount: data.length,
                        separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey[300]),
                        itemBuilder: (context, index) {
                          GetAllBranchesPaginatedSharedEntity branch = data[index];
                          return ListTile(
                            title: Text(
                              branch.branchDesk.toString(),
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'bahnschrift',
                              ),
                            ),
                            onTap: () {
                              widget.onChanged(branch);
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropdown(context),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.mediumBlue),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedValue?.branchDesk.toString() ?? 'Select Destination',
              style: const TextStyle(
                color: AppColors.darkBlue,
                fontSize: 16,
                fontFamily: 'bahnschrift',
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: AppColors.darkBlue),
          ],
        ),
      ),
    );
  }
}
class TruckDropdown extends StatefulWidget {
  final ValueChanged<TruckRecordPaginatedSharedEntity> onChanged;
  final TruckRecordPaginatedSharedEntity? selectedValue;

  TruckDropdown({
    required this.onChanged,
    required this.selectedValue,
  });

  @override
  _TruckDropdownState createState() => _TruckDropdownState();
}

class _TruckDropdownState extends State<TruckDropdown> {
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

  void _showDropdown(BuildContext context) {
    cubit.emitGetAllTruckRecord();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: BlocConsumer<GetAllTruckRecordPaginatedSharedCubit, PaginationSharedState<TruckRecordPaginatedSharedEntity>>(
            listener: (context, state) {
              state.whenOrNull(
                error: (exception) {
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
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (data, canLoadMore) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: SmartRefresher(
                      enablePullDown: true,
                      enablePullUp: canLoadMore != 0,
                      controller: _refreshController,
                      onRefresh: () => cubit.emitGetAllTruckRecord(),
                      onLoading: () => cubit.emitGetAllTruckRecord(loadMore: true),
                      child: ListView.separated(
                        itemCount: data.length,
                        separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey[300]),
                        itemBuilder: (context, index) {
                          TruckRecordPaginatedSharedEntity truckRecord = data[index];
                          return ListTile(
                            title: Text(
                              truckRecord.number.toString(),
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'bahnschrift',
                              ),
                            ),
                            onTap: () {
                              widget.onChanged(truckRecord);
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropdown(context),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.mediumBlue),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedValue?.number.toString() ?? 'Select Truck',
              style: const TextStyle(
                color: AppColors.darkBlue,
                fontSize: 16,
                fontFamily: 'bahnschrift',
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: AppColors.darkBlue),
          ],
        ),
      ),
    );
  }
}

class DriverDropdown extends StatefulWidget {
  final ValueChanged<DriverEntity> onChanged;
  final DriverEntity? selectedValue;

  DriverDropdown({
    required this.onChanged,
    required this.selectedValue,
  });

  @override
  _DriverDropdownState createState() => _DriverDropdownState();
}

class _DriverDropdownState extends State<DriverDropdown> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllDriversSharedCubit>().emitGetAllDrivers();
  }

  void _showDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: BlocConsumer<GetAllDriversSharedCubit, GetState<BaseDriverSharedEntity>>(
            listener: (context, state) {
              state.whenOrNull(
                error: (networkExceptions) => Fluttertoast.showToast(
                  msg: NetworkExceptions.getErrorMessage(networkExceptions),
                  toastLength: Toast.LENGTH_SHORT,
                ),
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const Center(child: Text("No data available")),
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (data) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    child: ListView.separated(
                      itemCount: data.data.length,
                      separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey[300]),
                      itemBuilder: (context, index) {
                        DriverEntity driver = data.data[index];
                        return ListTile(
                          title: Text(
                            driver.name,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'bahnschrift',
                            ),
                          ),
                          onTap: () {
                            widget.onChanged(driver);
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropdown(context),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.mediumBlue),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedValue?.name ?? 'Select Driver',
              style: const TextStyle(
                color: AppColors.darkBlue,
                fontSize: 16,
                fontFamily: 'bahnschrift',
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: AppColors.darkBlue),
          ],
        ),
      ),
    );
  }
}
class AddTripScreen extends StatefulWidget {
  const AddTripScreen({super.key});

  @override
  _AddTripScreenState createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  GetAllBranchesPaginatedSharedEntity? selectedBranch;
  GetAllBranchesPaginatedSharedEntity? selectedDestination;
  TruckRecordPaginatedSharedEntity? selectedTruck;
  DriverEntity? selectedDriver;

  void _validateAndSubmit() {
    if (selectedBranch == null ||
        selectedDestination == null ||
        selectedTruck == null ||
        selectedDriver == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Validation Error'),
            content: const Text('Please select all required fields.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      context.read<AddTripCubit>().emitAddTrip(
            addTripParams: AddTripParams(
              branchId: selectedBranch!.branchId.toString(),
              destinationId: selectedDestination!.branchId.toString(),
              truckId: selectedTruck!.id.toString(),
              driverId: selectedDriver!.id.toString(),
            ),
          );
    }
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: buildRichTextTitle(),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.chevron_left,
          color: AppColors.darkBlue,
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(height: 1, color: AppColors.darkBlue),
      ),
    ),
    body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BranchDropdown(
                  selectedValue: selectedBranch,
                  onChanged: (value) {
                    setState(() {
                      selectedBranch = value;
                    });
                  },
                ),
                SizedBox(height: 20.h),
                DestinationDropdown(
                  selectedValue: selectedDestination,
                  onChanged: (value) {
                    setState(() {
                      selectedDestination = value;
                    });
                  },
                ),
                SizedBox(height: 20.h),
                TruckDropdown(
                  selectedValue: selectedTruck,
                  onChanged: (value) {
                    setState(() {
                      selectedTruck = value;
                    });
                  },
                ),
                SizedBox(height: 20.h),
                DriverDropdown(
                  selectedValue: selectedDriver,
                  onChanged: (value) {
                    setState(() {
                      selectedDriver = value;
                    });
                  },
                ),
                SizedBox(
                  height: 90.h,
                ), // Space to prevent overlap with button
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: buildAddTripButton(),
          ),
        ),
      ],
    ),
  );
}

  Widget buildRichTextTitle() {
    return Align(
      alignment: Alignment.centerRight,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'ad',
              style: TextStyle(
                fontSize: 23.sp,
                fontFamily: 'ScriptMT',
                color: AppColors.yellow,
              ),
            ),
            TextSpan(
              text: 'd Tr',
              style: TextStyle(
                fontSize: 23.sp,
                fontFamily: 'ScriptMT',
                color: AppColors.darkBlue,
              ),
            ),
            TextSpan(
              text: 'ip',
              style: TextStyle(
                fontSize: 23.sp,
                fontFamily: 'ScriptMT',
                color: AppColors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAddTripButton() {
    return BlocConsumer<AddTripCubit, PostState<BaseEntity>>(
      listener: (context, state) {
state.whenOrNull(success: (data) {
    context.read<GetAllActiveTripsPaginatedSharedCubit>().emitGetAllActiveTrips();

  Navigator.pop(context);
},
error: (networkExceptions) =>  Fluttertoast.showToast(
      msg: NetworkExceptions.getErrorMessage(networkExceptions),
      toastLength: Toast.LENGTH_SHORT,
    ),
);
        },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => Container(
            width: double.infinity,
            child: FloatingActionButton(
              onPressed: _validateAndSubmit,
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
          ),
          loading: () => const Center(child: CupertinoActivityIndicator()),
        );
      },
    );
  }
}