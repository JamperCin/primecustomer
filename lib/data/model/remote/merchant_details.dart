import 'package:primecustomer/data/model/remote/coordinates.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_details.freezed.dart';
part 'merchant_details.g.dart';

@freezed
class MerchantDetails with _$MerchantDetails {
  const factory MerchantDetails({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String code,
    // @Default('') String location,
    @Default('') String telephone,
    @Default('') String description,
    @Default(false) bool verified,
    @JsonKey(name: 'logo_url') @Default('') String logoUrl,
    @JsonKey(name: 'website_url') @Default('') String webSiteUrl,
    @JsonKey(name: 'registration_number') @Default('') String registrationNum,
    @JsonKey(name: 'min_card_price') @Default(0) double minPrice,
    @JsonKey(name: 'max_card_price') @Default(0) double maxPrice,
    @JsonKey(name: 'cordinates') Coordinates? coordinates,
  }) = _MerchantDetails;

  factory MerchantDetails.fromJson(Map<String, dynamic> json) =>
      _$MerchantDetailsFromJson(json);
}
