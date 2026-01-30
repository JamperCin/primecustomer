// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'e_fund_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EfundRequestModel _$EfundRequestModelFromJson(Map<String, dynamic> json) {
  return _EfundRequestModel.fromJson(json);
}

/// @nodoc
mixin _$EfundRequestModel {
  int get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "state")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "total_amount")
  String get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  Customer get requester => throw _privateConstructorUsedError;
  @JsonKey(name: "potential_funders")
  List<Customer> get potentialFunders => throw _privateConstructorUsedError;
  List<Customer> get funders => throw _privateConstructorUsedError;
  List<EfundCardModel> get items => throw _privateConstructorUsedError;

  /// Serializes this EfundRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EfundRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EfundRequestModelCopyWith<EfundRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EfundRequestModelCopyWith<$Res> {
  factory $EfundRequestModelCopyWith(
    EfundRequestModel value,
    $Res Function(EfundRequestModel) then,
  ) = _$EfundRequestModelCopyWithImpl<$Res, EfundRequestModel>;
  @useResult
  $Res call({
    int id,
    String message,
    @JsonKey(name: "state") String status,
    @JsonKey(name: "total_amount") String totalAmount,
    @JsonKey(name: "created_at") String createdAt,
    Customer requester,
    @JsonKey(name: "potential_funders") List<Customer> potentialFunders,
    List<Customer> funders,
    List<EfundCardModel> items,
  });

  $CustomerCopyWith<$Res> get requester;
}

/// @nodoc
class _$EfundRequestModelCopyWithImpl<$Res, $Val extends EfundRequestModel>
    implements $EfundRequestModelCopyWith<$Res> {
  _$EfundRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EfundRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? status = null,
    Object? totalAmount = null,
    Object? createdAt = null,
    Object? requester = null,
    Object? potentialFunders = null,
    Object? funders = null,
    Object? items = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            totalAmount: null == totalAmount
                ? _value.totalAmount
                : totalAmount // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            requester: null == requester
                ? _value.requester
                : requester // ignore: cast_nullable_to_non_nullable
                      as Customer,
            potentialFunders: null == potentialFunders
                ? _value.potentialFunders
                : potentialFunders // ignore: cast_nullable_to_non_nullable
                      as List<Customer>,
            funders: null == funders
                ? _value.funders
                : funders // ignore: cast_nullable_to_non_nullable
                      as List<Customer>,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<EfundCardModel>,
          )
          as $Val,
    );
  }

  /// Create a copy of EfundRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get requester {
    return $CustomerCopyWith<$Res>(_value.requester, (value) {
      return _then(_value.copyWith(requester: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EfundRequestModelImplCopyWith<$Res>
    implements $EfundRequestModelCopyWith<$Res> {
  factory _$$EfundRequestModelImplCopyWith(
    _$EfundRequestModelImpl value,
    $Res Function(_$EfundRequestModelImpl) then,
  ) = __$$EfundRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String message,
    @JsonKey(name: "state") String status,
    @JsonKey(name: "total_amount") String totalAmount,
    @JsonKey(name: "created_at") String createdAt,
    Customer requester,
    @JsonKey(name: "potential_funders") List<Customer> potentialFunders,
    List<Customer> funders,
    List<EfundCardModel> items,
  });

  @override
  $CustomerCopyWith<$Res> get requester;
}

/// @nodoc
class __$$EfundRequestModelImplCopyWithImpl<$Res>
    extends _$EfundRequestModelCopyWithImpl<$Res, _$EfundRequestModelImpl>
    implements _$$EfundRequestModelImplCopyWith<$Res> {
  __$$EfundRequestModelImplCopyWithImpl(
    _$EfundRequestModelImpl _value,
    $Res Function(_$EfundRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EfundRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? status = null,
    Object? totalAmount = null,
    Object? createdAt = null,
    Object? requester = null,
    Object? potentialFunders = null,
    Object? funders = null,
    Object? items = null,
  }) {
    return _then(
      _$EfundRequestModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        totalAmount: null == totalAmount
            ? _value.totalAmount
            : totalAmount // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        requester: null == requester
            ? _value.requester
            : requester // ignore: cast_nullable_to_non_nullable
                  as Customer,
        potentialFunders: null == potentialFunders
            ? _value._potentialFunders
            : potentialFunders // ignore: cast_nullable_to_non_nullable
                  as List<Customer>,
        funders: null == funders
            ? _value._funders
            : funders // ignore: cast_nullable_to_non_nullable
                  as List<Customer>,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<EfundCardModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EfundRequestModelImpl implements _EfundRequestModel {
  const _$EfundRequestModelImpl({
    this.id = 0,
    this.message = "",
    @JsonKey(name: "state") this.status = "",
    @JsonKey(name: "total_amount") this.totalAmount = "0.0",
    @JsonKey(name: "created_at") this.createdAt = "",
    this.requester = const Customer(),
    @JsonKey(name: "potential_funders")
    final List<Customer> potentialFunders = const [],
    final List<Customer> funders = const [],
    final List<EfundCardModel> items = const [],
  }) : _potentialFunders = potentialFunders,
       _funders = funders,
       _items = items;

  factory _$EfundRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EfundRequestModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey(name: "state")
  final String status;
  @override
  @JsonKey(name: "total_amount")
  final String totalAmount;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey()
  final Customer requester;
  final List<Customer> _potentialFunders;
  @override
  @JsonKey(name: "potential_funders")
  List<Customer> get potentialFunders {
    if (_potentialFunders is EqualUnmodifiableListView)
      return _potentialFunders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_potentialFunders);
  }

  final List<Customer> _funders;
  @override
  @JsonKey()
  List<Customer> get funders {
    if (_funders is EqualUnmodifiableListView) return _funders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_funders);
  }

  final List<EfundCardModel> _items;
  @override
  @JsonKey()
  List<EfundCardModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'EfundRequestModel(id: $id, message: $message, status: $status, totalAmount: $totalAmount, createdAt: $createdAt, requester: $requester, potentialFunders: $potentialFunders, funders: $funders, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EfundRequestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.requester, requester) ||
                other.requester == requester) &&
            const DeepCollectionEquality().equals(
              other._potentialFunders,
              _potentialFunders,
            ) &&
            const DeepCollectionEquality().equals(other._funders, _funders) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    message,
    status,
    totalAmount,
    createdAt,
    requester,
    const DeepCollectionEquality().hash(_potentialFunders),
    const DeepCollectionEquality().hash(_funders),
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of EfundRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EfundRequestModelImplCopyWith<_$EfundRequestModelImpl> get copyWith =>
      __$$EfundRequestModelImplCopyWithImpl<_$EfundRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EfundRequestModelImplToJson(this);
  }
}

abstract class _EfundRequestModel implements EfundRequestModel {
  const factory _EfundRequestModel({
    final int id,
    final String message,
    @JsonKey(name: "state") final String status,
    @JsonKey(name: "total_amount") final String totalAmount,
    @JsonKey(name: "created_at") final String createdAt,
    final Customer requester,
    @JsonKey(name: "potential_funders") final List<Customer> potentialFunders,
    final List<Customer> funders,
    final List<EfundCardModel> items,
  }) = _$EfundRequestModelImpl;

  factory _EfundRequestModel.fromJson(Map<String, dynamic> json) =
      _$EfundRequestModelImpl.fromJson;

  @override
  int get id;
  @override
  String get message;
  @override
  @JsonKey(name: "state")
  String get status;
  @override
  @JsonKey(name: "total_amount")
  String get totalAmount;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  Customer get requester;
  @override
  @JsonKey(name: "potential_funders")
  List<Customer> get potentialFunders;
  @override
  List<Customer> get funders;
  @override
  List<EfundCardModel> get items;

  /// Create a copy of EfundRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EfundRequestModelImplCopyWith<_$EfundRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
