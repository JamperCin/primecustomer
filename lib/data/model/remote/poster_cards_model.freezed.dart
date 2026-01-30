// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poster_cards_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PosterCardsModel _$PosterCardsModelFromJson(Map<String, dynamic> json) {
  return _PosterCardsModel.fromJson(json);
}

/// @nodoc
mixin _$PosterCardsModel {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get asset => throw _privateConstructorUsedError;

  /// Serializes this PosterCardsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PosterCardsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PosterCardsModelCopyWith<PosterCardsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosterCardsModelCopyWith<$Res> {
  factory $PosterCardsModelCopyWith(
    PosterCardsModel value,
    $Res Function(PosterCardsModel) then,
  ) = _$PosterCardsModelCopyWithImpl<$Res, PosterCardsModel>;
  @useResult
  $Res call({String title, String description, String asset});
}

/// @nodoc
class _$PosterCardsModelCopyWithImpl<$Res, $Val extends PosterCardsModel>
    implements $PosterCardsModelCopyWith<$Res> {
  _$PosterCardsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PosterCardsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? asset = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            asset: null == asset
                ? _value.asset
                : asset // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PosterCardsModelImplCopyWith<$Res>
    implements $PosterCardsModelCopyWith<$Res> {
  factory _$$PosterCardsModelImplCopyWith(
    _$PosterCardsModelImpl value,
    $Res Function(_$PosterCardsModelImpl) then,
  ) = __$$PosterCardsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, String asset});
}

/// @nodoc
class __$$PosterCardsModelImplCopyWithImpl<$Res>
    extends _$PosterCardsModelCopyWithImpl<$Res, _$PosterCardsModelImpl>
    implements _$$PosterCardsModelImplCopyWith<$Res> {
  __$$PosterCardsModelImplCopyWithImpl(
    _$PosterCardsModelImpl _value,
    $Res Function(_$PosterCardsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PosterCardsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? asset = null,
  }) {
    return _then(
      _$PosterCardsModelImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        asset: null == asset
            ? _value.asset
            : asset // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PosterCardsModelImpl implements _PosterCardsModel {
  const _$PosterCardsModelImpl({
    this.title = '',
    this.description = '',
    this.asset = '',
  });

  factory _$PosterCardsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosterCardsModelImplFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String asset;

  @override
  String toString() {
    return 'PosterCardsModel(title: $title, description: $description, asset: $asset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosterCardsModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.asset, asset) || other.asset == asset));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, asset);

  /// Create a copy of PosterCardsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PosterCardsModelImplCopyWith<_$PosterCardsModelImpl> get copyWith =>
      __$$PosterCardsModelImplCopyWithImpl<_$PosterCardsModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PosterCardsModelImplToJson(this);
  }
}

abstract class _PosterCardsModel implements PosterCardsModel {
  const factory _PosterCardsModel({
    final String title,
    final String description,
    final String asset,
  }) = _$PosterCardsModelImpl;

  factory _PosterCardsModel.fromJson(Map<String, dynamic> json) =
      _$PosterCardsModelImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get asset;

  /// Create a copy of PosterCardsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PosterCardsModelImplCopyWith<_$PosterCardsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
