import 'package:freezed_annotation/freezed_annotation.dart';
import 'prime_card_model.dart';

part 'prime_cart_model.freezed.dart';
part 'prime_cart_model.g.dart';

@freezed
class PrimeCartModel with _$PrimeCartModel {
  const factory PrimeCartModel({
    @Default('') String status,
    @JsonKey(name: 'total_amount') @Default(0.00) double totalAmount,
    @JsonKey(name: 'cart_id') @Default(0) int cartId,
    @Default([]) List<PrimeCardModel> cards,
    @JsonKey(name: 'cart_status') @Default('') String cartStatus,
    @JsonKey(name: 'net_amount') @Default(0.00) double netAmount,
    @Default(0.00) double fees,
  }) = _PrimeCartModel;

  factory PrimeCartModel.fromJson(Map<String, dynamic> json) =>
      _$PrimeCartModelFromJson(json);
}
