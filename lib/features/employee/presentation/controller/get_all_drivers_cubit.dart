// import 'package:aloudeh_company/core/global_states/get_state.dart';
// import 'package:aloudeh_company/features/employee/data/entity/get_all_drivers_entity.dart';
// import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';

// @injectable
// class GetAllDriversCubit extends Cubit<GetState<BaseDriverEntity>> {
//  final EmployeeBaseRepository _employeeBaseRepository;
//   GetAllDriversCubit(
//     this._employeeBaseRepository,
//   ) : super(const GetState.loading());

//   Future<void> emitGetAllDriver() async {
//     emit(const GetState.loading());
//     final response = await _employeeBaseRepository.getAllDrivers();
//     response.fold((l) => emit(GetState.error(l)), (r) async {
//       emit(GetState.success(r));
    
//     });
//   }}
