// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Person _$PersonFromJson(Map<String, dynamic> json) {
  return _Person.fromJson(json);
}

/// @nodoc
mixin _$Person {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender_name')
  String get gendeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender_id')
  String get genderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'other_names')
  String get otherNames => throw _privateConstructorUsedError;
  @JsonKey(name: 'person_id')
  int get personId => throw _privateConstructorUsedError;
  @JsonKey(name: 'person_type_id')
  int get personTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'person_type')
  String get personType => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  @JsonKey(name: 'phone')
  String get phone => throw _privateConstructorUsedError;
  String get surname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_pic_url')
  String get profilePicUrl => throw _privateConstructorUsedError;
  CountryModel get country => throw _privateConstructorUsedError;

  /// Serializes this Person to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonCopyWith<Person> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonCopyWith<$Res> {
  factory $PersonCopyWith(Person value, $Res Function(Person) then) =
      _$PersonCopyWithImpl<$Res, Person>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'gender_name') String gendeName,
    @JsonKey(name: 'gender_id') String genderId,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'other_names') String otherNames,
    @JsonKey(name: 'person_id') int personId,
    @JsonKey(name: 'person_type_id') int personTypeId,
    @JsonKey(name: 'person_type') String personType,
    @JsonKey(name: 'phone_number') @JsonKey(name: 'phone') String phone,
    String surname,
    String email,
    @JsonKey(name: 'full_name') String fullName,
    @JsonKey(name: 'profile_pic_url') String profilePicUrl,
    CountryModel country,
  });

  $CountryModelCopyWith<$Res> get country;
}

/// @nodoc
class _$PersonCopyWithImpl<$Res, $Val extends Person>
    implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gendeName = null,
    Object? genderId = null,
    Object? firstName = null,
    Object? otherNames = null,
    Object? personId = null,
    Object? personTypeId = null,
    Object? personType = null,
    Object? phone = null,
    Object? surname = null,
    Object? email = null,
    Object? fullName = null,
    Object? profilePicUrl = null,
    Object? country = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            gendeName: null == gendeName
                ? _value.gendeName
                : gendeName // ignore: cast_nullable_to_non_nullable
                      as String,
            genderId: null == genderId
                ? _value.genderId
                : genderId // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            otherNames: null == otherNames
                ? _value.otherNames
                : otherNames // ignore: cast_nullable_to_non_nullable
                      as String,
            personId: null == personId
                ? _value.personId
                : personId // ignore: cast_nullable_to_non_nullable
                      as int,
            personTypeId: null == personTypeId
                ? _value.personTypeId
                : personTypeId // ignore: cast_nullable_to_non_nullable
                      as int,
            personType: null == personType
                ? _value.personType
                : personType // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            surname: null == surname
                ? _value.surname
                : surname // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            profilePicUrl: null == profilePicUrl
                ? _value.profilePicUrl
                : profilePicUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            country: null == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                      as CountryModel,
          )
          as $Val,
    );
  }

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CountryModelCopyWith<$Res> get country {
    return $CountryModelCopyWith<$Res>(_value.country, (value) {
      return _then(_value.copyWith(country: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PersonImplCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$$PersonImplCopyWith(
    _$PersonImpl value,
    $Res Function(_$PersonImpl) then,
  ) = __$$PersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'gender_name') String gendeName,
    @JsonKey(name: 'gender_id') String genderId,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'other_names') String otherNames,
    @JsonKey(name: 'person_id') int personId,
    @JsonKey(name: 'person_type_id') int personTypeId,
    @JsonKey(name: 'person_type') String personType,
    @JsonKey(name: 'phone_number') @JsonKey(name: 'phone') String phone,
    String surname,
    String email,
    @JsonKey(name: 'full_name') String fullName,
    @JsonKey(name: 'profile_pic_url') String profilePicUrl,
    CountryModel country,
  });

  @override
  $CountryModelCopyWith<$Res> get country;
}

/// @nodoc
class __$$PersonImplCopyWithImpl<$Res>
    extends _$PersonCopyWithImpl<$Res, _$PersonImpl>
    implements _$$PersonImplCopyWith<$Res> {
  __$$PersonImplCopyWithImpl(
    _$PersonImpl _value,
    $Res Function(_$PersonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gendeName = null,
    Object? genderId = null,
    Object? firstName = null,
    Object? otherNames = null,
    Object? personId = null,
    Object? personTypeId = null,
    Object? personType = null,
    Object? phone = null,
    Object? surname = null,
    Object? email = null,
    Object? fullName = null,
    Object? profilePicUrl = null,
    Object? country = null,
  }) {
    return _then(
      _$PersonImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        gendeName: null == gendeName
            ? _value.gendeName
            : gendeName // ignore: cast_nullable_to_non_nullable
                  as String,
        genderId: null == genderId
            ? _value.genderId
            : genderId // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        otherNames: null == otherNames
            ? _value.otherNames
            : otherNames // ignore: cast_nullable_to_non_nullable
                  as String,
        personId: null == personId
            ? _value.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as int,
        personTypeId: null == personTypeId
            ? _value.personTypeId
            : personTypeId // ignore: cast_nullable_to_non_nullable
                  as int,
        personType: null == personType
            ? _value.personType
            : personType // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        surname: null == surname
            ? _value.surname
            : surname // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        profilePicUrl: null == profilePicUrl
            ? _value.profilePicUrl
            : profilePicUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        country: null == country
            ? _value.country
            : country // ignore: cast_nullable_to_non_nullable
                  as CountryModel,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonImpl implements _Person {
  const _$PersonImpl({
    this.id = 0,
    @JsonKey(name: 'gender_name') this.gendeName = '',
    @JsonKey(name: 'gender_id') this.genderId = '',
    @JsonKey(name: 'first_name') this.firstName = '',
    @JsonKey(name: 'other_names') this.otherNames = '',
    @JsonKey(name: 'person_id') this.personId = 0,
    @JsonKey(name: 'person_type_id') this.personTypeId = 0,
    @JsonKey(name: 'person_type') this.personType = '',
    @JsonKey(name: 'phone_number') @JsonKey(name: 'phone') this.phone = '',
    this.surname = '',
    this.email = '',
    @JsonKey(name: 'full_name') this.fullName = '',
    @JsonKey(name: 'profile_pic_url') this.profilePicUrl = '',
    this.country = const CountryModel(),
  });

  factory _$PersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'gender_name')
  final String gendeName;
  @override
  @JsonKey(name: 'gender_id')
  final String genderId;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'other_names')
  final String otherNames;
  @override
  @JsonKey(name: 'person_id')
  final int personId;
  @override
  @JsonKey(name: 'person_type_id')
  final int personTypeId;
  @override
  @JsonKey(name: 'person_type')
  final String personType;
  @override
  @JsonKey(name: 'phone_number')
  @JsonKey(name: 'phone')
  final String phone;
  @override
  @JsonKey()
  final String surname;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  @JsonKey(name: 'profile_pic_url')
  final String profilePicUrl;
  @override
  @JsonKey()
  final CountryModel country;

  @override
  String toString() {
    return 'Person(id: $id, gendeName: $gendeName, genderId: $genderId, firstName: $firstName, otherNames: $otherNames, personId: $personId, personTypeId: $personTypeId, personType: $personType, phone: $phone, surname: $surname, email: $email, fullName: $fullName, profilePicUrl: $profilePicUrl, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gendeName, gendeName) ||
                other.gendeName == gendeName) &&
            (identical(other.genderId, genderId) ||
                other.genderId == genderId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.otherNames, otherNames) ||
                other.otherNames == otherNames) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.personTypeId, personTypeId) ||
                other.personTypeId == personTypeId) &&
            (identical(other.personType, personType) ||
                other.personType == personType) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.profilePicUrl, profilePicUrl) ||
                other.profilePicUrl == profilePicUrl) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    gendeName,
    genderId,
    firstName,
    otherNames,
    personId,
    personTypeId,
    personType,
    phone,
    surname,
    email,
    fullName,
    profilePicUrl,
    country,
  );

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      __$$PersonImplCopyWithImpl<_$PersonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonImplToJson(this);
  }
}

abstract class _Person implements Person {
  const factory _Person({
    final int id,
    @JsonKey(name: 'gender_name') final String gendeName,
    @JsonKey(name: 'gender_id') final String genderId,
    @JsonKey(name: 'first_name') final String firstName,
    @JsonKey(name: 'other_names') final String otherNames,
    @JsonKey(name: 'person_id') final int personId,
    @JsonKey(name: 'person_type_id') final int personTypeId,
    @JsonKey(name: 'person_type') final String personType,
    @JsonKey(name: 'phone_number') @JsonKey(name: 'phone') final String phone,
    final String surname,
    final String email,
    @JsonKey(name: 'full_name') final String fullName,
    @JsonKey(name: 'profile_pic_url') final String profilePicUrl,
    final CountryModel country,
  }) = _$PersonImpl;

  factory _Person.fromJson(Map<String, dynamic> json) = _$PersonImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'gender_name')
  String get gendeName;
  @override
  @JsonKey(name: 'gender_id')
  String get genderId;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'other_names')
  String get otherNames;
  @override
  @JsonKey(name: 'person_id')
  int get personId;
  @override
  @JsonKey(name: 'person_type_id')
  int get personTypeId;
  @override
  @JsonKey(name: 'person_type')
  String get personType;
  @override
  @JsonKey(name: 'phone_number')
  @JsonKey(name: 'phone')
  String get phone;
  @override
  String get surname;
  @override
  String get email;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  @JsonKey(name: 'profile_pic_url')
  String get profilePicUrl;
  @override
  CountryModel get country;

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
