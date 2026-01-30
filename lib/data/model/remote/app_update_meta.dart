import 'package:primecustomer/data/model/remote/app_update_checker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_update_meta.freezed.dart';
part 'app_update_meta.g.dart';

@freezed
class AppUpdateMeta with _$AppUpdateMeta {
  const factory AppUpdateMeta({
    @Default(AppUpdateChecker()) AppUpdateChecker ios,
    @Default(AppUpdateChecker()) AppUpdateChecker android,
  }) = _AppUpdateMeta;

  factory AppUpdateMeta.fromJson(Map<String, dynamic> json) =>
      _$AppUpdateMetaFromJson(json);
}
