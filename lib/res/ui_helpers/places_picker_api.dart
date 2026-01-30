import 'package:primecustomer/data/model/remote/suggestion.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../controller/view/places_search_controller.dart';
import '../app/app_colors.dart';
import '../app/app_dimens.dart';
import '../app/app_text_styles.dart';
import '../config/size_config.dart';

///https://medium.com/comerge/location-search-autocomplete-in-flutter-84f155d44721
class PlacesPickerApi extends BaseScreenStandard {
  final TextEditingController searchController = TextEditingController();
  Function(Suggestion)? onSearch;
  final RxList<Suggestion> list = RxList<Suggestion>();

  PlacesPickerApi(this.onSearch) {
    list.clear();
    list.addAll(prefUtils.getPlaceSuggestions());
  }

  ///Pick a location
  static pickLocation(Function(Suggestion) call) {
    Get.to(PlacesPickerApi((place) {
      call(place);
    }));
  }

  static void searchLocation(Function(Suggestion) call) {
    PlacesPickerApi(call)._searchFromOnline();
  }

  Future<void> _searchFromOnline() async {
    // generate a new token here
    final sessionToken = Uuid().v4();

    final Suggestion? place = await showSearch(
      context: mContext ?? Get.context!,
      delegate: PlacesSearchController(sessionToken),
    );
    // This will change the text displayed in the TextField
    if (place != null && place.latitude > 0.0) {
      ///check if place not already saved
      if (!list.contains(place) &&
          !list.any(
              (e) => e.address.toLowerCase() == place.address.toLowerCase())) {
        list.add(place);
        prefUtils.savePlace(list);
      }
      searchController.text = place.address;
      prefUtils.saveSelectedLocation(place);

      if (onSearch != null) {
        onSearch!(place);
        // Get.back();
      }
    }
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        iconTheme: const IconThemeData(
          color: AppColors.darkText,
        ),
        title: Text('Pick Location', style: AppTextStyles.descStyleRegular),
      ),
      body: Stack(
        children: <Widget>[
          Card(
            elevation: 10,
            margin: EdgeInsets.only(
              left: AppDimens.dimen24,
              right: AppDimens.dimen24,
              top: AppDimens.dimen10,
            ),
            //padding: EdgeInsets.all(0),
            child: TextField(
              controller: searchController,
              readOnly: true,
              onTap: () async {
                await _searchFromOnline();
              },
              decoration: InputDecoration(
                icon: Padding(
                  padding: EdgeInsets.only(left: AppDimens.dimen10),
                  child: Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                    size: AppDimens.dimen24,
                  ),
                ),
                hintText: "Search...",
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(right: AppDimens.dimen5),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: AppDimens.dimen100),
            height: SizeConfig.screenHeight,
            child: Obx(
              () => ListView.builder(
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(list[index].placeId),
                    onDismissed: (dir) {
                      list.remove(list[index]);
                      prefUtils.savePlace(list);
                    },
                    background: Container(
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          "DELETE",
                          style: AppTextStyles.h5StyleRegular
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                    child: Card(
                      margin: EdgeInsets.only(
                          left: AppDimens.dimen10,
                          right: AppDimens.dimen10,
                          top: AppDimens.dimen5),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Icon(Icons.location_pin,
                                      size: AppDimens.dimen20),
                                  SizedBox(width: AppDimens.dimen10),
                                  Flexible(
                                      child: Text(
                                    "${list[index].address}",
                                    style: AppTextStyles.descStyleLight,
                                  ))
                                ],
                              ),
                            ),
                            Icon(Icons.navigate_next, size: AppDimens.dimen20),
                          ],
                        ),
                        onTap: () {
                          if (onSearch != null) {
                            onSearch!(list[index]);
                            Get.back();
                          }
                        },
                      ),
                    ),
                  );
                },
                itemCount: list.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
