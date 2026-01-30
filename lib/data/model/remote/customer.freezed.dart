// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String get eFundPhone => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  bool get blocked => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  Person? get person => throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_token')
  String get verificationToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get joinedSince => throw _privateConstructorUsedError;

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res, Customer>;
  @useResult
  $Res call({
    int id,
    String email,
    @JsonKey(name: 'phone_number') String phoneNumber,
    @JsonKey(name: 'phone') String eFundPhone,
    String username,
    bool blocked,
    bool active,
    String company,
    Person? person,
    @JsonKey(name: 'verification_token') String verificationToken,
    @JsonKey(name: 'created_at') String joinedSince,
  });

  $PersonCopyWith<$Res>? get person;
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res, $Val extends Customer>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? eFundPhone = null,
    Object? username = null,
    Object? blocked = null,
    Object? active = null,
    Object? company = null,
    Object? person = freezed,
    Object? verificationToken = null,
    Object? joinedSince = null,
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
            phoneNumber: null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            eFundPhone: null == eFundPhone
                ? _value.eFundPhone
                : eFundPhone // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            blocked: null == blocked
                ? _value.blocked
                : blocked // ignore: cast_nullable_to_non_nullable
                      as bool,
            active: null == active
                ? _value.active
                : active // ignore: cast_nullable_to_non_nullable
                      as bool,
            company: null == company
                ? _value.company
                : company // ignore: cast_nullable_to_non_nullable
                      as String,
            person: freezed == person
                ? _value.person
                : person // ignore: cast_nullable_to_non_nullable
                      as Person?,
            verificationToken: null == verificationToken
                ? _value.verificationToken
                : verificationToken // ignore: cast_nullable_to_non_nullable
                      as String,
            joinedSince: null == joinedSince
                ? _value.joinedSince
                : joinedSince // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of Customer
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
abstract class _$$CustomerImplCopyWith<$Res>
    implements $CustomerCopyWith<$Res> {
  factory _$$CustomerImplCopyWith(
    _$CustomerImpl value,
    $Res Function(_$CustomerImpl) then,
  ) = __$$CustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String email,
    @JsonKey(name: 'phone_number') String phoneNumber,
    @JsonKey(name: 'phone') String eFundPhone,
    String username,
    bool blocked,
    bool active,
    String company,
    Person? person,
    @JsonKey(name: 'verification_token') String verificationToken,
    @JsonKey(name: 'created_at') String joinedSince,
  });

  @override
  $PersonCopyWith<$Res>? get person;
}

/// @nodoc
class __$$CustomerImplCopyWithImpl<$Res>
    extends _$CustomerCopyWithImpl<$Res, _$CustomerImpl>
    implements _$$CustomerImplCopyWith<$Res> {
  __$$CustomerImplCopyWithImpl(
    _$CustomerImpl _value,
    $Res Function(_$CustomerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? eFundPhone = null,
    Object? username = null,
    Object? blocked = null,
    Object? active = null,
    Object? company = null,
    Object? person = freezed,
    Object? verificationToken = null,
    Object? joinedSince = null,
  }) {
    return _then(
      _$CustomerImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        eFundPhone: null == eFundPhone
            ? _value.eFundPhone
            : eFundPhone // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        blocked: null == blocked
            ? _value.blocked
            : blocked // ignore: cast_nullable_to_non_nullable
                  as bool,
        active: null == active
            ? _value.active
            : active // ignore: cast_nullable_to_non_nullable
                  as bool,
        company: null == company
            ? _value.company
            : company // ignore: cast_nullable_to_non_nullable
                  as String,
        person: freezed == person
            ? _value.person
            : person // ignore: cast_nullable_to_non_nullable
                  as Person?,
        verificationToken: null == verificationToken
            ? _value.verificationToken
            : verificationToken // ignore: cast_nullable_to_non_nullable
                  as String,
        joinedSince: null == joinedSince
            ? _value.joinedSince
            : joinedSince // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerImpl implements _Customer {
  const _$CustomerImpl({
    this.id = 0,
    this.email = '',
    @JsonKey(name: 'phone_number') this.phoneNumber = '',
    @JsonKey(name: 'phone') this.eFundPhone = '',
    this.username = '',
    this.blocked = false,
    this.active = false,
    this.company = '',
    this.person,
    @JsonKey(name: 'verification_token') this.verificationToken = '',
    @JsonKey(name: 'created_at') this.joinedSince = '',
  });

  factory _$CustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  @JsonKey(name: 'phone')
  final String eFundPhone;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final bool blocked;
  @override
  @JsonKey()
  final bool active;
  @override
  @JsonKey()
  final String company;
  @override
  final Person? person;
  @override
  @JsonKey(name: 'verification_token')
  final String verificationToken;
  @override
  @JsonKey(name: 'created_at')
  final String joinedSince;

  @override
  String toString() {
    return 'Customer(id: $id, email: $email, phoneNumber: $phoneNumber, eFundPhone: $eFundPhone, username: $username, blocked: $blocked, active: $active, company: $company, person: $person, verificationToken: $verificationToken, joinedSince: $joinedSince)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.eFundPhone, eFundPhone) ||
                other.eFundPhone == eFundPhone) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.verificationToken, verificationToken) ||
                other.verificationToken == verificationToken) &&
            (identical(other.joinedSince, joinedSince) ||
                other.joinedSince == joinedSince));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    phoneNumber,
    eFundPhone,
    username,
    blocked,
    active,
    company,
    person,
    verificationToken,
    joinedSince,
  );

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      __$$CustomerImplCopyWithImpl<_$CustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerImplToJson(this);
  }
}

abstract class _Customer implements Customer {
  const factory _Customer({
    final int id,
    final String email,
    @JsonKey(name: 'phone_number') final String phoneNumber,
    @JsonKey(name: 'phone') final String eFundPhone,
    final String username,
    final bool blocked,
    final bool active,
    final String company,
    final Person? person,
    @JsonKey(name: 'verification_token') final String verificationToken,
    @JsonKey(name: 'created_at') final String joinedSince,
  }) = _$CustomerImpl;

  factory _Customer.fromJson(Map<String, dynamic> json) =
      _$CustomerImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override
  @JsonKey(name: 'phone')
  String get eFundPhone;
  @override
  String get username;
  @override
  bool get blocked;
  @override
  bool get active;
  @override
  String get company;
  @override
  Person? get person;
  @override
  @JsonKey(name: 'verification_token')
  String get verificationToken;
  @override
  @JsonKey(name: 'created_at')
  String get joinedSince;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
