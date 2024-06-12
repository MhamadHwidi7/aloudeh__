import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/driver/data/entity/get_branch_location_entity.dart';
import 'package:aloudeh_company/features/driver/data/params/get_branch_location_params.dart';
import 'package:aloudeh_company/features/driver/data/repository/driver_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBranchLocationCubit extends Cubit<GetState<GetBranchLocationEntity>> {
 final DriverBaseRepository _driverBaseRepository;
  GetBranchLocationCubit(
    this._driverBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetBranchLocation({required GetBranchLocationParams getBranchLocationParams}) async {
    emit(const GetState.loading());
    final response = await _driverBaseRepository.getBranchLocation(getBranchLocationParams:  getBranchLocationParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    
    });
  }}

