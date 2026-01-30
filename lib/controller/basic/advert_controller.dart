import 'dart:collection';

import 'package:primecustomer/data/http/web_service.dart';
import 'package:get/get.dart';

import '../../data/model/remote/advert_image_model.dart';

class AdvertController {
  final WebService webService;

  ///Types of Advert we have at the moment
  final String mobileMain = "mobile_main";
  final String mobilePromo = "mobile_promo";

  static RxList<AdvertImageModel> advertList = <AdvertImageModel>[].obs;

  AdvertController(this.webService);

  ///Get adverts from the system
  Future<void> getAdverts(RxList<AdvertImageModel> list) async {
    HashMap<String, Object> params = HashMap();

    List<String> advertTypes = [];
    advertTypes.add(mobileMain);
    advertTypes.add(mobilePromo);
    params.putIfAbsent("ad_types[]", () => advertTypes);

    await webService.getAdverts(params, (response) {
      list.clear();
      list.addAll(response.data?.images ?? <AdvertImageModel>[]);

      advertList.clear();
      advertList.addAll(response.data?.images ?? <AdvertImageModel>[]);
    });
  }
}
