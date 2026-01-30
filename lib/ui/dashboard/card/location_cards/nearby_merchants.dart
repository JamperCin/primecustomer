import 'package:primecustomer/controller/view/locational_cards_controller.dart';
import 'package:primecustomer/controller/view/near_by_merchant_model.dart';
import 'package:primecustomer/data/enum/action_event.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/res/api/geo_location_api.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class NearByMerchantsScreen extends BaseScreenStandard {
  final LocationalController controller = Get.put(LocationalController());

  NearByMerchantsScreen() {
    controller.setInitialPosition();
    controller.clearData();
    Utils.startTimer(2, () {
      controller.getNearByMerchants(GeoLocationApi.suggestion.value);
    });
  }

  @override
  CardModel getModel() {
    if (baseObject is CardModel) {
      return baseObject as CardModel;
    }
    return CardModel();
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  bool showAppBar() {
    return false;
  }

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        map(),
        bottomSlider(),
        backButton(),
      ],
    );
  }

  @override
  Widget bottomNavigationBar({BuildContext? context}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: UiApi.deco(),
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.only(
            left: AppDimens.dimen40,
            right: AppDimens.dimen40,
            top: AppDimens.dimen12,
            bottom: AppDimens.dimen24,
          ),
          child: UiApi.button(
            text: "Choose Location",
            border: 20,
            textColor: AppColors.white,
            backgroundColor: AppColors.introColor2,
            onPressed: () {
              controller.pickLocation();
            },
          ),
        ),
      ],
    );
  }

  Widget map() {
    return Stack(
      children: [
        // Obx(
        //   () => GoogleMap(
        //     mapType: MapType.normal,
        //     myLocationEnabled: true,
        //     myLocationButtonEnabled: true,
        //     zoomControlsEnabled: true,
        //     zoomGesturesEnabled: true,
        //     markers: Set<Marker>.of(controller.markersSet.values),
        //     polylines: Set<Polyline>.of(controller.polyLines),
        //     initialCameraPosition: controller.cameraPosition(),
        //     onMapCreated: (GoogleMapController ctr) {
        //       controller.onMapCreated(ctr, client: getModel().client);
        //     },
        //   ),
        // ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: AppDimens.dimen40),
            child: UiApi.button(
              text: "Choose this location",
              backgroundColor: AppColors.primaryGreenColor,
              onPressed: () {
                controller.pickLocation();
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget backButton() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppDimens.dimen16,
          top: AppDimens.dimen10,
        ),
        child: FloatingActionButton(
          child: Icon(
            Icons.arrow_back,
            color: AppColors.white,
            size: AppDimens.dimen20,
          ),
          backgroundColor: AppColors.black.withOpacity(0.4),
          mini: true,
          onPressed: () {
            NavApi.fireAction(EventAction.BACK);
          },
        ),
      ),
    );
  }

  Widget bottomSlider() {
    return SlidingUpPanel(
      color: AppColors.background,
      minHeight: AppDimens.dimen150,
      controller: controller.panelController,
      margin:
          EdgeInsets.only(right: AppDimens.dimen10, left: AppDimens.dimen10),
      maxHeight: SizeConfig.screenHeight * 0.65,
      panel: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppDimens.dimen10),
            Container(
              height: AppDimens.dimen5,
              width: AppDimens.dimen70,
              decoration: UiApi.deco(
                color: AppColors.general(0XFFd7d6da),
                borderColor: AppColors.general(0XFFd7d6da),
                opacity: 0,
              ),
            ),
            SizedBox(height: AppDimens.dimen20),
            Text(
              "Merchants Nearby",
              style: AppTextStyles.h5StyleBold,
              textAlign: TextAlign.left,
            ),
            Obx(
              () => controller.isDoneLoadingMerchants.value &&
                      controller.merchantsList.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(top: AppDimens.dimen10),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: AppDimens.dimen10,
                            right: AppDimens.dimen10,
                            bottom: AppDimens.dimen10,
                          ),
                          child: Column(
                            children: [
                              merchantWidget(),
                              SizedBox(height: AppDimens.dimen50),
                            ],
                          ),
                        ),
                      ),
                    )
                  : controller.isDoneLoadingMerchants.value &&
                          controller.merchantsList.isEmpty
                      ? UiApi.noDataWidget(
                          asset: "assets/images/ic_no_location.png",
                          title: "No Merchants",
                          message:
                              "No Merchants near selected location. You can select a different location to view merchants near you.")
                      : Padding(
                          padding: EdgeInsets.only(top: AppDimens.dimen10),
                          child: UiApi.circularProgressBar(
                              radius: AppDimens.dimen40),
                        ),
            ),
          ],
        ),
      ),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      backdropEnabled: true,
      backdropTapClosesPanel: true,
    );
  }

  Widget merchantWidget() {
    List<Widget> merchList = [];

    for (NearByMerchantModel mer in controller.merchantsList) {
      merchList.add(
        UiApi.merchantNearInfo(
          mer,
          rateOnTap: () {
            controller.onViewRatings(mer);
          },
          callOnTap: () {
            controller.callContact(mer.client.telephone);
          },
          routeOnTap: () {
            controller.onFindRoute(mer);
          },
          goToOnTap: () {
            controller.goToMerchantCards(mer);
          },
          width: controller.merchantsList.length == 1
              ? SizeConfig.screenWidth * 0.92
              : null,
          //latLng: controller.getLatLng(mer),
        ),
      );
    }

    return SizedBox(
      height: SizeConfig.screenWidth * .7,
      child: ListView(
        children: merchList,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget userInfo() {
    return Container();
  }
}
