// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseNotificationEntity _$BaseNotificationEntityFromJson(
        Map<String, dynamic> json) =>
    BaseNotificationEntity(
      data: (json['notifications'] as List<dynamic>)
          .map((e) => NotificationEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BaseNotificationEntityToJson(
        BaseNotificationEntity instance) =>
    <String, dynamic>{
      'notifications': instance.data,
    };

NotificationEntity _$NotificationEntityFromJson(Map<String, dynamic> json) =>
    NotificationEntity(
      id: (json['id'] as num).toInt(),
      branchManagerId: (json['branch_manager_id'] as num?)?.toInt(),
      warehouseManagerId: (json['warehouse_manager_id'] as num?)?.toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      type: json['type'] as String,
      isRead: (json['is_read'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$NotificationEntityToJson(NotificationEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_manager_id': instance.branchManagerId,
      'warehouse_manager_id': instance.warehouseManagerId,
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'is_read': instance.isRead,
      'status': instance.status,
    };
