import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'post_state.freezed.dart';

@freezed
class PostState<T> with _$PostState<T> {
  const factory PostState.idle() = Idle<T>;

  const factory PostState.loading() = Loading<T>;

  const factory PostState.success(T data) = Success<T>;

  const factory PostState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
