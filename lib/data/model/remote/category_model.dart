import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel extends BaseObject with _$CategoryModel {
  const factory CategoryModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String description,
    @Default('') String logo,
    @JsonKey(name: "is_main") @Default(false) bool isMain,
    @Default(false) bool isSelected,
    @Default("") String code,
    @JsonKey(name: "parent_code") @Default("") String parentCode,
    @Default("") String emoji,
    @Default("") String image,
    @JsonKey(name: "sub_categories")
    @Default(<CategoryModel>[])
    List<CategoryModel> subCategories,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
