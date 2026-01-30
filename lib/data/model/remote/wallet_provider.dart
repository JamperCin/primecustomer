import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_provider.freezed.dart';
part 'wallet_provider.g.dart';

@freezed
class WalletProvider with _$WalletProvider {
  const factory WalletProvider({
    @Default('') String name,
    @Default('') String code,
  }) = _WalletProvider;

  factory WalletProvider.fromJson(Map<String, dynamic> json) =>
      _$WalletProviderFromJson(json);
}
