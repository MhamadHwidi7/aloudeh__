import 'package:json_annotation/json_annotation.dart';

part 'get_all_receipts_entity.g.dart';

@JsonSerializable()
class GetAllReceiptsEntity {
  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'data')
  final List<ReceiptData> data;

  GetAllReceiptsEntity({
    required this.message,
    required this.data,
  });

  factory GetAllReceiptsEntity.fromJson(Map<String, dynamic> json) =>
      _$GetAllReceiptsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllReceiptsEntityToJson(this);
}

@JsonSerializable()
class ReceiptData {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'source_id')
  final int sourceId;

  @JsonKey(name: 'destination_id')
  final int destinationId;

  @JsonKey(name: 'manifest_id')
  final int? manifestId;

  @JsonKey(name: 'sender')
  final String sender;

  @JsonKey(name: 'receiver')
  final String receiver;

  @JsonKey(name: 'sender_number')
  final String senderNumber;

  @JsonKey(name: 'receiver_number')
  final String receiverNumber;

  @JsonKey(name: 'number')
  final int number;

  @JsonKey(name: 'price_id')
  final int priceId;

  @JsonKey(name: 'weight')
  final int weight;

  @JsonKey(name: 'size')
  final String size;

  @JsonKey(name: 'content')
  final String content;

  @JsonKey(name: 'marks')
  final String marks;

  @JsonKey(name: 'notes')
  final String? notes;

  @JsonKey(name: 'shipping_cost')
  final String shippingCost;

  @JsonKey(name: 'against_shipping')
  final String? againstShipping;

  @JsonKey(name: 'adapter')
  final String? adapter;

  @JsonKey(name: 'advance')
  final String? advance;

  @JsonKey(name: 'miscellaneous')
  final String? miscellaneous;

  @JsonKey(name: 'prepaid')
  final String? prepaid;

  @JsonKey(name: 'discount')
  final String? discount;

  @JsonKey(name: 'collection')
  final String? collection;

  @JsonKey(name: 'manifest_number')
  final String manifestNumber;

  ReceiptData({
    required this.id,
    required this.sourceId,
    required this.destinationId,
    this.manifestId,
    required this.sender,
    required this.receiver,
    required this.senderNumber,
    required this.receiverNumber,
    required this.number,
    required this.priceId,
    required this.weight,
    required this.size,
    required this.content,
    required this.marks,
    this.notes,
    required this.shippingCost,
    this.againstShipping,
    this.adapter,
    this.advance,
    this.miscellaneous,
    this.prepaid,
    this.discount,
    this.collection,
    required this.manifestNumber,
  });

  factory ReceiptData.fromJson(Map<String, dynamic> json) =>
      _$ReceiptDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiptDataToJson(this);
}
