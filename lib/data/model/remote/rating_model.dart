import 'package:primecustomer/data/model/remote/person.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_model.freezed.dart';
part 'rating_model.g.dart';

@freezed
class RatingModel with _$RatingModel {
  const factory RatingModel({
    @Default(0) int id,
    @JsonKey(name: "value") @Default(0.0) double rating,
    @JsonKey(name: "created_at") @Default("") String createdAt,
    @JsonKey(name: "review_message") @Default("") String reviewMessage,
    @Default(Person()) Person rater,
    @Default(false) bool anonymous,
  }) = _RatingModel;

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);
}
