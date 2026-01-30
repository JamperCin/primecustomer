import 'package:primecustomer/data/model/remote/coordinates.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    @Default(0) int id,
    @Default(0.0) double distance,
    @JsonKey(name: 'is_default') @Default(false) bool isDefault,
    @JsonKey(name: 'user_id') @Default(0) int userId,
    @JsonKey(name: 'person_id') @Default(0) int personId,
    @Default(false) bool isWithinRange,
    @Default(false) bool isSelected,
    @Default(false) bool archived,
    @Default('') String latitude,
    @Default('') String longitude,
    @JsonKey(name: 'full_name') @Default('') String name,
    @JsonKey(name: 'location_name') @Default('') String locationName,
    @JsonKey(name: 'residential_address')
    @Default('')
    String residentialAddress,
    @JsonKey(name: 'phone_number') @Default('') String phone,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @Default(Coordinates()) Coordinates coordinate,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
