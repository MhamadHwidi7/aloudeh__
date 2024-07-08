import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/shared/data/entity/get_branch_details_entity.dart';
import 'package:aloudeh_company/features/shared/data/params/get_branch_details_params.dart';
import 'package:aloudeh_company/features/shared/data/repository/shared_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBranchDetailsSharedCubit extends Cubit<GetState<GetBranchDetailSharedEntity>> {
 final SharedBaseRepository _sharedBaseRepository;

  GetBranchDetailsSharedCubit(
    this._sharedBaseRepository,
  ) : super(const GetState.loading());

  Future<void> emitGetBranchDetails({required GetBranchDetailsSharedParams getBranchDetailsSharedParams}) async {
    emit(const GetState.loading());
    final response = await _sharedBaseRepository.getBranchDetails(getBranchDetailsSharedParams:getBranchDetailsSharedParams);
    response.fold((l) => emit(GetState.error(l)), (r) async {
      emit(GetState.success(r));
    });
  }}
