import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_model.freezed.dart';
part 'feedback_model.g.dart';

@freezed
class FeedbackModel with _$FeedbackModel {
  // const FeedbackModel._();
  const factory FeedbackModel({
    @Default(0) int id,
    @Default('') String message,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @Default(false) bool like,
    @Default('') String emoji,
  }) = _FeedbackModel;

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);

  // RxBool get likeRx => like.obs;
  // RxString get messageRx => message.obs;
  // RxString get createdAtRx => createdAt.obs;
  // RxString get emojiRx => emoji.obs;
}
