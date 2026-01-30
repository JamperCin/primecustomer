import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_options.freezed.dart';
part 'payment_options.g.dart';

@freezed
class PaymentOptions with _$PaymentOptions {
  const factory PaymentOptions({
    @Default(0) int id,
    @Default('') String code,
    @Default('') String name,
    @Default(false) bool blocked,
    @Default(false) bool archived,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @JsonKey(name: 'updated_at') @Default('') String updatedAt,
  }) = _PaymentOptions;

  factory PaymentOptions.fromJson(Map<String, dynamic> json) =>
      _$PaymentOptionsFromJson(json);
}
