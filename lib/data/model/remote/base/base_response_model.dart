import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response_model.freezed.dart';
part 'base_response_model.g.dart';

///Run this command after any changes to any of the model files
///command @command [dart run build_runner build --delete-conflicting-outputs]
@freezed
class BaseResponseModel extends BaseObject with _$BaseResponseModel {
  const factory BaseResponseModel({
    @Default(false) bool success,
    @Default(0) int status,
    @JsonKey(name: 'error_msg') @Default('') String? error,
    Data? data,
  }) = _BaseResponseModel;

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseModelFromJson(json);
}
