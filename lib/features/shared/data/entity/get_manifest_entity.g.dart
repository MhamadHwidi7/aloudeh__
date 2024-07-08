// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_manifest_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetManifestSharedEntity _$GetManifestSharedEntityFromJson(
        Map<String, dynamic> json) =>
    GetManifestSharedEntity(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: ManifestData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetManifestSharedEntityToJson(
        GetManifestSharedEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

ManifestData _$ManifestDataFromJson(Map<String, dynamic> json) => ManifestData(
      shippings: (json['shippings'] as List<dynamic>)
          .map((e) => ShippingData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ManifestDataToJson(ManifestData instance) =>
    <String, dynamic>{
      'shippings': instance.shippings,
    };

ShippingData _$ShippingDataFromJson(Map<String, dynamic> json) => ShippingData(
      id: (json['id'] as num).toInt(),
      sourceId: (json['source_id'] as num).toInt(),
      sourceName: json['source_name'] as String,
      destinationId: (json['destination_id'] as num).toInt(),
      destinationName: json['destination_name'] as String,
      manifestId: (json['manifest_id'] as num?)?.toInt(),
      sender: json['sender'] as String,
      receiver: json['receiver'] as String,
      senderNumber: json['sender_number'] as String,
      receiverNumber: json['receiver_number'] as String,
      numOfPackages: (json['num_of_packages'] as num?)?.toInt(),
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

Map<String, dynamic> _$ShippingDataToJson(ShippingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'source_id': instance.sourceId,
      'source_name': instance.sourceName,
      'destination_id': instance.destinationId,
      'destination_name': instance.destinationName,
      'manifest_id': instance.manifestId,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'sender_number': instance.senderNumber,
      'receiver_number': instance.receiverNumber,
      'num_of_packages': instance.numOfPackages,
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
