// import 'package:aloudeh_company/core/global_states/get_state.dart';
// import 'package:aloudeh_company/features/employee/data/entity/get_branch_by_id_entity.dart';
// import 'package:aloudeh_company/features/employee/data/params/get_branch_by_id_params.dart';
// import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';

// @injectable
// class GetBranchByIdEmployeeCubit extends Cubit<GetState<GetBranchByIdEntity>> {
//  final EmployeeBaseRepository _employeeBaseRepository;
//   GetBranchByIdEmployeeCubit(
//     this._employeeBaseRepository,
//   ) : super(const GetState.loading());

//   Future<void> emitGetBranchById({required GetBranchByIdParams getBranchByIdParams}) async {
//     emit(const GetState.loading());
//     final response = await _employeeBaseRepository.getBranchById(getBranchByIdParams);
//     response.fold((l) => emit(GetState.error(l)), (r) async {
//       emit(GetState.success(r));
    
//     });
//   }}

