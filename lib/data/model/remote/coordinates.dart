import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinates.freezed.dart';
part 'coordinates.g.dart';

@freezed
class Coordinates with _$Coordinates {
  const factory Coordinates({
    @Default(0) int id,
    @Default('') String address,
    @Default('') String latitude,
    @Default('') String longitude,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
}
