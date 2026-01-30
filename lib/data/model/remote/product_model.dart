import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/category_model.dart';
import 'package:primecustomer/data/model/remote/shop_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel extends BaseObject with _$ProductModel {
  const factory ProductModel({
    @Default(0) int id,
    @Default(1) int quantity,
    @Default(0) int count, //keep track of count/number of products selected
    @JsonKey(name: 'market_store_id') @Default(0) int marketStoreId,
    @Default('') String name,
    @Default('GHS') String currency,
    @Default('') String description,
    @Default('') String benefits,
    @Default('') String heroTag,
    @Default('') String displayedImage,
    @Default('') String shopName,
    @Default('') String shopCode,
    @Default(0) int shopId,
    @Default('') String code,
    @Default(<String>[]) List<String> size,
    @Default(<String>[]) List<String> colors,
    @Default(ShopModel()) ShopModel shop,
    @Default(0.0) double price,
    @JsonKey(name: "product_ratings") @Default(0.0) double rating,
    @JsonKey(name: "quantity_in_stock") @Default(0) int quantityInStock,
    @Default(0.0) double discount,
    @Default(true) bool returnable,
    @Default(false) bool isAddedToCart,
    @Default(false) bool archived,
    @Default(false) bool isFavorite,
    @JsonKey(name: 'view_states') @Default(0) int viewStates,
    @JsonKey(name: 'total_customer_views') @Default(1) int totalCustomerView,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @JsonKey(name: 'product_quantity_status')
    @Default('')
    String quantityStatus,
    @JsonKey(name: 'return_policy') @Default('') String returnPolicy,
    @JsonKey(name: 'belongs_to_product_types')
    @Default(<CategoryModel>[])
    List<CategoryModel> categories,
    @JsonKey(name: 'updated_at') @Default('') String updatedAt,
    @JsonKey(name: 'category_id') @Default(0) int categoryId,
    @JsonKey(name: 'category_name') @Default('') String categoryName,
    @JsonKey(name: 'pictures') @Default(<String>[]) List<String> images,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
