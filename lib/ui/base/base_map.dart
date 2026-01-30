import 'package:primecustomer/controller/basic/map_controller.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class BaseMap extends BaseScreenStandard {
  MapController controller = Get.put(MapController());
  CardUtils? cardUtils;

  @override
  bool showAppBar() {
    return false;
  }

  @override
  CardModel getModel() {
    if (baseObject is CardModel) {
      CardModel cardModel = baseObject as CardModel;
      cardUtils = CardUtils(cardModel.card ?? const PrimeCardModel());
      return cardModel;
    }

    return CardModel();
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
    getModel();
  }

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        // GoogleMap(
        //   mapType: MapType.normal,
        //   myLocationEnabled: true,
        //   myLocationButtonEnabled: true,
        //   zoomControlsEnabled: true,
        //   zoomGesturesEnabled: true,
        //   polylines: Set<Polyline>.of(controller.polyLines),
        //   initialCameraPosition:
        //       controller.initCameraPosition(cardUtils?.getCoordinates()),
        //   onMapCreated: controller.onMapCreated,
        // ),
        Padding(
          padding: EdgeInsets.only(
            top: AppDimens.dimen50,
            left: AppDimens.dimen20,
            right: AppDimens.dimen20,
          ),
          child: UiApi.searchBarWidget(
              icon: Icons.arrow_back_ios,
              ctr: controller.searchEdtCtrl,
              height: AppDimens.dimen45,
              trailWidget: InkWell(
                onTap: () {
                  controller.onSearchOnClick();
                },
                child: Icon(
                  Icons.arrow_right_alt_outlined,
                  size: AppDimens.dimen20,
                ),
              ),
              hintText: "Search...",
              onTap: () {
                controller.onNavBackOnClick();
              }),
        )
      ],
    );
  }
}
