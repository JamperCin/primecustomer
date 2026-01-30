import 'package:primecustomer/data/model/remote/person.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
class Customer with _$Customer {
  const factory Customer({
    @Default(0) int id,
    @Default('') String email,
    @JsonKey(name: 'phone_number') @Default('') String phoneNumber,
    @JsonKey(name: 'phone') @Default('') String eFundPhone,
    @Default('') String username,
    @Default(false) bool blocked,
    @Default(false) bool active,
    @Default('') String company,
    Person? person,
    @JsonKey(name: 'verification_token') @Default('') String verificationToken,
    @JsonKey(name: 'created_at') @Default('') String joinedSince,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}
