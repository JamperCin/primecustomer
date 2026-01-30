import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggestion.freezed.dart';
part 'suggestion.g.dart';

@freezed
class Suggestion with _$Suggestion {
  const factory Suggestion({
    @Default('') String placeId,
    @Default('') String description,
    @Default('') String address,
    @Default(0.0) double latitude,
    @Default(0.0) double longitude,
  }) = _Suggestion;

  factory Suggestion.fromJson(Map<String, dynamic> json) =>
      _$SuggestionFromJson(json);
}
