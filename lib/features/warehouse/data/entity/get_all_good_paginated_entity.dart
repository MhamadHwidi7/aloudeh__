import 'package:json_annotation/json_annotation.dart';

part 'get_all_good_paginated_entity.g.dart';
@JsonSerializable()
class GetAllGoodPaginatedEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'warehouse_id')
  final int warehouseId;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'quantity')
  final int quantity;

  @JsonKey(name: 'weight')
  final int weight;

  @JsonKey(name: 'size')
  final String size;

  @JsonKey(name: 'content')
  final String content;

  @JsonKey(name: 'marks')
  final String marks;

  @JsonKey(name: 'truck')
  final String truck;

  @JsonKey(name: 'driver')
  final String driver;

  @JsonKey(name: 'destination')
  final String destination;

  @JsonKey(name: 'ship_date')
  final String shipDate;

  @JsonKey(name: 'date')
  final String date;

  @JsonKey(name: 'sender')
  final String sender;

  @JsonKey(name: 'receiver')
  final String receiver;

  @JsonKey(name: 'barcode')
  final String barcode;

  // @JsonKey(name: 'received')
  // final int received;

  GetAllGoodPaginatedEntity({
    required this.id,
    required this.warehouseId,
    required this.type,
    required this.quantity,
    required this.weight,
    required this.size,
    required this.content,
    required this.marks,
    required this.truck,
    required this.driver,
    required this.destination,
    required this.shipDate,
    required this.date,
    required this.sender,
    required this.receiver,
    required this.barcode,
    // required this.received,
  });

  factory GetAllGoodPaginatedEntity.fromJson(Map<String, dynamic> json) =>
      _$GetAllGoodPaginatedEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllGoodPaginatedEntityToJson(this);
}
