import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/card_account.dart';
import 'package:primecustomer/data/model/remote/feedback_model.dart';
import 'package:primecustomer/data/model/remote/giver.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gifted_card.freezed.dart';
part 'gifted_card.g.dart';

@freezed
class GiftedCard extends BaseObject with _$GiftedCard {
  const factory GiftedCard({
    @Default(0) int id,
    @JsonKey(name: 'scheduled_date') @Default('') String scheduledDate,
    @Default('') String message,
    @Default(Giver()) Giver giver,
    @Default(Giver()) Giver recipient,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @Default(CardAccount()) CardAccount account,
    FeedbackModel? feedback,
  }) = _GiftedCard;

  factory GiftedCard.fromJson(Map<String, dynamic> json) =>
      _$GiftedCardFromJson(json);
}
