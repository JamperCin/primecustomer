import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/coordinates.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_model.freezed.dart';
part 'shop_model.g.dart';

@freezed
class ShopModel extends BaseObject with _$ShopModel {
  const factory ShopModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String code,
    @JsonKey(name: "logo_url") @Default('') String logo,
    Coordinates? location,
    @Default('') String description,
    @Default('') String website,
    @Default('') String terms,
    @Default(false) bool verified,
    @Default('GHS') String currency,
    @JsonKey(name: 'latest_products')
    @Default(<ProductModel>[])
        List<ProductModel> latestProducts,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
  }) = _ShopModel;

  factory ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);
}
