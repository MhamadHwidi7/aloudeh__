// import 'package:aloudeh_company/core/global_states/get_state.dart';
// import 'package:aloudeh_company/features/employee/data/entity/destination_entity.dart';
// import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';

// @injectable
// class GetAllDestinationCubit extends Cubit<GetState<BaseDestinationEntity>> {
//  final EmployeeBaseRepository _employeeBaseRepository;
//   GetAllDestinationCubit(
//     this._employeeBaseRepository,
//   ) : super(const GetState.loading());

//   Future<void> emitGetAllDestination() async {
//     emit(const GetState.loading());
//     final response = await _employeeBaseRepository.getAllDestination();
//     response.fold((l) => emit(GetState.error(l)), (r) async {
//       emit(GetState.success(r));
    
//     });
//   }}
