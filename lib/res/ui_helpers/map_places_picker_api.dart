import 'package:primecustomer/controller/basic/places_picker_controller.dart';
import 'package:primecustomer/data/model/remote/suggestion.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPlacesPickerApi extends BaseScreenStandard {
  final  controller = Get.put(MapPlacesPickerController());
  Function(Suggestion) call;

  MapPlacesPickerApi(this.call) {
    controller.getListOfSelectedAddresses();
    controller.getLatestSelectedAddress();
  }

  ///Pick a location
  static pickLocation(Function(Suggestion) call) {
    NavApi.fireTarget(MapPlacesPickerApi(call));
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(AppDimens.dimen20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: listView(),
          ),
        ),
        Expanded(child: map()),
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
        //     initialCameraPosition: controller.cameraPosition(),
        //     onMapCreated: (GoogleMapController ctr) {
        //       controller.onMapCreated(ctr);
        //     },
        //     onTap: controller.onMapClick,
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
                controller.onChooseThisLocation(call);
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];
    list.add(Text("Address Information", style: AppTextStyles.h4StyleMedium));
    list.add(SizedBox(height: AppDimens.dimen20));
    list.add(Container(
      decoration: UiApi.deco(opacity: 0.4),
      child: UiApi.syncTextField(
        controller.searchController,
        onTap: controller.onSearchLocation,
      ),
    ));
    list.add(SizedBox(height: AppDimens.dimen20));
    list.add(Obx(() => UiApi.locationItemWidget(
        controller.selectedAddress.value, controller.isLoadingAddress)));

    return list;
  }
}
