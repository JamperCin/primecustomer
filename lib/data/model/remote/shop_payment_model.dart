import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/orders_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_payment_model.freezed.dart';
part 'shop_payment_model.g.dart';

@freezed
class ShopPaymentModel extends BaseObject with _$ShopPaymentModel {
  const factory ShopPaymentModel({
    @Default('') String reference,
    @Default('') String amount,
    @Default('') String status,
    @Default('') String orderStats,
    @JsonKey(name: 'created_at') @Default('') String createAt,
    @Default([]) List<OrderModel> orders,
  }) = _ShopPaymentModel;

  factory ShopPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$ShopPaymentModelFromJson(json);
}
