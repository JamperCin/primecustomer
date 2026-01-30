import 'package:primecustomer/data/model/remote/data.dart';
import 'package:flutter/services.dart';

import '../../utils/Utils.dart';

class RootBundleLoader {
  final String shops = 'assets/config/shops_test.json';

  Future<Data?> loadResources({String? path}) async {
    String json = await rootBundle.loadString(path ?? shops);
    if (json.isNotEmpty) {
      dynamic jsonResponse = Utils.convertDecode(json);
      // print('Data is : $jsonResponse');
      if (jsonResponse != null) {
        return Data.fromJson(jsonResponse);
      }
    }
    return null;
  }
}
