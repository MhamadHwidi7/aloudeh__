import 'package:freezed_annotation/freezed_annotation.dart';

import '../error/network_exceptions.dart';

part 'get_state.freezed.dart';

@freezed
class GetState<T> with _$GetState<T> {
  const factory GetState.loading() = Loading<T>;

  const factory GetState.success(T data) = Success<T>;

  const factory GetState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
