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
      id: json['id'] as int,
      branchManagerId: json['branch_manager_id'] as int?,
      warehouseManagerId: json['warehouse_manager_id'] as int?,
      title: json['title'] as String,
      body: json['body'] as String,
      type: json['type'] as String,
      isRead: json['is_read'] as int,
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
