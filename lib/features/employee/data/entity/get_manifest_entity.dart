import 'package:json_annotation/json_annotation.dart';

part 'get_manifest_entity.g.dart';

@JsonSerializable()
class GetManifestEntity {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'data')
  final ManifestData data;

  GetManifestEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetManifestEntity.fromJson(Map<String, dynamic> json) =>
      _$GetManifestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetManifestEntityToJson(this);
}

@JsonSerializable()
class ManifestData {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'number')
  final String number;

  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'general_total')
  final String generalTotal;

  @JsonKey(name: 'discount')
  final String? discount;

  @JsonKey(name: 'net_total')
  final String? netTotal;

  @JsonKey(name: 'misc_paid')
  final String? miscPaid;

  @JsonKey(name: 'against_shipping')
  final String? againstShipping;

  @JsonKey(name: 'adapter')
  final String? adapter;

  @JsonKey(name: 'advance')
  final String? advance;

  @JsonKey(name: 'collection')
  final String? collection;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'trip_id')
  final int tripId;

  @JsonKey(name: 'shippings')
  final List<ShippingData> shippings;

  ManifestData({
    required this.id,
    required this.number,
    required this.status,
    required this.generalTotal,
    this.discount,
    this.netTotal,
    this.miscPaid,
    this.againstShipping,
    this.adapter,
    this.advance,
    this.collection,
    required this.createdAt,
    required this.updatedAt,
    required this.tripId,
    required this.shippings,
  });

  factory ManifestData.fromJson(Map<String, dynamic> json) =>
      _$ManifestDataFromJson(json);

  Map<String, dynamic> toJson() => _$ManifestDataToJson(this);
}

@JsonSerializable()
class ShippingData {
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

  ShippingData({
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

  factory ShippingData.fromJson(Map<String, dynamic> json) =>
      _$ShippingDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingDataToJson(this);
}
