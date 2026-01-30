import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    @Default(0) int id,
    @Default('') String ask,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    int? index,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
