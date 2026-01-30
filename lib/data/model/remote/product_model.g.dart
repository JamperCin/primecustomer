// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(
  Map<String, dynamic> json,
) => _$ProductModelImpl(
  id: (json['id'] as num?)?.toInt() ?? 0,
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
  count: (json['count'] as num?)?.toInt() ?? 0,
  marketStoreId: (json['market_store_id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  currency: json['currency'] as String? ?? 'GHS',
  description: json['description'] as String? ?? '',
  benefits: json['benefits'] as String? ?? '',
  heroTag: json['heroTag'] as String? ?? '',
  displayedImage: json['displayedImage'] as String? ?? '',
  shopName: json['shopName'] as String? ?? '',
  shopCode: json['shopCode'] as String? ?? '',
  shopId: (json['shopId'] as num?)?.toInt() ?? 0,
  code: json['code'] as String? ?? '',
  size:
      (json['size'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  colors:
      (json['colors'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  shop: json['shop'] == null
      ? const ShopModel()
      : ShopModel.fromJson(json['shop'] as Map<String, dynamic>),
  price: (json['price'] as num?)?.toDouble() ?? 0.0,
  rating: (json['product_ratings'] as num?)?.toDouble() ?? 0.0,
  quantityInStock: (json['quantity_in_stock'] as num?)?.toInt() ?? 0,
  discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
  returnable: json['returnable'] as bool? ?? true,
  isAddedToCart: json['isAddedToCart'] as bool? ?? false,
  archived: json['archived'] as bool? ?? false,
  isFavorite: json['isFavorite'] as bool? ?? false,
  viewStates: (json['view_states'] as num?)?.toInt() ?? 0,
  totalCustomerView: (json['total_customer_views'] as num?)?.toInt() ?? 1,
  createdAt: json['created_at'] as String? ?? '',
  quantityStatus: json['product_quantity_status'] as String? ?? '',
  returnPolicy: json['return_policy'] as String? ?? '',
  categories:
      (json['belongs_to_product_types'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CategoryModel>[],
  updatedAt: json['updated_at'] as String? ?? '',
  categoryId: (json['category_id'] as num?)?.toInt() ?? 0,
  categoryName: json['category_name'] as String? ?? '',
  images:
      (json['pictures'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'count': instance.count,
      'market_store_id': instance.marketStoreId,
      'name': instance.name,
      'currency': instance.currency,
      'description': instance.description,
      'benefits': instance.benefits,
      'heroTag': instance.heroTag,
      'displayedImage': instance.displayedImage,
      'shopName': instance.shopName,
      'shopCode': instance.shopCode,
      'shopId': instance.shopId,
      'code': instance.code,
      'size': instance.size,
      'colors': instance.colors,
      'shop': instance.shop,
      'price': instance.price,
      'product_ratings': instance.rating,
      'quantity_in_stock': instance.quantityInStock,
      'discount': instance.discount,
      'returnable': instance.returnable,
      'isAddedToCart': instance.isAddedToCart,
      'archived': instance.archived,
      'isFavorite': instance.isFavorite,
      'view_states': instance.viewStates,
      'total_customer_views': instance.totalCustomerView,
      'created_at': instance.createdAt,
      'product_quantity_status': instance.quantityStatus,
      'return_policy': instance.returnPolicy,
      'belongs_to_product_types': instance.categories,
      'updated_at': instance.updatedAt,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'pictures': instance.images,
    };
