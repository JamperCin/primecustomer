import 'package:freezed_annotation/freezed_annotation.dart';

import 'country_model.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    @Default(0) int id,
    @JsonKey(name: 'gender_name') @Default('') String gendeName,
    @JsonKey(name: 'gender_id') @Default('') String genderId,
    @JsonKey(name: 'first_name') @Default('') String firstName,
    @JsonKey(name: 'other_names') @Default('') String otherNames,
    @JsonKey(name: 'person_id') @Default(0) int personId,
    @JsonKey(name: 'person_type_id') @Default(0) int personTypeId,
    @JsonKey(name: 'person_type') @Default('') String personType,
    @JsonKey(name: 'phone_number')
    @JsonKey(name: 'phone')
    @Default('')
        String phone,
    @Default('') String surname,
    @Default('') String email,
    @JsonKey(name: 'full_name') @Default('') String fullName,
    @JsonKey(name: 'profile_pic_url') @Default('') String profilePicUrl,
    @Default(CountryModel()) CountryModel country,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
