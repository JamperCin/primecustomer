// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  int get id => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get count =>
      throw _privateConstructorUsedError; //keep track of count/number of products selected
  @JsonKey(name: 'market_store_id')
  int get marketStoreId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get benefits => throw _privateConstructorUsedError;
  String get heroTag => throw _privateConstructorUsedError;
  String get displayedImage => throw _privateConstructorUsedError;
  String get shopName => throw _privateConstructorUsedError;
  String get shopCode => throw _privateConstructorUsedError;
  int get shopId => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  List<String> get size => throw _privateConstructorUsedError;
  List<String> get colors => throw _privateConstructorUsedError;
  ShopModel get shop => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: "product_ratings")
  double get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "quantity_in_stock")
  int get quantityInStock => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  bool get returnable => throw _privateConstructorUsedError;
  bool get isAddedToCart => throw _privateConstructorUsedError;
  bool get archived => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  @JsonKey(name: 'view_states')
  int get viewStates => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_customer_views')
  int get totalCustomerView => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_quantity_status')
  String get quantityStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'return_policy')
  String get returnPolicy => throw _privateConstructorUsedError;
  @JsonKey(name: 'belongs_to_product_types')
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'pictures')
  List<String> get images => throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
    ProductModel value,
    $Res Function(ProductModel) then,
  ) = _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call({
    int id,
    int quantity,
    int count,
    @JsonKey(name: 'market_store_id') int marketStoreId,
    String name,
    String currency,
    String description,
    String benefits,
    String heroTag,
    String displayedImage,
    String shopName,
    String shopCode,
    int shopId,
    String code,
    List<String> size,
    List<String> colors,
    ShopModel shop,
    double price,
    @JsonKey(name: "product_ratings") double rating,
    @JsonKey(name: "quantity_in_stock") int quantityInStock,
    double discount,
    bool returnable,
    bool isAddedToCart,
    bool archived,
    bool isFavorite,
    @JsonKey(name: 'view_states') int viewStates,
    @JsonKey(name: 'total_customer_views') int totalCustomerView,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'product_quantity_status') String quantityStatus,
    @JsonKey(name: 'return_policy') String returnPolicy,
    @JsonKey(name: 'belongs_to_product_types') List<CategoryModel> categories,
    @JsonKey(name: 'updated_at') String updatedAt,
    @JsonKey(name: 'category_id') int categoryId,
    @JsonKey(name: 'category_name') String categoryName,
    @JsonKey(name: 'pictures') List<String> images,
  });

  $ShopModelCopyWith<$Res> get shop;
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? count = null,
    Object? marketStoreId = null,
    Object? name = null,
    Object? currency = null,
    Object? description = null,
    Object? benefits = null,
    Object? heroTag = null,
    Object? displayedImage = null,
    Object? shopName = null,
    Object? shopCode = null,
    Object? shopId = null,
    Object? code = null,
    Object? size = null,
    Object? colors = null,
    Object? shop = null,
    Object? price = null,
    Object? rating = null,
    Object? quantityInStock = null,
    Object? discount = null,
    Object? returnable = null,
    Object? isAddedToCart = null,
    Object? archived = null,
    Object? isFavorite = null,
    Object? viewStates = null,
    Object? totalCustomerView = null,
    Object? createdAt = null,
    Object? quantityStatus = null,
    Object? returnPolicy = null,
    Object? categories = null,
    Object? updatedAt = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? images = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            marketStoreId: null == marketStoreId
                ? _value.marketStoreId
                : marketStoreId // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            benefits: null == benefits
                ? _value.benefits
                : benefits // ignore: cast_nullable_to_non_nullable
                      as String,
            heroTag: null == heroTag
                ? _value.heroTag
                : heroTag // ignore: cast_nullable_to_non_nullable
                      as String,
            displayedImage: null == displayedImage
                ? _value.displayedImage
                : displayedImage // ignore: cast_nullable_to_non_nullable
                      as String,
            shopName: null == shopName
                ? _value.shopName
                : shopName // ignore: cast_nullable_to_non_nullable
                      as String,
            shopCode: null == shopCode
                ? _value.shopCode
                : shopCode // ignore: cast_nullable_to_non_nullable
                      as String,
            shopId: null == shopId
                ? _value.shopId
                : shopId // ignore: cast_nullable_to_non_nullable
                      as int,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            size: null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            colors: null == colors
                ? _value.colors
                : colors // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            shop: null == shop
                ? _value.shop
                : shop // ignore: cast_nullable_to_non_nullable
                      as ShopModel,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            quantityInStock: null == quantityInStock
                ? _value.quantityInStock
                : quantityInStock // ignore: cast_nullable_to_non_nullable
                      as int,
            discount: null == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                      as double,
            returnable: null == returnable
                ? _value.returnable
                : returnable // ignore: cast_nullable_to_non_nullable
                      as bool,
            isAddedToCart: null == isAddedToCart
                ? _value.isAddedToCart
                : isAddedToCart // ignore: cast_nullable_to_non_nullable
                      as bool,
            archived: null == archived
                ? _value.archived
                : archived // ignore: cast_nullable_to_non_nullable
                      as bool,
            isFavorite: null == isFavorite
                ? _value.isFavorite
                : isFavorite // ignore: cast_nullable_to_non_nullable
                      as bool,
            viewStates: null == viewStates
                ? _value.viewStates
                : viewStates // ignore: cast_nullable_to_non_nullable
                      as int,
            totalCustomerView: null == totalCustomerView
                ? _value.totalCustomerView
                : totalCustomerView // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            quantityStatus: null == quantityStatus
                ? _value.quantityStatus
                : quantityStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            returnPolicy: null == returnPolicy
                ? _value.returnPolicy
                : returnPolicy // ignore: cast_nullable_to_non_nullable
                      as String,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<CategoryModel>,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            categoryId: null == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as int,
            categoryName: null == categoryName
                ? _value.categoryName
                : categoryName // ignore: cast_nullable_to_non_nullable
                      as String,
            images: null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShopModelCopyWith<$Res> get shop {
    return $ShopModelCopyWith<$Res>(_value.shop, (value) {
      return _then(_value.copyWith(shop: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
    _$ProductModelImpl value,
    $Res Function(_$ProductModelImpl) then,
  ) = __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int quantity,
    int count,
    @JsonKey(name: 'market_store_id') int marketStoreId,
    String name,
    String currency,
    String description,
    String benefits,
    String heroTag,
    String displayedImage,
    String shopName,
    String shopCode,
    int shopId,
    String code,
    List<String> size,
    List<String> colors,
    ShopModel shop,
    double price,
    @JsonKey(name: "product_ratings") double rating,
    @JsonKey(name: "quantity_in_stock") int quantityInStock,
    double discount,
    bool returnable,
    bool isAddedToCart,
    bool archived,
    bool isFavorite,
    @JsonKey(name: 'view_states') int viewStates,
    @JsonKey(name: 'total_customer_views') int totalCustomerView,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'product_quantity_status') String quantityStatus,
    @JsonKey(name: 'return_policy') String returnPolicy,
    @JsonKey(name: 'belongs_to_product_types') List<CategoryModel> categories,
    @JsonKey(name: 'updated_at') String updatedAt,
    @JsonKey(name: 'category_id') int categoryId,
    @JsonKey(name: 'category_name') String categoryName,
    @JsonKey(name: 'pictures') List<String> images,
  });

  @override
  $ShopModelCopyWith<$Res> get shop;
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
    _$ProductModelImpl _value,
    $Res Function(_$ProductModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? count = null,
    Object? marketStoreId = null,
    Object? name = null,
    Object? currency = null,
    Object? description = null,
    Object? benefits = null,
    Object? heroTag = null,
    Object? displayedImage = null,
    Object? shopName = null,
    Object? shopCode = null,
    Object? shopId = null,
    Object? code = null,
    Object? size = null,
    Object? colors = null,
    Object? shop = null,
    Object? price = null,
    Object? rating = null,
    Object? quantityInStock = null,
    Object? discount = null,
    Object? returnable = null,
    Object? isAddedToCart = null,
    Object? archived = null,
    Object? isFavorite = null,
    Object? viewStates = null,
    Object? totalCustomerView = null,
    Object? createdAt = null,
    Object? quantityStatus = null,
    Object? returnPolicy = null,
    Object? categories = null,
    Object? updatedAt = null,
    Object? categoryId = null,
    Object? categoryName = null,
    Object? images = null,
  }) {
    return _then(
      _$ProductModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        marketStoreId: null == marketStoreId
            ? _value.marketStoreId
            : marketStoreId // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        benefits: null == benefits
            ? _value.benefits
            : benefits // ignore: cast_nullable_to_non_nullable
                  as String,
        heroTag: null == heroTag
            ? _value.heroTag
            : heroTag // ignore: cast_nullable_to_non_nullable
                  as String,
        displayedImage: null == displayedImage
            ? _value.displayedImage
            : displayedImage // ignore: cast_nullable_to_non_nullable
                  as String,
        shopName: null == shopName
            ? _value.shopName
            : shopName // ignore: cast_nullable_to_non_nullable
                  as String,
        shopCode: null == shopCode
            ? _value.shopCode
            : shopCode // ignore: cast_nullable_to_non_nullable
                  as String,
        shopId: null == shopId
            ? _value.shopId
            : shopId // ignore: cast_nullable_to_non_nullable
                  as int,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        size: null == size
            ? _value._size
            : size // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        colors: null == colors
            ? _value._colors
            : colors // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        shop: null == shop
            ? _value.shop
            : shop // ignore: cast_nullable_to_non_nullable
                  as ShopModel,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        quantityInStock: null == quantityInStock
            ? _value.quantityInStock
            : quantityInStock // ignore: cast_nullable_to_non_nullable
                  as int,
        discount: null == discount
            ? _value.discount
            : discount // ignore: cast_nullable_to_non_nullable
                  as double,
        returnable: null == returnable
            ? _value.returnable
            : returnable // ignore: cast_nullable_to_non_nullable
                  as bool,
        isAddedToCart: null == isAddedToCart
            ? _value.isAddedToCart
            : isAddedToCart // ignore: cast_nullable_to_non_nullable
                  as bool,
        archived: null == archived
            ? _value.archived
            : archived // ignore: cast_nullable_to_non_nullable
                  as bool,
        isFavorite: null == isFavorite
            ? _value.isFavorite
            : isFavorite // ignore: cast_nullable_to_non_nullable
                  as bool,
        viewStates: null == viewStates
            ? _value.viewStates
            : viewStates // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCustomerView: null == totalCustomerView
            ? _value.totalCustomerView
            : totalCustomerView // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        quantityStatus: null == quantityStatus
            ? _value.quantityStatus
            : quantityStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        returnPolicy: null == returnPolicy
            ? _value.returnPolicy
            : returnPolicy // ignore: cast_nullable_to_non_nullable
                  as String,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<CategoryModel>,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryId: null == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as int,
        categoryName: null == categoryName
            ? _value.categoryName
            : categoryName // ignore: cast_nullable_to_non_nullable
                  as String,
        images: null == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  const _$ProductModelImpl({
    this.id = 0,
    this.quantity = 1,
    this.count = 0,
    @JsonKey(name: 'market_store_id') this.marketStoreId = 0,
    this.name = '',
    this.currency = 'GHS',
    this.description = '',
    this.benefits = '',
    this.heroTag = '',
    this.displayedImage = '',
    this.shopName = '',
    this.shopCode = '',
    this.shopId = 0,
    this.code = '',
    final List<String> size = const <String>[],
    final List<String> colors = const <String>[],
    this.shop = const ShopModel(),
    this.price = 0.0,
    @JsonKey(name: "product_ratings") this.rating = 0.0,
    @JsonKey(name: "quantity_in_stock") this.quantityInStock = 0,
    this.discount = 0.0,
    this.returnable = true,
    this.isAddedToCart = false,
    this.archived = false,
    this.isFavorite = false,
    @JsonKey(name: 'view_states') this.viewStates = 0,
    @JsonKey(name: 'total_customer_views') this.totalCustomerView = 1,
    @JsonKey(name: 'created_at') this.createdAt = '',
    @JsonKey(name: 'product_quantity_status') this.quantityStatus = '',
    @JsonKey(name: 'return_policy') this.returnPolicy = '',
    @JsonKey(name: 'belongs_to_product_types')
    final List<CategoryModel> categories = const <CategoryModel>[],
    @JsonKey(name: 'updated_at') this.updatedAt = '',
    @JsonKey(name: 'category_id') this.categoryId = 0,
    @JsonKey(name: 'category_name') this.categoryName = '',
    @JsonKey(name: 'pictures') final List<String> images = const <String>[],
  }) : _size = size,
       _colors = colors,
       _categories = categories,
       _images = images;

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final int count;
  //keep track of count/number of products selected
  @override
  @JsonKey(name: 'market_store_id')
  final int marketStoreId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String benefits;
  @override
  @JsonKey()
  final String heroTag;
  @override
  @JsonKey()
  final String displayedImage;
  @override
  @JsonKey()
  final String shopName;
  @override
  @JsonKey()
  final String shopCode;
  @override
  @JsonKey()
  final int shopId;
  @override
  @JsonKey()
  final String code;
  final List<String> _size;
  @override
  @JsonKey()
  List<String> get size {
    if (_size is EqualUnmodifiableListView) return _size;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_size);
  }

  final List<String> _colors;
  @override
  @JsonKey()
  List<String> get colors {
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  @JsonKey()
  final ShopModel shop;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey(name: "product_ratings")
  final double rating;
  @override
  @JsonKey(name: "quantity_in_stock")
  final int quantityInStock;
  @override
  @JsonKey()
  final double discount;
  @override
  @JsonKey()
  final bool returnable;
  @override
  @JsonKey()
  final bool isAddedToCart;
  @override
  @JsonKey()
  final bool archived;
  @override
  @JsonKey()
  final bool isFavorite;
  @override
  @JsonKey(name: 'view_states')
  final int viewStates;
  @override
  @JsonKey(name: 'total_customer_views')
  final int totalCustomerView;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'product_quantity_status')
  final String quantityStatus;
  @override
  @JsonKey(name: 'return_policy')
  final String returnPolicy;
  final List<CategoryModel> _categories;
  @override
  @JsonKey(name: 'belongs_to_product_types')
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  final List<String> _images;
  @override
  @JsonKey(name: 'pictures')
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, quantity: $quantity, count: $count, marketStoreId: $marketStoreId, name: $name, currency: $currency, description: $description, benefits: $benefits, heroTag: $heroTag, displayedImage: $displayedImage, shopName: $shopName, shopCode: $shopCode, shopId: $shopId, code: $code, size: $size, colors: $colors, shop: $shop, price: $price, rating: $rating, quantityInStock: $quantityInStock, discount: $discount, returnable: $returnable, isAddedToCart: $isAddedToCart, archived: $archived, isFavorite: $isFavorite, viewStates: $viewStates, totalCustomerView: $totalCustomerView, createdAt: $createdAt, quantityStatus: $quantityStatus, returnPolicy: $returnPolicy, categories: $categories, updatedAt: $updatedAt, categoryId: $categoryId, categoryName: $categoryName, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.marketStoreId, marketStoreId) ||
                other.marketStoreId == marketStoreId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.benefits, benefits) ||
                other.benefits == benefits) &&
            (identical(other.heroTag, heroTag) || other.heroTag == heroTag) &&
            (identical(other.displayedImage, displayedImage) ||
                other.displayedImage == displayedImage) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.shopCode, shopCode) ||
                other.shopCode == shopCode) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._size, _size) &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            (identical(other.shop, shop) || other.shop == shop) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.quantityInStock, quantityInStock) ||
                other.quantityInStock == quantityInStock) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.returnable, returnable) ||
                other.returnable == returnable) &&
            (identical(other.isAddedToCart, isAddedToCart) ||
                other.isAddedToCart == isAddedToCart) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.viewStates, viewStates) ||
                other.viewStates == viewStates) &&
            (identical(other.totalCustomerView, totalCustomerView) ||
                other.totalCustomerView == totalCustomerView) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.quantityStatus, quantityStatus) ||
                other.quantityStatus == quantityStatus) &&
            (identical(other.returnPolicy, returnPolicy) ||
                other.returnPolicy == returnPolicy) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    quantity,
    count,
    marketStoreId,
    name,
    currency,
    description,
    benefits,
    heroTag,
    displayedImage,
    shopName,
    shopCode,
    shopId,
    code,
    const DeepCollectionEquality().hash(_size),
    const DeepCollectionEquality().hash(_colors),
    shop,
    price,
    rating,
    quantityInStock,
    discount,
    returnable,
    isAddedToCart,
    archived,
    isFavorite,
    viewStates,
    totalCustomerView,
    createdAt,
    quantityStatus,
    returnPolicy,
    const DeepCollectionEquality().hash(_categories),
    updatedAt,
    categoryId,
    categoryName,
    const DeepCollectionEquality().hash(_images),
  ]);

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(this);
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel({
    final int id,
    final int quantity,
    final int count,
    @JsonKey(name: 'market_store_id') final int marketStoreId,
    final String name,
    final String currency,
    final String description,
    final String benefits,
    final String heroTag,
    final String displayedImage,
    final String shopName,
    final String shopCode,
    final int shopId,
    final String code,
    final List<String> size,
    final List<String> colors,
    final ShopModel shop,
    final double price,
    @JsonKey(name: "product_ratings") final double rating,
    @JsonKey(name: "quantity_in_stock") final int quantityInStock,
    final double discount,
    final bool returnable,
    final bool isAddedToCart,
    final bool archived,
    final bool isFavorite,
    @JsonKey(name: 'view_states') final int viewStates,
    @JsonKey(name: 'total_customer_views') final int totalCustomerView,
    @JsonKey(name: 'created_at') final String createdAt,
    @JsonKey(name: 'product_quantity_status') final String quantityStatus,
    @JsonKey(name: 'return_policy') final String returnPolicy,
    @JsonKey(name: 'belongs_to_product_types')
    final List<CategoryModel> categories,
    @JsonKey(name: 'updated_at') final String updatedAt,
    @JsonKey(name: 'category_id') final int categoryId,
    @JsonKey(name: 'category_name') final String categoryName,
    @JsonKey(name: 'pictures') final List<String> images,
  }) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  int get id;
  @override
  int get quantity;
  @override
  int get count; //keep track of count/number of products selected
  @override
  @JsonKey(name: 'market_store_id')
  int get marketStoreId;
  @override
  String get name;
  @override
  String get currency;
  @override
  String get description;
  @override
  String get benefits;
  @override
  String get heroTag;
  @override
  String get displayedImage;
  @override
  String get shopName;
  @override
  String get shopCode;
  @override
  int get shopId;
  @override
  String get code;
  @override
  List<String> get size;
  @override
  List<String> get colors;
  @override
  ShopModel get shop;
  @override
  double get price;
  @override
  @JsonKey(name: "product_ratings")
  double get rating;
  @override
  @JsonKey(name: "quantity_in_stock")
  int get quantityInStock;
  @override
  double get discount;
  @override
  bool get returnable;
  @override
  bool get isAddedToCart;
  @override
  bool get archived;
  @override
  bool get isFavorite;
  @override
  @JsonKey(name: 'view_states')
  int get viewStates;
  @override
  @JsonKey(name: 'total_customer_views')
  int get totalCustomerView;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'product_quantity_status')
  String get quantityStatus;
  @override
  @JsonKey(name: 'return_policy')
  String get returnPolicy;
  @override
  @JsonKey(name: 'belongs_to_product_types')
  List<CategoryModel> get categories;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'category_id')
  int get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  @JsonKey(name: 'pictures')
  List<String> get images;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
