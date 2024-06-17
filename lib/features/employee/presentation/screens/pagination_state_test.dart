import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'pagination_state_test.freezed.dart';

@freezed
class PaginationStateTest<T> with _$PaginationStateTest<T> {
  const factory PaginationStateTest.loading() = Loading<T>;

  const factory PaginationStateTest.success( {required List<T> data, required int canLoadMore}) =
      Success<T>;

  const factory PaginationStateTest.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
