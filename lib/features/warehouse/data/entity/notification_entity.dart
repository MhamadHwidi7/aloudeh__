import 'package:json_annotation/json_annotation.dart';

part 'notification_entity.g.dart';

@JsonSerializable()
class BaseNotificationEntity {
  @JsonKey(name: 'notifications')
  final List<NotificationEntity> data;


  factory BaseNotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$BaseNotificationEntityFromJson(json);

  BaseNotificationEntity({required this.data});

  Map<String, dynamic> toJson() => _$BaseNotificationEntityToJson(this);
}


@JsonSerializable()
class NotificationEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'branch_manager_id')
  final int? branchManagerId;

  @JsonKey(name: 'warehouse_manager_id')
  final int? warehouseManagerId;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'body')
  final String body;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'is_read')
  final int isRead;

  // @JsonKey(name: 'data')
  // final String? data;

  @JsonKey(name: 'status')
  final String status;

  NotificationEntity({
    required this.id,
    this.branchManagerId,
    this.warehouseManagerId,
    required this.title,
    required this.body,
    required this.type,
    required this.isRead,
    required this.status,
  });

  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationEntityToJson(this);
}
