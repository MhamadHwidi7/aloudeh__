import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_pagination_entity.g.dart';

@JsonSerializable(genericArgumentFactories: true, includeIfNull: false)
class BasePaginationEntity<T> {
  BasePaginationEntity({
    required this.success,
    required this.data,
    this.message,
  });

  factory BasePaginationEntity.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) =>
      _$BasePaginationEntityFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BasePaginationEntityToJson(this, toJsonT);
  bool success;
  T? data;
  String? message;
}
