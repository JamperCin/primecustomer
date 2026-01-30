import 'package:freezed_annotation/freezed_annotation.dart';

import 'person.dart';

part 'giver.freezed.dart';
part 'giver.g.dart';

@freezed
class Giver with _$Giver {
  const factory Giver({
    @Default(0) int id,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String username,
    Person? person,
  }) = _Giver;

  factory Giver.fromJson(Map<String, dynamic> json) => _$GiverFromJson(json);
}
