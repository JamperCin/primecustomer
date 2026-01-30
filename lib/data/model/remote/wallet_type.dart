import 'package:freezed_annotation/freezed_annotation.dart';
import 'wallet_provider.dart';

part 'wallet_type.freezed.dart';
part 'wallet_type.g.dart';

@freezed
class WalletType with _$WalletType {
  const factory WalletType({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String description,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @Default([]) List<WalletProvider> providers,
  }) = _WalletType;

  factory WalletType.fromJson(Map<String, dynamic> json) =>
      _$WalletTypeFromJson(json);
}
