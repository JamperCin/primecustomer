// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationModelImpl(
  id: (json['id'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? "",
  body: json['body'] as String? ?? "",
  sender: json['sender'] as String? ?? "",
  emoji: json['emoji'] as String? ?? "",
  type: json['type'] as String? ?? "",
  read: json['read'] as bool? ?? false,
  hide: json['hide'] as bool? ?? false,
  archived: json['archived'] as bool? ?? false,
  bookMarked: json['book_marked'] as bool? ?? false,
  createdAt: json['created_at'] as String? ?? "",
  updatedAt: json['updated_at'] as String? ?? "",
  meta: json['meta'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$NotificationModelImplToJson(
  _$NotificationModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'body': instance.body,
  'sender': instance.sender,
  'emoji': instance.emoji,
  'type': instance.type,
  'read': instance.read,
  'hide': instance.hide,
  'archived': instance.archived,
  'book_marked': instance.bookMarked,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'meta': instance.meta,
};
