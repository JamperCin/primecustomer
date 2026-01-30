import 'package:freezed_annotation/freezed_annotation.dart';
import 'wallet_type.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
class WalletModel with _$WalletModel {
  const factory WalletModel({
    @Default(0) int id,
    @JsonKey(name: 'wallet_type_id') @Default(0) int walletTypeId,
    @JsonKey(name: 'acc_number') @Default('') String accNumber,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @Default(false) bool blocked,
    @Default(false) bool verified,
    bool? archived,
    @JsonKey(name: 'wallet_type') @Default(WalletType()) WalletType walletType,
    @Default('') String description,
    @Default('') String provider,
    @JsonKey(name: 'customer_id') @Default('') String customerId,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);
}
