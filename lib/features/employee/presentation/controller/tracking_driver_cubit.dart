import 'package:aloudeh_company/core/global_states/post_state.dart';
import 'package:aloudeh_company/features/employee/data/entity/tracking_entity.dart';
import 'package:aloudeh_company/features/employee/data/params/tracking_params.dart';
import 'package:aloudeh_company/features/employee/data/repository/employee_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TrackingDriverCubit extends Cubit<PostState<BaseTrackingEntity>> {
 final EmployeeBaseRepository _employeeBaseRepository;
  TrackingDriverCubit(
    this._employeeBaseRepository,
  ) : super(const PostState.idle());

  Future<void> emitTrackingDriver({required TrackingParams trackingParams}) async {
    emit(const PostState.loading());
    final response = await _employeeBaseRepository.getDriverTracking(trackingParams);
    response.fold((l) => emit(PostState.error(l)), (r) async {
      emit(PostState.success(r));
    
    });
  }}
