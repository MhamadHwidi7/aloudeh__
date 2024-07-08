import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/driver/data/params/edit_profile_params.dart';
import 'package:aloudeh_company/features/driver/data/repository/driver_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditDriverProfileCubit extends Cubit<PostState<BaseEntity>> {
 final DriverBaseRepository _driverBaseRepository;

  EditDriverProfileCubit(
    this._driverBaseRepository,
  ) : super(const PostState.idle());

  Future<void> emitEditDriverProfile({required EditDriverProfileParams editDriverProfileParams}) async {
    emit(const PostState.loading());
    final response = await _driverBaseRepository.editDriverProfile(editDriverProfileParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    
    });
  }}
