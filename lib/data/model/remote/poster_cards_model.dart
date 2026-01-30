import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core_module/core/model/local/base_object.dart';
part 'poster_cards_model.g.dart';

part 'poster_cards_model.freezed.dart';


@freezed
class PosterCardsModel extends BaseObject with _$PosterCardsModel {
const factory PosterCardsModel({
  @Default('') String title,
  @Default('') String description,
  @Default('') String asset,

}) = _PosterCardsModel;

  factory PosterCardsModel.fromJson(Map<String, dynamic> json) =>
      _$PosterCardsModelFromJson(json);
}
