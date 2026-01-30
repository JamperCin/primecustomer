
import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel extends BaseObject with _$NotificationModel {
  const factory NotificationModel({
    @Default(0) int id,
    @Default("") String title,
    @Default("") String body,
    @Default("") String sender,
    @Default("") String emoji,
    @Default("") String type,
    @Default(false) bool read,
    @Default(false) bool hide,
    @Default(false) bool archived,
    @JsonKey(name: "book_marked") @Default(false) bool bookMarked,
    @JsonKey(name: "created_at") @Default("") String createdAt,
    @JsonKey(name: "updated_at") @Default("") String updatedAt,
    Map<String, dynamic>? meta,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
