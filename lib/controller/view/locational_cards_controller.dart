import 'dart:async';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/view/near_by_merchant_model.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/remote/merchant_details.dart';
import 'package:primecustomer/data/model/remote/suggestion.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/geo_location_api.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/ui_helpers/map_places_picker_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/wallet/merchant_rating/merchant_rating_list.dart';
import 'package:primecustomer/ui/dashboard/card/all_cards.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LocationalController extends BaseController {
  // RxMap<MarkerId, Marker> markersSet = RxMap<MarkerId, Marker>();
  // Completer<GoogleMapController> mapController = Completer();
  // Rx<LatLng> initialMapPosition = const LatLng(0.0, 0.0).obs;
  double mapZoom = 14.4746;
  RxBool isDoneLoadingMerchants = false.obs;
  RxList<NearByMerchantModel> merchantsList = RxList<NearByMerchantModel>();
  //MapApi? mapApi;

  ///Single merchant we want to plot on the map
  MerchantDetails? client;

  /// this is the key object - the PolylinePoints
  /// which generates every polyline between start and finish
  //RxList<Polyline> polyLines = RxList<Polyline>();

  PanelController panelController = PanelController();

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    //mapApi.setWebService(webService: webService!);
  }

  void setInitialPosition() {
    // initialMapPosition.value = LatLng(GeoLocationApi.suggestion.value.latitude,
    //     GeoLocationApi.suggestion.value.longitude);
  }

  void clearData() {
    isDoneLoadingMerchants = false.obs;
    merchantsList.clear();
  }

  // CameraPosition cameraPosition() {
  //   return CameraPosition(
  //     target: initialMapPosition.value,
  //     zoom: mapZoom,
  //   );
  // }

  // void onMapCreated(GoogleMapController controller, {MerchantDetails? client}) {
  //   mapController = Completer();
  //   mapController.complete(controller);

  //   if (mapController.isCompleted) {
  //     controller.setMapStyle(mapApi.mapStyle);
  //     markersSet.clear();
  //     plotCurrentUSerMarker();
  //     Utils.startTimer(2, () {
  //       if (client != null && (client.coordinates?.latitude ?? "").isNotEmpty) {
  //         plotSingleMerchant(client: client);
  //       }
  //     });
  //   }
  // }

  //Future<void> animateTo(LatLng latLng, {double? zoom}) async {
    // final c = await mapController.future;
    // final p = CameraPosition(target: latLng, zoom: zoom ?? mapZoom);
    // c.animateCamera(CameraUpdate.newCameraPosition(p));
  //}

  void pickLocation() {
    MapPlacesPickerApi.pickLocation((sug) {
      GeoLocationApi.suggestion.value = sug;
     // initialMapPosition.value = LatLng(sug.latitude, sug.longitude);
      plotCurrentUSerMarker();
      getNearByMerchants(sug);
    });
  }

  ///Draw PolyLine on the map
  // void drawPolyLine(LatLng dest, {Function? call}) {
  //   mapApi.drawPolyLine(initialMapPosition.value, dest, polyline: (line) {
  //     polyLines.clear();
  //     polyLines.add(line);
  //     animateTo(dest);
  //     panelController.animatePanelToPosition(0.0);
  //     if (call != null) {
  //       call();
  //     }
  //   });
  // }

  ///Add marker to the map screen
  void plotCurrentUSerMarker() async {
    // Marker marker = await getMarker(
    //   title: "You ",
    //   markerId: "current_user_id",
    //   latLng: initialMapPosition.value,
    //   icon: mapApi.markerIcon,
    // );
    // markersSet.putIfAbsent(marker.markerId, () => marker);
  }

  // Future<Marker> getMarker({
  //   required LatLng latLng,
  //   String? title,
  //   String markerId = "marker_id",
  //   VoidCallback? onTap,
  //   BitmapDescriptor? icon,
  // }) async {
  //   var kMarkerId = MarkerId(markerId);

  //   final Marker marker = Marker(
  //     markerId: kMarkerId,
  //     draggable: false,
  //     position: latLng,
  //     infoWindow: InfoWindow(title: title, onTap: onTap),
  //     icon: icon ??
  //         BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
  //   );

  //   return marker;
  // }

  Future plotSingleMerchant({MerchantDetails? client}) async {
    this.client = client;
    if (client == null || (client.coordinates?.latitude ?? "").isEmpty) {
      SnackBarApi.snackBarInfo(
          "Merchant's location cannot be returned at the moment. Kindly try again later.");
      return;
    }

    double lat = NumberUtils.parseDouble(client.coordinates?.latitude ?? "0.0");
    double lng =
        NumberUtils.parseDouble(client.coordinates?.longitude ?? "0.0");
    // LatLng point = LatLng(lat, lng);

    // Marker marker = await getMarker(
    //   title: client.name,
    //   markerId: "single_merchant_id",
    //   latLng: point,
    //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    // );
    // markersSet.putIfAbsent(marker.markerId, () => marker);

    // //draw polyline to merchant and animate
    // drawPolyLine(point, call: () {
    //   animateTo(initialMapPosition.value, zoom: 16);
    // });
  }

  ///Get Near-By merchants by using users current location address.
  Future<void> getNearByMerchants(Suggestion place) async {
    if (place.latitude == 0.0 || place.longitude == 0.0) {
      return;
    }

    Map<String, Object> param = {};
    Map<String, Object> coordinate = {};

    coordinate.putIfAbsent("latitude", () => "${place.latitude}");
    coordinate.putIfAbsent("longitude", () => "${place.longitude}");
    param.putIfAbsent("limit", () => "10");
    param.putIfAbsent("search_by", () => "");
    param.putIfAbsent("geo_cordinates", () => coordinate);

    // Map<String, Object> map = param.map((key, value) => MapEntry(key, value.toString()));

    isDoneLoadingMerchants.value = false;
    merchantsList.clear();
    webService?.getNearByMerchants(param, (response) {
      isDoneLoadingMerchants.value = true;
      if (response.success &&
          (response.data?.nearByMerchants ?? []).isNotEmpty) {
        merchantsList.addAll(response.data?.nearByMerchants ?? []);

        // plotAllMarkers().then((val) {
        //   animateTo(getLatLng(merchantsList.last), zoom: 11.0);
        //   panelController.animatePanelToPosition(1.0);
        // });
      }
    });

    debugPrint("PARAM ${param.toString()}");
  }

  ///Convert the merchant to proper Address
  // LatLng getLatLng(NearByMerchantModel mod) {
  //   return LatLng(NumberUtils.parseDouble(mod.latitude),
  //       NumberUtils.parseDouble(mod.longitude));
  // }

  // ///Plot all Locational Markers
  // Future<void> plotAllMarkers() async {
  //   markersSet.clear();
  //   plotCurrentUSerMarker();
  //   for (NearByMerchantModel mod in merchantsList) {
  //     Marker marker = await getMarker(
  //       latLng: getLatLng(mod),
  //       markerId: mod.client.code,
  //       title: Utils.capitalizeLetter(
  //         val: mod.client.name,
  //         capAllFirstLetters: true,
  //       ),
  //     );

  //     markersSet.putIfAbsent(marker.markerId, () => marker);
  //   }
  // }

  void onViewRatings(NearByMerchantModel mer) {
    NavApi.fireTarget(MerchantRatingList(),
        model: CardModel(
            clientId: mer.client.id,
            clientName: Utils.capitalizeLetter(
                val: mer.client.name, capAllFirstLetters: true)));
  }

  void onFindRoute(NearByMerchantModel mer) {
   // drawPolyLine(getLatLng(mer));
  }

  void goToMerchantCards(NearByMerchantModel mer) {
    NavApi.fireTarget(AllCardsScreen(),
        model: CardModel(clientId: mer.client.id));
  }
}
