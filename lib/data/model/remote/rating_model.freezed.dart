// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RatingModel _$RatingModelFromJson(Map<String, dynamic> json) {
  return _RatingModel.fromJson(json);
}

/// @nodoc
mixin _$RatingModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "value")
  double get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "review_message")
  String get reviewMessage => throw _privateConstructorUsedError;
  Person get rater => throw _privateConstructorUsedError;
  bool get anonymous => throw _privateConstructorUsedError;

  /// Serializes this RatingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatingModelCopyWith<RatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingModelCopyWith<$Res> {
  factory $RatingModelCopyWith(
    RatingModel value,
    $Res Function(RatingModel) then,
  ) = _$RatingModelCopyWithImpl<$Res, RatingModel>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: "value") double rating,
    @JsonKey(name: "created_at") String createdAt,
    @JsonKey(name: "review_message") String reviewMessage,
    Person rater,
    bool anonymous,
  });

  $PersonCopyWith<$Res> get rater;
}

/// @nodoc
class _$RatingModelCopyWithImpl<$Res, $Val extends RatingModel>
    implements $RatingModelCopyWith<$Res> {
  _$RatingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? reviewMessage = null,
    Object? rater = null,
    Object? anonymous = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            reviewMessage: null == reviewMessage
                ? _value.reviewMessage
                : reviewMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            rater: null == rater
                ? _value.rater
                : rater // ignore: cast_nullable_to_non_nullable
                      as Person,
            anonymous: null == anonymous
                ? _value.anonymous
                : anonymous // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res> get rater {
    return $PersonCopyWith<$Res>(_value.rater, (value) {
      return _then(_value.copyWith(rater: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RatingModelImplCopyWith<$Res>
    implements $RatingModelCopyWith<$Res> {
  factory _$$RatingModelImplCopyWith(
    _$RatingModelImpl value,
    $Res Function(_$RatingModelImpl) then,
  ) = __$$RatingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: "value") double rating,
    @JsonKey(name: "created_at") String createdAt,
    @JsonKey(name: "review_message") String reviewMessage,
    Person rater,
    bool anonymous,
  });

  @override
  $PersonCopyWith<$Res> get rater;
}

/// @nodoc
class __$$RatingModelImplCopyWithImpl<$Res>
    extends _$RatingModelCopyWithImpl<$Res, _$RatingModelImpl>
    implements _$$RatingModelImplCopyWith<$Res> {
  __$$RatingModelImplCopyWithImpl(
    _$RatingModelImpl _value,
    $Res Function(_$RatingModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? reviewMessage = null,
    Object? rater = null,
    Object? anonymous = null,
  }) {
    return _then(
      _$RatingModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        reviewMessage: null == reviewMessage
            ? _value.reviewMessage
            : reviewMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        rater: null == rater
            ? _value.rater
            : rater // ignore: cast_nullable_to_non_nullable
                  as Person,
        anonymous: null == anonymous
            ? _value.anonymous
            : anonymous // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RatingModelImpl implements _RatingModel {
  const _$RatingModelImpl({
    this.id = 0,
    @JsonKey(name: "value") this.rating = 0.0,
    @JsonKey(name: "created_at") this.createdAt = "",
    @JsonKey(name: "review_message") this.reviewMessage = "",
    this.rater = const Person(),
    this.anonymous = false,
  });

  factory _$RatingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: "value")
  final double rating;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "review_message")
  final String reviewMessage;
  @override
  @JsonKey()
  final Person rater;
  @override
  @JsonKey()
  final bool anonymous;

  @override
  String toString() {
    return 'RatingModel(id: $id, rating: $rating, createdAt: $createdAt, reviewMessage: $reviewMessage, rater: $rater, anonymous: $anonymous)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.reviewMessage, reviewMessage) ||
                other.reviewMessage == reviewMessage) &&
            (identical(other.rater, rater) || other.rater == rater) &&
            (identical(other.anonymous, anonymous) ||
                other.anonymous == anonymous));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    rating,
    createdAt,
    reviewMessage,
    rater,
    anonymous,
  );

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingModelImplCopyWith<_$RatingModelImpl> get copyWith =>
      __$$RatingModelImplCopyWithImpl<_$RatingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingModelImplToJson(this);
  }
}

abstract class _RatingModel implements RatingModel {
  const factory _RatingModel({
    final int id,
    @JsonKey(name: "value") final double rating,
    @JsonKey(name: "created_at") final String createdAt,
    @JsonKey(name: "review_message") final String reviewMessage,
    final Person rater,
    final bool anonymous,
  }) = _$RatingModelImpl;

  factory _RatingModel.fromJson(Map<String, dynamic> json) =
      _$RatingModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "value")
  double get rating;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "review_message")
  String get reviewMessage;
  @override
  Person get rater;
  @override
  bool get anonymous;

  /// Create a copy of RatingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingModelImplCopyWith<_$RatingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
