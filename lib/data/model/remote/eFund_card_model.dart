import 'package:freezed_annotation/freezed_annotation.dart';

import 'prime_card_model.dart';

part 'eFund_card_model.freezed.dart';
part 'eFund_card_model.g.dart';

@freezed
class EfundCardModel with _$EfundCardModel {
  const factory EfundCardModel({
    @Default(0) int id,
    @JsonKey(name: "efund_id") @Default(0) int eFundId,
    @Default(0) int quantity,
    @Default(0.0) double amount,
    @Default(0.0) double fees,
    @Default(false) bool paid,
    @Default(false) bool cancelled,
    @Default("GHS") String currency,
    @JsonKey(name: "unit_amount") @Default(0.0) double unitAmount,
    @JsonKey(name: "total_amount") @Default(0.0) double totalAmount,
    @JsonKey(name: "discount_amount") @Default(0.0) double discountAmount,
    @Default(PrimeCardModel()) PrimeCardModel card,
  }) = _EfundCardModel;

  factory EfundCardModel.fromJson(Map<String, dynamic> json) =>
      _$EfundCardModelFromJson(json);
}
