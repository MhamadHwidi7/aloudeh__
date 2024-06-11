// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_manifest_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetManifestEntity _$GetManifestEntityFromJson(Map<String, dynamic> json) =>
    GetManifestEntity(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: ManifestData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetManifestEntityToJson(GetManifestEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

ManifestData _$ManifestDataFromJson(Map<String, dynamic> json) => ManifestData(
      id: json['id'] as int,
      number: json['number'] as String,
      status: json['status'] as String,
      generalTotal: json['general_total'] as String,
      discount: json['discount'] as String?,
      netTotal: json['net_total'] as String?,
      miscPaid: json['misc_paid'] as String?,
      againstShipping: json['against_shipping'] as String?,
      adapter: json['adapter'] as String?,
      advance: json['advance'] as String?,
      collection: json['collection'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      tripId: json['trip_id'] as int,
      shippings: (json['shippings'] as List<dynamic>)
          .map((e) => ShippingData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ManifestDataToJson(ManifestData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'status': instance.status,
      'general_total': instance.generalTotal,
      'discount': instance.discount,
      'net_total': instance.netTotal,
      'misc_paid': instance.miscPaid,
      'against_shipping': instance.againstShipping,
      'adapter': instance.adapter,
      'advance': instance.advance,
      'collection': instance.collection,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'trip_id': instance.tripId,
      'shippings': instance.shippings,
    };

ShippingData _$ShippingDataFromJson(Map<String, dynamic> json) => ShippingData(
      id: json['id'] as int,
      sourceId: json['source_id'] as int,
      destinationId: json['destination_id'] as int,
      manifestId: json['manifest_id'] as int?,
      sender: json['sender'] as String,
      receiver: json['receiver'] as String,
      senderNumber: json['sender_number'] as String,
      receiverNumber: json['receiver_number'] as String,
      number: json['number'] as int,
      priceId: json['price_id'] as int,
      weight: json['weight'] as int,
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

Map<String, dynamic> _$ShippingDataToJson(ShippingData instance) =>
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
