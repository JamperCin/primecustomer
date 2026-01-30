import 'package:freezed_annotation/freezed_annotation.dart';

part 'verified_token.freezed.dart';
part 'verified_token.g.dart';

@freezed
class VerifiedToken with _$VerifiedToken {
  const factory VerifiedToken({
    @JsonKey(name: 'verified_at') @Default('') String verifiedAt,
    @Default('') String signed,
  }) = _VerifiedToken;

  factory VerifiedToken.fromJson(Map<String, dynamic> json) =>
      _$VerifiedTokenFromJson(json);
}
