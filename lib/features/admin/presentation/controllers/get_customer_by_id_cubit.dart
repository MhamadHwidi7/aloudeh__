import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/admin/data/entity/get_customer_entity.dart';
import 'package:aloudeh_company/features/admin/data/params/get_customer_by_id_params.dart';
import 'package:aloudeh_company/features/admin/data/repository/admin_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCustomerByIdCubit extends Cubit<PostState<GetCustomerAdminEntity>> {
 final AdminBaseRepository _adminBaseRepository;
  GetCustomerByIdCubit(
    this._adminBaseRepository,
  ) : super(const PostState.idle());

  Future<void> emitGetCustomerById({required GetCustomerByIdParams getCustomerByIdParams}) async {
    emit(const PostState.loading());
    final response = await _adminBaseRepository.getCustomerById(getCustomerByIdParams:  getCustomerByIdParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    
    });
  }}
