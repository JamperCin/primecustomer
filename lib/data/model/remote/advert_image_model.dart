import 'package:freezed_annotation/freezed_annotation.dart';

part 'advert_image_model.freezed.dart';
part 'advert_image_model.g.dart';

@freezed
class AdvertImageModel with _$AdvertImageModel {
  const factory AdvertImageModel({
    required int id,
    @Default('') String url,
    @JsonKey(name: 'ad_type') @Default('') String adType,
  }) = _AdvertImageModel;

  factory AdvertImageModel.fromJson(Map<String, dynamic> json) =>
      _$AdvertImageModelFromJson(json);
}
