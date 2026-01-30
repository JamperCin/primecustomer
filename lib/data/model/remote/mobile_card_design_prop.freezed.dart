// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mobile_card_design_prop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MobileCardDesignProp _$MobileCardDesignPropFromJson(Map<String, dynamic> json) {
  return _MobileCardDesignProp.fromJson(json);
}

/// @nodoc
mixin _$MobileCardDesignProp {
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_amount')
  bool get showAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_color')
  String get defaultColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_position')
  List<String> get logoPosition => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_position')
  List<String> get amountPosition => throw _privateConstructorUsedError;

  /// Serializes this MobileCardDesignProp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MobileCardDesignProp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MobileCardDesignPropCopyWith<MobileCardDesignProp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MobileCardDesignPropCopyWith<$Res> {
  factory $MobileCardDesignPropCopyWith(
    MobileCardDesignProp value,
    $Res Function(MobileCardDesignProp) then,
  ) = _$MobileCardDesignPropCopyWithImpl<$Res, MobileCardDesignProp>;
  @useResult
  $Res call({
    String type,
    @JsonKey(name: 'show_amount') bool showAmount,
    @JsonKey(name: 'default_color') String defaultColor,
    @JsonKey(name: 'logo_position') List<String> logoPosition,
    @JsonKey(name: 'amount_position') List<String> amountPosition,
  });
}

/// @nodoc
class _$MobileCardDesignPropCopyWithImpl<
  $Res,
  $Val extends MobileCardDesignProp
>
    implements $MobileCardDesignPropCopyWith<$Res> {
  _$MobileCardDesignPropCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MobileCardDesignProp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? showAmount = null,
    Object? defaultColor = null,
    Object? logoPosition = null,
    Object? amountPosition = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            showAmount: null == showAmount
                ? _value.showAmount
                : showAmount // ignore: cast_nullable_to_non_nullable
                      as bool,
            defaultColor: null == defaultColor
                ? _value.defaultColor
                : defaultColor // ignore: cast_nullable_to_non_nullable
                      as String,
            logoPosition: null == logoPosition
                ? _value.logoPosition
                : logoPosition // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            amountPosition: null == amountPosition
                ? _value.amountPosition
                : amountPosition // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MobileCardDesignPropImplCopyWith<$Res>
    implements $MobileCardDesignPropCopyWith<$Res> {
  factory _$$MobileCardDesignPropImplCopyWith(
    _$MobileCardDesignPropImpl value,
    $Res Function(_$MobileCardDesignPropImpl) then,
  ) = __$$MobileCardDesignPropImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String type,
    @JsonKey(name: 'show_amount') bool showAmount,
    @JsonKey(name: 'default_color') String defaultColor,
    @JsonKey(name: 'logo_position') List<String> logoPosition,
    @JsonKey(name: 'amount_position') List<String> amountPosition,
  });
}

/// @nodoc
class __$$MobileCardDesignPropImplCopyWithImpl<$Res>
    extends _$MobileCardDesignPropCopyWithImpl<$Res, _$MobileCardDesignPropImpl>
    implements _$$MobileCardDesignPropImplCopyWith<$Res> {
  __$$MobileCardDesignPropImplCopyWithImpl(
    _$MobileCardDesignPropImpl _value,
    $Res Function(_$MobileCardDesignPropImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MobileCardDesignProp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? showAmount = null,
    Object? defaultColor = null,
    Object? logoPosition = null,
    Object? amountPosition = null,
  }) {
    return _then(
      _$MobileCardDesignPropImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        showAmount: null == showAmount
            ? _value.showAmount
            : showAmount // ignore: cast_nullable_to_non_nullable
                  as bool,
        defaultColor: null == defaultColor
            ? _value.defaultColor
            : defaultColor // ignore: cast_nullable_to_non_nullable
                  as String,
        logoPosition: null == logoPosition
            ? _value._logoPosition
            : logoPosition // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        amountPosition: null == amountPosition
            ? _value._amountPosition
            : amountPosition // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MobileCardDesignPropImpl implements _MobileCardDesignProp {
  const _$MobileCardDesignPropImpl({
    this.type = '',
    @JsonKey(name: 'show_amount') this.showAmount = false,
    @JsonKey(name: 'default_color') this.defaultColor = '',
    @JsonKey(name: 'logo_position') final List<String> logoPosition = const [],
    @JsonKey(name: 'amount_position')
    final List<String> amountPosition = const [],
  }) : _logoPosition = logoPosition,
       _amountPosition = amountPosition;

  factory _$MobileCardDesignPropImpl.fromJson(Map<String, dynamic> json) =>
      _$$MobileCardDesignPropImplFromJson(json);

  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey(name: 'show_amount')
  final bool showAmount;
  @override
  @JsonKey(name: 'default_color')
  final String defaultColor;
  final List<String> _logoPosition;
  @override
  @JsonKey(name: 'logo_position')
  List<String> get logoPosition {
    if (_logoPosition is EqualUnmodifiableListView) return _logoPosition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logoPosition);
  }

  final List<String> _amountPosition;
  @override
  @JsonKey(name: 'amount_position')
  List<String> get amountPosition {
    if (_amountPosition is EqualUnmodifiableListView) return _amountPosition;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_amountPosition);
  }

  @override
  String toString() {
    return 'MobileCardDesignProp(type: $type, showAmount: $showAmount, defaultColor: $defaultColor, logoPosition: $logoPosition, amountPosition: $amountPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MobileCardDesignPropImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.showAmount, showAmount) ||
                other.showAmount == showAmount) &&
            (identical(other.defaultColor, defaultColor) ||
                other.defaultColor == defaultColor) &&
            const DeepCollectionEquality().equals(
              other._logoPosition,
              _logoPosition,
            ) &&
            const DeepCollectionEquality().equals(
              other._amountPosition,
              _amountPosition,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    showAmount,
    defaultColor,
    const DeepCollectionEquality().hash(_logoPosition),
    const DeepCollectionEquality().hash(_amountPosition),
  );

  /// Create a copy of MobileCardDesignProp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MobileCardDesignPropImplCopyWith<_$MobileCardDesignPropImpl>
  get copyWith =>
      __$$MobileCardDesignPropImplCopyWithImpl<_$MobileCardDesignPropImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MobileCardDesignPropImplToJson(this);
  }
}

abstract class _MobileCardDesignProp implements MobileCardDesignProp {
  const factory _MobileCardDesignProp({
    final String type,
    @JsonKey(name: 'show_amount') final bool showAmount,
    @JsonKey(name: 'default_color') final String defaultColor,
    @JsonKey(name: 'logo_position') final List<String> logoPosition,
    @JsonKey(name: 'amount_position') final List<String> amountPosition,
  }) = _$MobileCardDesignPropImpl;

  factory _MobileCardDesignProp.fromJson(Map<String, dynamic> json) =
      _$MobileCardDesignPropImpl.fromJson;

  @override
  String get type;
  @override
  @JsonKey(name: 'show_amount')
  bool get showAmount;
  @override
  @JsonKey(name: 'default_color')
  String get defaultColor;
  @override
  @JsonKey(name: 'logo_position')
  List<String> get logoPosition;
  @override
  @JsonKey(name: 'amount_position')
  List<String> get amountPosition;

  /// Create a copy of MobileCardDesignProp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MobileCardDesignPropImplCopyWith<_$MobileCardDesignPropImpl>
  get copyWith => throw _privateConstructorUsedError;
}
