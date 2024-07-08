import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'pagination_shared_state.freezed.dart';

@freezed
class PaginationSharedState<T> with _$PaginationSharedState<T> {
  const factory PaginationSharedState.loading() = Loading<T>;

  const factory PaginationSharedState.success( {required List<T> data, required int canLoadMore}) =
      Success<T>;

  const factory PaginationSharedState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
