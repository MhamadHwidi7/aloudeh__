import 'package:json_annotation/json_annotation.dart';

part 'log_in_warehouse_entity.g.dart';

@JsonSerializable()
class LogInWarehouseEntity{
  final String token;

  LogInWarehouseEntity({required this.token});


  factory LogInWarehouseEntity.fromJson(Map<String, dynamic> json) =>
      _$LogInWarehouseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LogInWarehouseEntityToJson(this);
}