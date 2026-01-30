import 'dart:collection';

import 'package:core_module/core/model/local/base_object.dart';


class DataParamModel extends BaseObject {
  final HashMap<String, Object> param;

  DataParamModel({required this.param});
}
