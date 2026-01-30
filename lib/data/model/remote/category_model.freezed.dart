// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  @JsonKey(name: "is_main")
  bool get isMain => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: "parent_code")
  String get parentCode => throw _privateConstructorUsedError;
  String get emoji => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_categories")
  List<CategoryModel> get subCategories => throw _privateConstructorUsedError;

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
    CategoryModel value,
    $Res Function(CategoryModel) then,
  ) = _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    String logo,
    @JsonKey(name: "is_main") bool isMain,
    bool isSelected,
    String code,
    @JsonKey(name: "parent_code") String parentCode,
    String emoji,
    String image,
    @JsonKey(name: "sub_categories") List<CategoryModel> subCategories,
  });
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? logo = null,
    Object? isMain = null,
    Object? isSelected = null,
    Object? code = null,
    Object? parentCode = null,
    Object? emoji = null,
    Object? image = null,
    Object? subCategories = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            logo: null == logo
                ? _value.logo
                : logo // ignore: cast_nullable_to_non_nullable
                      as String,
            isMain: null == isMain
                ? _value.isMain
                : isMain // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSelected: null == isSelected
                ? _value.isSelected
                : isSelected // ignore: cast_nullable_to_non_nullable
                      as bool,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            parentCode: null == parentCode
                ? _value.parentCode
                : parentCode // ignore: cast_nullable_to_non_nullable
                      as String,
            emoji: null == emoji
                ? _value.emoji
                : emoji // ignore: cast_nullable_to_non_nullable
                      as String,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            subCategories: null == subCategories
                ? _value.subCategories
                : subCategories // ignore: cast_nullable_to_non_nullable
                      as List<CategoryModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
    _$CategoryModelImpl value,
    $Res Function(_$CategoryModelImpl) then,
  ) = __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    String logo,
    @JsonKey(name: "is_main") bool isMain,
    bool isSelected,
    String code,
    @JsonKey(name: "parent_code") String parentCode,
    String emoji,
    String image,
    @JsonKey(name: "sub_categories") List<CategoryModel> subCategories,
  });
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
    _$CategoryModelImpl _value,
    $Res Function(_$CategoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? logo = null,
    Object? isMain = null,
    Object? isSelected = null,
    Object? code = null,
    Object? parentCode = null,
    Object? emoji = null,
    Object? image = null,
    Object? subCategories = null,
  }) {
    return _then(
      _$CategoryModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        logo: null == logo
            ? _value.logo
            : logo // ignore: cast_nullable_to_non_nullable
                  as String,
        isMain: null == isMain
            ? _value.isMain
            : isMain // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSelected: null == isSelected
            ? _value.isSelected
            : isSelected // ignore: cast_nullable_to_non_nullable
                  as bool,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        parentCode: null == parentCode
            ? _value.parentCode
            : parentCode // ignore: cast_nullable_to_non_nullable
                  as String,
        emoji: null == emoji
            ? _value.emoji
            : emoji // ignore: cast_nullable_to_non_nullable
                  as String,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        subCategories: null == subCategories
            ? _value._subCategories
            : subCategories // ignore: cast_nullable_to_non_nullable
                  as List<CategoryModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryModelImpl implements _CategoryModel {
  const _$CategoryModelImpl({
    this.id = 0,
    this.name = '',
    this.description = '',
    this.logo = '',
    @JsonKey(name: "is_main") this.isMain = false,
    this.isSelected = false,
    this.code = "",
    @JsonKey(name: "parent_code") this.parentCode = "",
    this.emoji = "",
    this.image = "",
    @JsonKey(name: "sub_categories")
    final List<CategoryModel> subCategories = const <CategoryModel>[],
  }) : _subCategories = subCategories;

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String logo;
  @override
  @JsonKey(name: "is_main")
  final bool isMain;
  @override
  @JsonKey()
  final bool isSelected;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey(name: "parent_code")
  final String parentCode;
  @override
  @JsonKey()
  final String emoji;
  @override
  @JsonKey()
  final String image;
  final List<CategoryModel> _subCategories;
  @override
  @JsonKey(name: "sub_categories")
  List<CategoryModel> get subCategories {
    if (_subCategories is EqualUnmodifiableListView) return _subCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subCategories);
  }

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, description: $description, logo: $logo, isMain: $isMain, isSelected: $isSelected, code: $code, parentCode: $parentCode, emoji: $emoji, image: $image, subCategories: $subCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.isMain, isMain) || other.isMain == isMain) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.parentCode, parentCode) ||
                other.parentCode == parentCode) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(
              other._subCategories,
              _subCategories,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    logo,
    isMain,
    isSelected,
    code,
    parentCode,
    emoji,
    image,
    const DeepCollectionEquality().hash(_subCategories),
  );

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(this);
  }
}

abstract class _CategoryModel implements CategoryModel {
  const factory _CategoryModel({
    final int id,
    final String name,
    final String description,
    final String logo,
    @JsonKey(name: "is_main") final bool isMain,
    final bool isSelected,
    final String code,
    @JsonKey(name: "parent_code") final String parentCode,
    final String emoji,
    final String image,
    @JsonKey(name: "sub_categories") final List<CategoryModel> subCategories,
  }) = _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get logo;
  @override
  @JsonKey(name: "is_main")
  bool get isMain;
  @override
  bool get isSelected;
  @override
  String get code;
  @override
  @JsonKey(name: "parent_code")
  String get parentCode;
  @override
  String get emoji;
  @override
  String get image;
  @override
  @JsonKey(name: "sub_categories")
  List<CategoryModel> get subCategories;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
