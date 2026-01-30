// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonImpl _$$PersonImplFromJson(Map<String, dynamic> json) => _$PersonImpl(
  id: (json['id'] as num?)?.toInt() ?? 0,
  gendeName: json['gender_name'] as String? ?? '',
  genderId: json['gender_id'] as String? ?? '',
  firstName: json['first_name'] as String? ?? '',
  otherNames: json['other_names'] as String? ?? '',
  personId: (json['person_id'] as num?)?.toInt() ?? 0,
  personTypeId: (json['person_type_id'] as num?)?.toInt() ?? 0,
  personType: json['person_type'] as String? ?? '',
  phone: json['phone_number'] as String? ?? '',
  surname: json['surname'] as String? ?? '',
  email: json['email'] as String? ?? '',
  fullName: json['full_name'] as String? ?? '',
  profilePicUrl: json['profile_pic_url'] as String? ?? '',
  country: json['country'] == null
      ? const CountryModel()
      : CountryModel.fromJson(json['country'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$PersonImplToJson(_$PersonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gender_name': instance.gendeName,
      'gender_id': instance.genderId,
      'first_name': instance.firstName,
      'other_names': instance.otherNames,
      'person_id': instance.personId,
      'person_type_id': instance.personTypeId,
      'person_type': instance.personType,
      'phone_number': instance.phone,
      'surname': instance.surname,
      'email': instance.email,
      'full_name': instance.fullName,
      'profile_pic_url': instance.profilePicUrl,
      'country': instance.country,
    };
