import 'dart:async';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/view/places_search_controller.dart';
import 'package:primecustomer/data/model/remote/suggestion.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/geo_location_api.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

class MapPlacesPickerController extends BaseController {
  final RxList<Suggestion> list = RxList<Suggestion>();
  RxString selectedAddress = "".obs;
  final TextEditingController searchController = TextEditingController();
  // RxMap<MarkerId, Marker> markersSet = RxMap<MarkerId, Marker>();
  // Completer<GoogleMapController> mapController = Completer();
  // Rx<LatLng> initialMapPosition = const LatLng(0, 0).obs;
  Rx<Suggestion> suggestion = const Suggestion().obs;
  RxBool isLoadingAddress = false.obs;
  double mapZoom = 16.4746;

  void getListOfSelectedAddresses() {
    list.addAll(prefUtils.getPlaceSuggestions());
  }

  void getLatestSelectedAddress() {
    suggestion.value = GeoLocationApi.suggestion.value.longitude != 0.0
        ? GeoLocationApi.suggestion.value
        : list.isNotEmpty
            ? list.last
            : const Suggestion(
                address: "Spintex Rd, Accra, Ghana",
                latitude: 5.630845,
                longitude: -0.143204,
              );

    selectedAddress.value = suggestion.value.address;
    // initialMapPosition.value =
    //     LatLng(suggestion.value.latitude, suggestion.value.longitude);
  }

  // void onMapCreated(GoogleMapController controller) {
  //   mapController = Completer();
  //   mapController.complete(controller);

  //   if (mapController.isCompleted) {
  //     addMarker(title: suggestion.value.address);
  //   }
  // }

  // CameraPosition cameraPosition() {
  //   return CameraPosition(
  //     target: initialMapPosition.value,
  //     zoom: mapZoom,
  //   );
  // }

  ///Add marker to the map screen
  void addMarker({String? title}) {
    // var kMarkerId = const MarkerId('marker_id');

    // final Marker marker = Marker(
    //   markerId: kMarkerId,
    //   draggable: true,
    //   position: initialMapPosition.value,
    //   infoWindow: InfoWindow(title: title),
    //   icon: mapApi.markerIcon,
    //   onDrag: (l) {
    //     //debugPrint(l.latitude);
    //   },
    //   onDragStart: (l) {
    //     //debugPrint(l.latitude);
    //   },
    //   onDragEnd: ((pos) {
    //     onMapClick(LatLng(pos.latitude, pos.longitude));
    //   }),
    // );

    // markersSet.clear();
    // markersSet.putIfAbsent(kMarkerId, () => marker);
  }

  //Future<void> animateTo(LatLng latLng) async {
    // final c = await mapController.future;
    // final p = CameraPosition(target: latLng, zoom: mapZoom);
    // c.animateCamera(CameraUpdate.newCameraPosition(p));
  //}

  void onChooseThisLocation(Function(Suggestion) call) {
    ///check if place not already saved
    if (!list.contains(suggestion.value)) {
      list.add(suggestion.value);
      prefUtils.savePlace(list);
    }

    call(suggestion.value);
    NavApi.fireBack();
  }

  ///Open the search panel to search for location
  void onSearchLocation() async {
    // generate a new token here
    final sessionToken = const Uuid().v4();

    final Suggestion? place = await showSearch(
      context: mContext!,
      delegate: PlacesSearchController(sessionToken),
    );
    // This will change the text displayed in the TextField
    if (place != null && place.longitude != 0.0) {
      suggestion.value = place;
      searchController.text = place.address;
      selectedAddress.value = place.address;
      isLoadingAddress.value = false;
     //initialMapPosition.value = LatLng(place.latitude, place.longitude);
      addMarker(title: suggestion.value.address);
      //await animateTo(initialMapPosition.value);
    }
  }

  String buildString(String? data, {bool c = true}) {
    if (data != null && data.isNotEmpty) {
      return "$data${c ? ", " : ""}";
    }
    return "";
  }

  ///Handle click listeners to Map
  // void onMapClick(LatLng latLng) async {
  //   isLoadingAddress.value = true;

  //   suggestion.value = await GeoLocationApi.buildLocation(latLng);

  //   searchController.text = "";
  //   selectedAddress.value = suggestion.value.address;
  //   initialMapPosition.value = latLng;
  //   addMarker(title: suggestion.value.address);
  //   isLoadingAddress.value = false;
  //   await animateTo(initialMapPosition.value);
  // }
}
