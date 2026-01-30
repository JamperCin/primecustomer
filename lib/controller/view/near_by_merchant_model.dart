import 'package:primecustomer/data/model/remote/merchant_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'near_by_merchant_model.freezed.dart';
part 'near_by_merchant_model.g.dart';

@freezed
class NearByMerchantModel with _$NearByMerchantModel {
  const factory NearByMerchantModel({
    @Default("") String address,
    @Default("") String latitude,
    @Default("") String longitude,
    @Default(MerchantDetails()) MerchantDetails client,
  }) = _NearByMerchantModel;

  factory NearByMerchantModel.fromJson(Map<String, dynamic> json) =>
      _$NearByMerchantModelFromJson(json);
}
