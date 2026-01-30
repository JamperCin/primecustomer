import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:primecustomer/data/model/remote/shop_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_details_model.g.dart';

part 'shop_details_model.freezed.dart';

@freezed
class ShopDetailModel extends BaseObject with _$ShopDetailModel {
  const factory ShopDetailModel({
    @JsonKey(name: 'shop_products')
    @Default(<ProductModel>[])
    List<ProductModel> shopProducts,
    @JsonKey(name: 'shop_details') @Default(ShopModel()) ShopModel shopDetails,
  }) = _ShopDetailModel;

  factory ShopDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ShopDetailModelFromJson(json);
}
