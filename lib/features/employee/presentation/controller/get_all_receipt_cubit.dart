import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/employee/data/entity/get_all_receipts_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/get_all_receipt_params.dart';
import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllReceiptCubit extends Cubit<GetState<GetAllReceiptsEntity>> {
 final EmployeeBaseRepository _employeeBaseRepository;
  GetAllReceiptCubit(
    this._employeeBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetTripsInfo({required GetAllReceiptParams getAllReceiptParams}) async {
    emit(const GetState.loading());
    final response = await _employeeBaseRepository.getAllReceipt(getAllReceiptParams:  getAllReceiptParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    
    });
  }}
