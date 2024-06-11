import 'package:freezed_annotation/freezed_annotation.dart';

import '../error/network_exceptions.dart';

part 'pagination_state.freezed.dart';

@freezed
class PaginationState<T> with _$PaginationState<T> {
  const factory PaginationState.loading() = Loading<T>;

  const factory PaginationState.success( {required List<T> data, required bool canLoadMore}) =
      Success<T>;

  const factory PaginationState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
