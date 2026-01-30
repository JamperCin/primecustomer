import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/assets_config.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/services/services_injector.dart';
import 'package:primecustomer/ui/base/base_search_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/http/places_provider.dart';
import '../../data/model/remote/suggestion.dart';
import '../../res/app/app_dimens.dart';

class PlacesSearchController extends BaseSearchStandard<Suggestion> {
  final String sessionToken;
  PlaceApiProvider? apiClient;
  RxBool isLoading = false.obs;
  String tappedDesc = "";
  final RxList<Suggestion> list = RxList<Suggestion>();
  final Rx<Suggestion> currentLocation = const Suggestion().obs;
  RxBool isLoadingCurrentAddress = false.obs;
  Suggestion selectedAddress = const Suggestion();

  ///Entry Constructor into this library
  PlacesSearchController(this.sessionToken) {
    apiClient = PlaceApiProvider(sessionToken);
    Utils.delayTimer(() async {
      //Get the selected location
      selectedAddress = await prefUtils.getSelectedLocation();

      //Get the list of all selected locations
      List<Suggestion> preList =
          prefUtils.getPlaceSuggestions().reversed.toList();

      list.value.addAll(preList.length > 5 ? preList.sublist(0, 5) : preList);

      await _getCurrentLocation();
    });
  }

  @override
  Future<List<Suggestion>> fetchSuggestions({required String query}) {
    return apiClient!.fetchSuggestions(query, "GH");
  }

  ///Location Item Widget when searching for location
  @override
  Widget listItemWidget(BuildContext context, Suggestion item) {
    return ListTile(
      tileColor: AppColors.white,
      title: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 0,
              child: Icon(
                Icons.location_pin,
                size: AppDimens.dimen14,
                color: Colors.black,
              ),
            ),
            SizedBox(width: AppDimens.dimen10),
            Expanded(
              child: Text(
                item.description,
                style: AppTextStyles.descStyleRegular,
              ),
            ),
            if (isLoading.value && (tappedDesc == item.description))
              Align(
                alignment: Alignment.centerRight,
                child: UiApi.circularProgressBar(
                    radius: AppDimens.dimen10, color: Colors.black),
              )
          ],
        ),
      ),
      onTap: () async {
        tappedDesc = item.description;
        isLoading.value = true;
        Suggestion value = await apiClient!.getPlaceDetailFromId(item);
        isLoading.value = false;
        close(context, value);
      },
    );
  }

  @override
  void onClose(BuildContext context) {
    close(context, const Suggestion());
  }

  ///List of already added address or location history
  @override
  Widget suggestionsHistory(BuildContext context) {
    return Obx(
      () => ListView(
        children: [
          _currentLocation(),
          ...list.map((e) => _specialLocationItem(e))
        ],
      ),
    );
  }

  //Retrieve the current location of user
  Future<void> _getCurrentLocation() async {
    isLoadingCurrentAddress.value = true;
    currentLocation.value =
        await ServiceInjectors().geolocationApi.getCurrentLocation();
    isLoadingCurrentAddress.value = false;
  }

  ///Current location ui widget
  Widget _currentLocation() {
    return InkWell(
      onTap: () async {
        await _getCurrentLocation();
        if (currentLocation.value.latitude > 0.0) {
          close(Get.context!, currentLocation.value);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: AppDimens.dimen16,
              right: AppDimens.dimen16,
              top: AppDimens.dimen14,
              bottom: AppDimens.dimen10,
            ),
            child: Row(
              children: [
                UiApi.assetImage(AssetsConfig.navigation,
                    height: AppDimens.dimen25,
                    width: AppDimens.dimen25,
                    assetColor: AppColors.black),
                SizedBox(width: AppDimens.dimen20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Current location',
                          style: AppTextStyles.descStyleMedium),
                      SizedBox(height: AppDimens.dimen3),
                      Text(currentLocation.value.address,
                          style: AppTextStyles.smallSubDescStyleLight),
                    ],
                  ),
                ),
                if (isLoadingCurrentAddress.value)
                  UiApi.circularProgressIndicator(radius: AppDimens.dimen10)
              ],
            ),
          ),
          UiApi.divider(
            width: SizeConfig.screenWidth,
            color: AppColors.notWhiteExt,
            height: 1,
          ),
        ],
      ),
    );
  }

  ///Location item widget for the list of already selected address or location history.
  ///used in [_addressHistoryWidget]
  Widget _specialLocationItem(Suggestion sug) {
    return InkWell(
      onTap: () {
        close(Get.context!, sug);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: AppDimens.dimen16,
              right: AppDimens.dimen16,
              top: AppDimens.dimen14,
              bottom: AppDimens.dimen10,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.history,
                  size: AppDimens.dimen20,
                  color: AppColors.iconColor,
                ),
                SizedBox(width: AppDimens.dimen20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(sug.address, style: AppTextStyles.descStyleMedium),
                      SizedBox(height: AppDimens.dimen5),
                      Text(sug.description,
                          style: AppTextStyles.smallSubDescStyleLight),
                    ],
                  ),
                ),
                if (selectedAddress.address == sug.address)
                  SizedBox(width: AppDimens.dimen10),
                if (selectedAddress.address == sug.address)
                  Icon(
                    Icons.check_circle,
                    color: AppColors.primaryGreenColor,
                    size: AppDimens.dimen20,
                  )
              ],
            ),
          ),
          UiApi.divider(
            width: SizeConfig.screenWidth,
            color: AppColors.notWhiteExt,
            height: 1,
          ),
        ],
      ),
    );
  }
}
