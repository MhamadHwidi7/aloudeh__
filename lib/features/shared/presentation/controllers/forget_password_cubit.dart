import 'package:aloudeh_company/core/global/base_entity.dart';
import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/shared/data/params/forget_password_params.dart';
import 'package:aloudeh_company/features/shared/data/repository/shared_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordSharedCubit extends Cubit<PostState<BaseEntity>> {
 final SharedBaseRepository _sharedBaseRepository;

  ForgetPasswordSharedCubit(
    this._sharedBaseRepository,
  ) : super(const PostState.idle());

  Future<void> emitForgetPassword({required ForgetPasswordSharedParams forgetPasswordSharedParams}) async {
    emit(const PostState.loading());
    final response = await _sharedBaseRepository.forgetPassword(forgetPasswordSharedParams:forgetPasswordSharedParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    });
  }}
