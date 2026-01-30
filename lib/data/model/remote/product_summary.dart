import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_summary.freezed.dart';
part 'product_summary.g.dart';

@freezed
class ProductSummary extends BaseObject with _$ProductSummary {
  const factory ProductSummary({
    @Default(0) int id,
    @Default(0) int quantity,
    @JsonKey(name: "unit_amount") @Default(0.0) double unitAmount,
    @JsonKey(name: "net_amount") @Default(0.0) double netAmount,
    @JsonKey(name: "gross_amount") @Default(0.0) double grossAmount,
    @JsonKey(name: "payable_amount") @Default(0.0) double payableAmount,
    @JsonKey(name: "unit_discount_amount") @Default(0.0) double unitDiscount,
    @JsonKey(name: "total_discount_amount") @Default(0.0) double totalDiscount,
    //@Default(0.0) double amount,
    @Default(0.0) double fees,
    @Default("") String currency,
    // @JsonKey(name: "total_amount") @Default(0.0) double totalAmount,
    // @JsonKey(name: "discount_amount") @Default(0.0) double discountAmount,
    @JsonKey(name: "discount_percentage") @Default('') String discountPercent,
    @Default(ProductModel()) ProductModel product,
  }) = _ProductSummary;

  factory ProductSummary.fromJson(Map<String, dynamic> json) =>
      _$ProductSummaryFromJson(json);
}
