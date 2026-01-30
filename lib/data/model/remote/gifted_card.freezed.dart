// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gifted_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GiftedCard _$GiftedCardFromJson(Map<String, dynamic> json) {
  return _GiftedCard.fromJson(json);
}

/// @nodoc
mixin _$GiftedCard {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduled_date')
  String get scheduledDate => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Giver get giver => throw _privateConstructorUsedError;
  Giver get recipient => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  CardAccount get account => throw _privateConstructorUsedError;
  FeedbackModel? get feedback => throw _privateConstructorUsedError;

  /// Serializes this GiftedCard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GiftedCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GiftedCardCopyWith<GiftedCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftedCardCopyWith<$Res> {
  factory $GiftedCardCopyWith(
    GiftedCard value,
    $Res Function(GiftedCard) then,
  ) = _$GiftedCardCopyWithImpl<$Res, GiftedCard>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'scheduled_date') String scheduledDate,
    String message,
    Giver giver,
    Giver recipient,
    @JsonKey(name: 'created_at') String createdAt,
    CardAccount account,
    FeedbackModel? feedback,
  });

  $GiverCopyWith<$Res> get giver;
  $GiverCopyWith<$Res> get recipient;
  $CardAccountCopyWith<$Res> get account;
  $FeedbackModelCopyWith<$Res>? get feedback;
}

/// @nodoc
class _$GiftedCardCopyWithImpl<$Res, $Val extends GiftedCard>
    implements $GiftedCardCopyWith<$Res> {
  _$GiftedCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GiftedCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? scheduledDate = null,
    Object? message = null,
    Object? giver = null,
    Object? recipient = null,
    Object? createdAt = null,
    Object? account = null,
    Object? feedback = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            scheduledDate: null == scheduledDate
                ? _value.scheduledDate
                : scheduledDate // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            giver: null == giver
                ? _value.giver
                : giver // ignore: cast_nullable_to_non_nullable
                      as Giver,
            recipient: null == recipient
                ? _value.recipient
                : recipient // ignore: cast_nullable_to_non_nullable
                      as Giver,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            account: null == account
                ? _value.account
                : account // ignore: cast_nullable_to_non_nullable
                      as CardAccount,
            feedback: freezed == feedback
                ? _value.feedback
                : feedback // ignore: cast_nullable_to_non_nullable
                      as FeedbackModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of GiftedCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GiverCopyWith<$Res> get giver {
    return $GiverCopyWith<$Res>(_value.giver, (value) {
      return _then(_value.copyWith(giver: value) as $Val);
    });
  }

  /// Create a copy of GiftedCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GiverCopyWith<$Res> get recipient {
    return $GiverCopyWith<$Res>(_value.recipient, (value) {
      return _then(_value.copyWith(recipient: value) as $Val);
    });
  }

  /// Create a copy of GiftedCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardAccountCopyWith<$Res> get account {
    return $CardAccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }

  /// Create a copy of GiftedCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FeedbackModelCopyWith<$Res>? get feedback {
    if (_value.feedback == null) {
      return null;
    }

    return $FeedbackModelCopyWith<$Res>(_value.feedback!, (value) {
      return _then(_value.copyWith(feedback: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GiftedCardImplCopyWith<$Res>
    implements $GiftedCardCopyWith<$Res> {
  factory _$$GiftedCardImplCopyWith(
    _$GiftedCardImpl value,
    $Res Function(_$GiftedCardImpl) then,
  ) = __$$GiftedCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'scheduled_date') String scheduledDate,
    String message,
    Giver giver,
    Giver recipient,
    @JsonKey(name: 'created_at') String createdAt,
    CardAccount account,
    FeedbackModel? feedback,
  });

  @override
  $GiverCopyWith<$Res> get giver;
  @override
  $GiverCopyWith<$Res> get recipient;
  @override
  $CardAccountCopyWith<$Res> get account;
  @override
  $FeedbackModelCopyWith<$Res>? get feedback;
}

/// @nodoc
class __$$GiftedCardImplCopyWithImpl<$Res>
    extends _$GiftedCardCopyWithImpl<$Res, _$GiftedCardImpl>
    implements _$$GiftedCardImplCopyWith<$Res> {
  __$$GiftedCardImplCopyWithImpl(
    _$GiftedCardImpl _value,
    $Res Function(_$GiftedCardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GiftedCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? scheduledDate = null,
    Object? message = null,
    Object? giver = null,
    Object? recipient = null,
    Object? createdAt = null,
    Object? account = null,
    Object? feedback = freezed,
  }) {
    return _then(
      _$GiftedCardImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        scheduledDate: null == scheduledDate
            ? _value.scheduledDate
            : scheduledDate // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        giver: null == giver
            ? _value.giver
            : giver // ignore: cast_nullable_to_non_nullable
                  as Giver,
        recipient: null == recipient
            ? _value.recipient
            : recipient // ignore: cast_nullable_to_non_nullable
                  as Giver,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        account: null == account
            ? _value.account
            : account // ignore: cast_nullable_to_non_nullable
                  as CardAccount,
        feedback: freezed == feedback
            ? _value.feedback
            : feedback // ignore: cast_nullable_to_non_nullable
                  as FeedbackModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GiftedCardImpl implements _GiftedCard {
  const _$GiftedCardImpl({
    this.id = 0,
    @JsonKey(name: 'scheduled_date') this.scheduledDate = '',
    this.message = '',
    this.giver = const Giver(),
    this.recipient = const Giver(),
    @JsonKey(name: 'created_at') this.createdAt = '',
    this.account = const CardAccount(),
    this.feedback,
  });

  factory _$GiftedCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiftedCardImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'scheduled_date')
  final String scheduledDate;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final Giver giver;
  @override
  @JsonKey()
  final Giver recipient;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey()
  final CardAccount account;
  @override
  final FeedbackModel? feedback;

  @override
  String toString() {
    return 'GiftedCard(id: $id, scheduledDate: $scheduledDate, message: $message, giver: $giver, recipient: $recipient, createdAt: $createdAt, account: $account, feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftedCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.giver, giver) || other.giver == giver) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    scheduledDate,
    message,
    giver,
    recipient,
    createdAt,
    account,
    feedback,
  );

  /// Create a copy of GiftedCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftedCardImplCopyWith<_$GiftedCardImpl> get copyWith =>
      __$$GiftedCardImplCopyWithImpl<_$GiftedCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiftedCardImplToJson(this);
  }
}

abstract class _GiftedCard implements GiftedCard {
  const factory _GiftedCard({
    final int id,
    @JsonKey(name: 'scheduled_date') final String scheduledDate,
    final String message,
    final Giver giver,
    final Giver recipient,
    @JsonKey(name: 'created_at') final String createdAt,
    final CardAccount account,
    final FeedbackModel? feedback,
  }) = _$GiftedCardImpl;

  factory _GiftedCard.fromJson(Map<String, dynamic> json) =
      _$GiftedCardImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'scheduled_date')
  String get scheduledDate;
  @override
  String get message;
  @override
  Giver get giver;
  @override
  Giver get recipient;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  CardAccount get account;
  @override
  FeedbackModel? get feedback;

  /// Create a copy of GiftedCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GiftedCardImplCopyWith<_$GiftedCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
