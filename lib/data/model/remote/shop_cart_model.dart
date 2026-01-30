import 'package:primecustomer/data/model/remote/product_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_cart_model.freezed.dart';
part 'shop_cart_model.g.dart';

@freezed
class ShopCartModel with _$ShopCartModel {
  const factory ShopCartModel({
    @JsonKey(name: "shop_cart_id") @Default(0) int cartId,
    @JsonKey(name: "total_items") @Default(0) int totalItems,
    @JsonKey(name: "created_at") @Default("") String createdAt,
    @Default("") String description,
    @JsonKey(name: "total_amount") @Default(0.0) double totalAmount,
    @JsonKey(name: "net_amount") @Default(0.0) double netAmount,
    @Default(0.0) double fees,
    @Default(<ProductSummary>[]) List<ProductSummary> items,
  }) = _ShopCartModel;

  factory ShopCartModel.fromJson(Map<String, dynamic> json) =>
      _$ShopCartModelFromJson(json);
}
