import 'package:aloudeh_company/features/admin/data/params/get_branches_employee_by_id_params.dart';
import 'package:aloudeh_company/features/admin/data/params/get_employee_by_id_params.dart';
import 'package:aloudeh_company/features/admin/data/params/get_warehouse_manager_by_id_params.dart';
import 'package:aloudeh_company/features/admin/data/params/promote_employee_params.dart';
import 'package:aloudeh_company/features/admin/data/params/truck_record_params.dart';
import 'package:aloudeh_company/features/admin/presentation/controllers/get_all_branches_cubit.dart';
import 'package:aloudeh_company/features/admin/presentation/controllers/get_all_warehouses_paginated_cubit.dart';
import 'package:aloudeh_company/features/admin/presentation/controllers/get_branch_employee_cubit.dart';
import 'package:aloudeh_company/features/admin/presentation/controllers/get_employee_by_id_cubit.dart';
import 'package:aloudeh_company/features/admin/presentation/controllers/get_warehouse_manager_by_id_cubit.dart';
import 'package:aloudeh_company/features/admin/presentation/controllers/promote_employee_cubit.dart';
import 'package:aloudeh_company/features/admin/presentation/controllers/truck_record_cubit.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/add_employee_params.dart';
import 'package:aloudeh_company/features/branch_manager/presentation/controllers/add_employee_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoButton(child: Text("ssss"), onPressed: (){
          // context.read<TruckRecordCubit>().emitTruckRecord(truckRecordParams: TruckRecordParams(desk: "homs233s"));
          String id = "1";
        //  context.read<GetEmployeeByIdCubit>().emitGetEmployeeById(getEmployeeByIdParams: GetEmployeeByIdParams(employeeId: int.parse(id)));
                //  context.read<GetBranchEmployeeByIdCubit>().emitGetBranchEmployeeById(getBranchEmployeeByIdParams: GetBranchEmployeeByIdParams(branchId: int.parse(id)));
                //  context.read<GetWarehouseManagerByIdCubit>().emitGetWarehouseManagerById(getWareHouseManagerByIdParams: GetWareHouseManagerByIdParams(warehouseManagerId: int.parse(id)));
                //  context.read<GetAllWarehousesPaginatedCubit>().emitGetAllWarehouses();
                //  context.read<PromoteEmployeeCubit>().emitPromoteEmployee(promoteEmployeeParams: PromoteEmployeeParams(rank: "Branch_manager", employeeId: "14", branchId: "2"));
                 final String name = "John Doe";
  final String address = "123 Main St";
  final String birthDate = "1990-01-01";
  final String birthPlace = "New York";
  final String email = "john.doe@example.com";
  final String phoneNumber = "1234567890";
  final String motherName = "Jane Doe";
  final String gender = "male"; // or "female"
  final String branchId = "2";
  final String mobile = "0987654321";
  final String salary = "50000";
  final String nationalId = "12121212121";
  final String rank = "employee"; // or "manager", "driver", etc.
context.read<AddEmployeeCubit>().emitAddEmployee(
    addEmployeeParams: AddEmployeeParams(
      name: name,
      address: address,
      birthDate: birthDate,
      birthPlace: birthPlace,
      email: email,
      phoneNumber: phoneNumber,
      motherName: motherName,
      gender: gender,
      branchId: branchId,
      mobile: mobile,
      salary: salary,
      rank: rank,
      nationalId:nationalId,
    ),
  );
        }),
      ),
    );
  }
}