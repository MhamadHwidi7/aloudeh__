// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_pagination_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePaginationEntity<T> _$BasePaginationEntityFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BasePaginationEntity<T>(
      success: json['success'] as bool,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BasePaginationEntityToJson<T>(
  BasePaginationEntity<T> instance,
  Object? Function(T value) toJsonT,
) {
  final val = <String, dynamic>{
    'success': instance.success,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', _$nullableGenericToJson(instance.data, toJsonT));
  writeNotNull('message', instance.message);
  return val;
}

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
