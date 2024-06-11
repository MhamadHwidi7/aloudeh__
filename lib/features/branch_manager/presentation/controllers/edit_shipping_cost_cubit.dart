import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/branch_manager/data/params/add_shipping_cost_params.dart';
import 'package:aloudeh_company/features/branch_manager/data/repository/branch_manager_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditShippingCostCubit extends Cubit<PostState<BaseEntity>> {
 final BranchManagerBaseRepository _branchManagerBaseRepository;
  EditShippingCostCubit(
    this._branchManagerBaseRepository,
  ) : super(const PostState.idle());

  Future<void> emitEditShippingCost({required ShippingCostParams editShippingCostParams}) async {
    emit(const PostState.loading());
    final response = await _branchManagerBaseRepository.editShippingCost(editShippingCostParams:editShippingCostParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    
    });
  }}
