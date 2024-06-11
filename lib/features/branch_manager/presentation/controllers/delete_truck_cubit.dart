import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/delete_truck_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/repository/branch_manager_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteTruckCubit extends Cubit<PostState<BaseEntity>> {
 final BranchManagerBaseRepository _branchManagerBaseRepository;
  DeleteTruckCubit(
    this._branchManagerBaseRepository,
  ) : super(const PostState.idle());

  Future<void> emitDeleteTruck({required DeleteTruckParams deleteTruckParams}) async {
    emit(const PostState.loading());
    final response = await _branchManagerBaseRepository.deleteTruck(deleteTruckParams:deleteTruckParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    
    });
  }}
