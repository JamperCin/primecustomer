// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'giver.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Giver _$GiverFromJson(Map<String, dynamic> json) {
  return _Giver.fromJson(json);
}

/// @nodoc
mixin _$Giver {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  Person? get person => throw _privateConstructorUsedError;

  /// Serializes this Giver to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Giver
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GiverCopyWith<Giver> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiverCopyWith<$Res> {
  factory $GiverCopyWith(Giver value, $Res Function(Giver) then) =
      _$GiverCopyWithImpl<$Res, Giver>;
  @useResult
  $Res call({
    int id,
    String email,
    String phone,
    String username,
    Person? person,
  });

  $PersonCopyWith<$Res>? get person;
}

/// @nodoc
class _$GiverCopyWithImpl<$Res, $Val extends Giver>
    implements $GiverCopyWith<$Res> {
  _$GiverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Giver
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? phone = null,
    Object? username = null,
    Object? person = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            person: freezed == person
                ? _value.person
                : person // ignore: cast_nullable_to_non_nullable
                      as Person?,
          )
          as $Val,
    );
  }

  /// Create a copy of Giver
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res>? get person {
    if (_value.person == null) {
      return null;
    }

    return $PersonCopyWith<$Res>(_value.person!, (value) {
      return _then(_value.copyWith(person: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GiverImplCopyWith<$Res> implements $GiverCopyWith<$Res> {
  factory _$$GiverImplCopyWith(
    _$GiverImpl value,
    $Res Function(_$GiverImpl) then,
  ) = __$$GiverImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String email,
    String phone,
    String username,
    Person? person,
  });

  @override
  $PersonCopyWith<$Res>? get person;
}

/// @nodoc
class __$$GiverImplCopyWithImpl<$Res>
    extends _$GiverCopyWithImpl<$Res, _$GiverImpl>
    implements _$$GiverImplCopyWith<$Res> {
  __$$GiverImplCopyWithImpl(
    _$GiverImpl _value,
    $Res Function(_$GiverImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Giver
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? phone = null,
    Object? username = null,
    Object? person = freezed,
  }) {
    return _then(
      _$GiverImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        person: freezed == person
            ? _value.person
            : person // ignore: cast_nullable_to_non_nullable
                  as Person?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GiverImpl implements _Giver {
  const _$GiverImpl({
    this.id = 0,
    this.email = '',
    this.phone = '',
    this.username = '',
    this.person,
  });

  factory _$GiverImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiverImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final String username;
  @override
  final Person? person;

  @override
  String toString() {
    return 'Giver(id: $id, email: $email, phone: $phone, username: $username, person: $person)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiverImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.person, person) || other.person == person));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, phone, username, person);

  /// Create a copy of Giver
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GiverImplCopyWith<_$GiverImpl> get copyWith =>
      __$$GiverImplCopyWithImpl<_$GiverImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiverImplToJson(this);
  }
}

abstract class _Giver implements Giver {
  const factory _Giver({
    final int id,
    final String email,
    final String phone,
    final String username,
    final Person? person,
  }) = _$GiverImpl;

  factory _Giver.fromJson(Map<String, dynamic> json) = _$GiverImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get username;
  @override
  Person? get person;

  /// Create a copy of Giver
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GiverImplCopyWith<_$GiverImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
