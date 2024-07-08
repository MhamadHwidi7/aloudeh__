// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_receipts_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllReceiptsEntity _$GetAllReceiptsEntityFromJson(
        Map<String, dynamic> json) =>
    GetAllReceiptsEntity(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ReceiptData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllReceiptsEntityToJson(
        GetAllReceiptsEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

ReceiptData _$ReceiptDataFromJson(Map<String, dynamic> json) => ReceiptData(
      id: (json['id'] as num).toInt(),
      sourceId: (json['source_id'] as num).toInt(),
      destinationId: (json['destination_id'] as num).toInt(),
      manifestId: (json['manifest_id'] as num?)?.toInt(),
      sender: json['sender'] as String,
      receiver: json['receiver'] as String,
      senderNumber: json['sender_number'] as String,
      receiverNumber: json['receiver_number'] as String,
      number: (json['number'] as num).toInt(),
      priceId: (json['price_id'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      size: json['size'] as String,
      content: json['content'] as String,
      marks: json['marks'] as String,
      notes: json['notes'] as String?,
      shippingCost: json['shipping_cost'] as String,
      againstShipping: json['against_shipping'] as String?,
      adapter: json['adapter'] as String?,
      advance: json['advance'] as String?,
      miscellaneous: json['miscellaneous'] as String?,
      prepaid: json['prepaid'] as String?,
      discount: json['discount'] as String?,
      collection: json['collection'] as String?,
      manifestNumber: json['manifest_number'] as String,
    );

Map<String, dynamic> _$ReceiptDataToJson(ReceiptData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'source_id': instance.sourceId,
      'destination_id': instance.destinationId,
      'manifest_id': instance.manifestId,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'sender_number': instance.senderNumber,
      'receiver_number': instance.receiverNumber,
      'number': instance.number,
      'price_id': instance.priceId,
      'weight': instance.weight,
      'size': instance.size,
      'content': instance.content,
      'marks': instance.marks,
      'notes': instance.notes,
      'shipping_cost': instance.shippingCost,
      'against_shipping': instance.againstShipping,
      'adapter': instance.adapter,
      'advance': instance.advance,
      'miscellaneous': instance.miscellaneous,
      'prepaid': instance.prepaid,
      'discount': instance.discount,
      'collection': instance.collection,
      'manifest_number': instance.manifestNumber,
    };
