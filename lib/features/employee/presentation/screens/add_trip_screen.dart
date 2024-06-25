import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/admin/data/entity/get_all_branches_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/destination_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_all_drivers_entity.dart';
import 'package:aloudeh_company/features/employee/data/entity/truck_record_paginated_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/add_trip_params.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/add_trip_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_active_trips_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_branches_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_destination_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_drivers_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_trips_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/controller/get_all_truck_record_paginated_cubit.dart';
import 'package:aloudeh_company/features/employee/presentation/screens/pagination_state_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BranchDropdown extends StatefulWidget {
  final ValueChanged<GetAllBranchesPaginatedEntity> onChanged;
  final GetAllBranchesPaginatedEntity? selectedValue;

  BranchDropdown({
    required this.onChanged,
    required this.selectedValue,
  });

  @override
  _BranchDropdownState createState() => _BranchDropdownState();
}

class _BranchDropdownState extends State<BranchDropdown> {
  late GetAllBranchesPaginatedCubit cubit;
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    cubit = context.read<GetAllBranchesPaginatedCubit>();
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
          child: BlocConsumer<GetAllBranchesPaginatedCubit, PaginationStateTest<GetAllBranchesPaginatedEntity>>(
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
                orElse: () => Center(child: Text("No data available")),
                loading: () => Center(child: CircularProgressIndicator()),
                success: (data, canLoadMore) {
                  return SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: canLoadMore != 0,
                    controller: _refreshController,
                    onRefresh: () => cubit.emitGetAllBranches(),
                    onLoading: () => cubit.emitGetAllBranches(loadMore: true),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        GetAllBranchesPaginatedEntity branch = data[index];
                        return ListTile(
                          title: Text(branch.branchDesk.toString()),
                          onTap: () {
                            widget.onChanged(branch);
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
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedValue?.branchDesk.toString() ?? 'Select Branch',
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 16,
              ),
            ),
            Icon(Icons.arrow_drop_down, color: AppColors.darkBlue),
          ],
        ),
      ),
    );
  }
}

class DestinationDropdown extends StatefulWidget {
  final ValueChanged<Destination> onChanged;
  final Destination? selectedValue;

  DestinationDropdown({
    required this.onChanged,
    required this.selectedValue,
  });

  @override
  _DestinationDropdownState createState() => _DestinationDropdownState();
}

class _DestinationDropdownState extends State<DestinationDropdown> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllDestinationCubit>().emitGetAllDestination();
  }

  void _showDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: BlocConsumer<GetAllDestinationCubit, GetState<BaseDestinationEntity>>(
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
                orElse: () => Center(child: Text("No data available")),
                loading: () => Center(child: CircularProgressIndicator()),
                success: (data) {
                  return ListView.builder(
                    itemCount: data.data.length,
                    itemBuilder: (context, index) {
                      Destination destination = data.data[index];
                      return ListTile(
                        title: Text(destination.name),
                        onTap: () {
                          widget.onChanged(destination);
                          Navigator.of(context).pop();
                        },
                      );
                    },
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
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedValue?.name ?? 'Select Destination',
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 16,
              ),
            ),
            Icon(Icons.arrow_drop_down, color: AppColors.darkBlue),
          ],
        ),
      ),
    );
  }
}

class TruckDropdown extends StatefulWidget {
  final ValueChanged<TruckRecordPaginatedEntity> onChanged;
  final TruckRecordPaginatedEntity? selectedValue;

  TruckDropdown({
    required this.onChanged,
    required this.selectedValue,
  });

  @override
  _TruckDropdownState createState() => _TruckDropdownState();
}

class _TruckDropdownState extends State<TruckDropdown> {
  late GetAllTruckRecordPaginatedCubit cubit;
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    cubit = context.read<GetAllTruckRecordPaginatedCubit>();
    cubit.emitGetAllTruckRecords();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _showDropdown(BuildContext context) {
    cubit.emitGetAllTruckRecords();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: BlocConsumer<GetAllTruckRecordPaginatedCubit, PaginationStateTest<TruckRecordPaginatedEntity>>(
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
                orElse: () => Center(child: Text("No data available")),
                loading: () => Center(child: CircularProgressIndicator()),
                success: (data, canLoadMore) {
                  return SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: canLoadMore != 0,
                    controller: _refreshController,
                    onRefresh: () => cubit.emitGetAllTruckRecords(),
                    onLoading: () => cubit.emitGetAllTruckRecords(loadMore: true),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        TruckRecordPaginatedEntity truckRecord = data[index];
                        return ListTile(
                          title: Text(truckRecord.number.toString()),
                          onTap: () {
                            widget.onChanged(truckRecord);
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
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedValue?.number.toString() ?? 'Select Truck',
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 16,
              ),
            ),
            Icon(Icons.arrow_drop_down, color: AppColors.darkBlue),
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
    context.read<GetAllDriversCubit>().emitGetAllDriver();
  }

  void _showDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: BlocConsumer<GetAllDriversCubit, GetState<BaseDriverEntity>>(
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
                orElse: () => Center(child: Text("No data available")),
                loading: () => Center(child: CircularProgressIndicator()),
                success: (data) {
                  return ListView.builder(
                    itemCount: data.data.length,
                    itemBuilder: (context, index) {
                      DriverEntity driver = data.data[index];
                      return ListTile(
                        title: Text(driver.name),
                        onTap: () {
                          widget.onChanged(driver);
                          Navigator.of(context).pop();
                        },
                      );
                    },
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
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedValue?.name ?? 'Select Driver',
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 16,
              ),
            ),
            Icon(Icons.arrow_drop_down, color: AppColors.darkBlue),
          ],
        ),
      ),
    );
  }
}

class AddTripScreen extends StatefulWidget {
  @override
  _AddTripScreenState createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  GetAllBranchesPaginatedEntity? selectedBranch;
  Destination? selectedDestination;
  TruckRecordPaginatedEntity? selectedTruck;
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
            title: Text('Validation Error'),
            content: Text('Please select all required fields.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
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
              destinationId: selectedDestination!.id.toString(),
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
          icon: Icon(
            Icons.chevron_left,
            color: AppColors.darkBlue,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(height: 1, color: AppColors.darkBlue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SingleChildScrollView(
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
                      height: 90.h), // Space to prevent overlap with button
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: buildAddTripButton(),
            ),
          ],
        ),
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
    context.read<GetAllActiveTripsPaginatedCubit>().emitGetAllActiveTrips();

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
          loading: () => Center(child: CupertinoActivityIndicator()),
        );
      },
    );
  }
}