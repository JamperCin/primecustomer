import 'dart:async';
import 'dart:math';


import 'package:primecustomer/data/constants/pref_constants.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/address_model.dart';
import 'package:primecustomer/data/model/remote/coordinates.dart';
import 'package:primecustomer/data/model/remote/suggestion.dart';
import 'package:primecustomer/extensions/string_extension.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/api/prominent_disclosure.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/ui/dashboard/card/location_cards/nearby_merchants.dart';
import 'package:primecustomer/utils/number_utils.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
 import 'package:get/get.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class GeoLocationApi {
  // LocationPermission? permission;
  static Rx<Suggestion> suggestion = const Suggestion().obs;
  Function? onLocInit;

  GeoLocationApi();

  GeoLocationApi init({Function? onLocInit}) {
    this.onLocInit = onLocInit;
    initLocation();

    // bool locPerm = prefUtils.getBool(PrefConstants.LOCATION_PERMISSION_ALLOWED);
    // if (!locPerm) {
    //   locationDisclosure((accepted) {
    //     if (accepted) {
    //       initLocation();
    //     }
    //   });
    //   return this;
    // }

    // ProminentDisclosureApi().showLocationDisclosure(onAccept: (accepted) {
    //   initLocation();
    // });

    return this;
  }

  /*void locationDisclosure(Function(bool) onAccepted) {
    ProminentDisclosureApi().showLocationDisclosure(onAccept: onAccepted);

    // DialogsApi.popUpNormalDialog(
    //   Get.context!,
    //   title: "Location Permission needed",
    //   asset: "assets/images/ic_location.png",
    //   child: UiApi.disclosureScreen((accepted) {
    //     prefUtils.setBool(
    //       PrefConstants.LOCATION_PERMISSION_ALLOWED,
    //       accepted,
    //     );
    //   }),
    // );
  }*/

  ///Check if Location services are Disabled or Enabled on the current user's device
  ///Return param : bool [TRUE / FALSE ]
  Future<bool> isLocationEnabled() async {
    return false;  //await Geolocator.isLocationServiceEnabled();
  }

  ///Ask for location permission from the user
  ///Permissions can be in the state of [DENIED, DENIED-FOREVER , WHILE-IN-USE, ALWAYS, etc ]
  Future<void> askForPermission() async {
   // permission = await Geolocator.requestPermission();
  }

  ///Check the permission status of the user
  ///Permissions can be in the state of [DENIED, DENIED-FOREVER , WHILE-IN-USE, ALWAYS, etc ]
  Future<void> _checkPermissionStatus() async {
    // permission = await Geolocator.checkPermission();

    // //if Permission is denied, ask user's permission again
    // if (permission == null || permission == LocationPermission.denied) {
    //   await askForPermission();
    //   // SnackBarApi.snackBarInfo("Location permissions are denied. Please check your settings to enable it");
    // }

    // if (permission == LocationPermission.always ||
    //     permission == LocationPermission.whileInUse) {
    //   prefUtils.setBool(PrefConstants.LOCATION_PERMISSION_ALLOWED, true);
    //   return;
    // }

    // // Permissions are denied forever, handle appropriately.
    // if (permission == LocationPermission.deniedForever) {
    //   SnackBarApi.snackBarInfo(
    //     "Location permissions are permanently denied, we cannot request permissions. Please check your settings to enable it",
    //   );
    // }
  }

  ///Initialise the Location Services
  ///Ask for permissions
  ///Get the current Location of the User
  Future<void> initLocation() async {
    // bool enabled = await isLocationEnabled();

    // if (!enabled) {
    //   SnackBarApi.snackBarInfo(
    //       "Please switch on or enable your location service inorder to enjoy full features of Prime");
    //   return;
    // }

    // await _checkPermissionStatus();

    // Position pos = await getLastKnownLocation();
    // suggestion.value = await buildLocation(LatLng(pos.latitude, pos.longitude));

    // if (pos.latitude != 0.0 && onLocInit != null) {
    //   onLocInit!();
    // }
  }

  ///=========== R E Q U E S T  F O R  L O C A T I O N ============

  ///Get the current location position of the user
  ///Last known location
  // Future<Position> getLastKnownLocation() async {
  //   return await Geolocator.getCurrentPosition();
  // }

  ///Listen to location updates
  ///To listen for location changes you can call the {@link getPositionStream } to receive stream
  ///you can listen to and receive position updates. You can finetune the results by specifying the following parameters:
  ///
  /// - accuracy: the accuracy of the location data that your app wants to receive;
  /// - distanceFilter: the minimum distance (measured in meters) a device must move horizontally before an update event is generated;
  /// - timeLimit: the maximum amount of time allowed between location updates. When the time limit is passed a TimeOutException will be thrown and the stream will be cancelled. By default no limit is configured.

  // Future<void> getLocationUpdates() async {
  //   //Set the accuracy and the minimum distance (measured in meters)
  //   LocationSettings locationSettings = const LocationSettings(
  //     accuracy: LocationAccuracy.high,
  //     distanceFilter: 100,
  //     timeLimit: Duration(seconds: 10),
  //   );

  //   //Get the streams
  //   Geolocator.getPositionStream(locationSettings: locationSettings).listen((
  //     pos,
  //   ) async {
  //     if (pos.longitude != 0.0) {
  //       suggestion.value = await buildLocation(
  //         LatLng(pos.latitude, pos.longitude),
  //       );
  //     }
  //   });
  // }

  ///To translate an address into latitude and longitude coordinates you
  ///can use the [locationFromAddress] method:
  // Future<Location> getLatLng(String address) async {
  //   List<Location> loc = await locationFromAddress(address);
  //   if (loc.isNotEmpty) {
  //     return loc[0];
  //   }
  //   return Location(latitude: 0.0, longitude: 0.0, timestamp: DateTime.now());
  // }

  ///If you want to translate [latitude ] and [longitude] coordinates into an
  ///address you can use the [placemarkFromCoordinates] method:
  // static Future<Placemark> geoCodeLatLng({
  //   Position? pos,
  //   LatLng? latLng,
  // }) async {
  //   double lat = 0.0;
  //   double lng = 0.0;
  //   if (pos != null) {
  //     lat = pos.latitude;
  //     lng = pos.longitude;
  //   } else if (latLng != null) {
  //     lat = latLng.latitude;
  //     lng = latLng.longitude;
  //   }

  //   if (lat == 0.00 || lng == 0.00) {
  //     return Placemark();
  //   }

  //   List<Placemark> mark = await placemarkFromCoordinates(lat, lng);
  //   return mark.isNotEmpty ? mark[0] : Placemark();
  // }

  Future<Suggestion> getCurrentLocation() async {
    // Position pos = await getLastKnownLocation();
    // return await buildLocation(LatLng(pos.latitude, pos.longitude));
    return Suggestion();
  }

  ///build the location Address with this method
  static String buildString(String? data, {bool c = true}) {
    if (data != null && data.isNotEmpty) {
      return "$data${c ? ", " : ""}";
    }
    return "";
  }

  ///Build a complete location Object which has both the coordinates and address
  ///This function takes [LatLng]
  /// A pair of latitude and longitude coordinates, stored as degrees.
  static Future<Suggestion> buildLocation(LatLng latLng) async {
    // Placemark add = await geoCodeLatLng(latLng: latLng);
    // String address =
    //     "${buildString(add.name)}${buildString(add.subAdministrativeArea)}${buildString(add.country, c: false)}";
    // String desc =
    //     "${buildString(add.street)}${buildString(add.administrativeArea, c: false)}";

    return Suggestion(
      latitude: latLng.latitude,
      longitude: latLng.longitude,
      address: "address",
      description: "desc",
    );
  }

  static double calculateDistance(LatLng pointA, LatLng pointB) {
    var p = 0.017453292519943295;
    var c = cos;
    var a =
        0.5 -
        c((pointB.latitude - pointA.latitude) * p) / 2 +
        c(pointA.latitude * p) *
            c(pointB.latitude * p) *
            (1 - c((pointB.longitude - pointA.longitude) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }

  static String getDistance(LatLng pointA, LatLng pointB, {int dec = 2}) {
    double distance = calculateDistance(pointA, pointB);
    return "${distance.toStringAsFixed(dec)} Km";
  }

  static Future<String> getPointDistance(
    LatLng pointA,
    LatLng pointB, {
    int dec = 2,
  }) async {
    double distance = calculateDistance(pointA, pointB);
    return "${distance.toStringAsFixed(dec)} Km";
  }

  static String getCurrentPositionDistance(LatLng pointB, {int dec = 2}) {
    LatLng p = LatLng(suggestion.value.latitude, suggestion.value.longitude);
    double distance = calculateDistance(p, pointB);
    return "${distance.toStringAsFixed(dec)} Km";
  }

  Future<String> getDistanceFromSelectedPosition(
    Coordinates cord, {
    int dec = 2,
  }) async {
    Suggestion address = await prefUtils.getSelectedLocation();
    LatLng a = LatLng(address.latitude, address.longitude);
    LatLng b = LatLng(
      NumberUtils.parseDouble(cord.latitude),
      NumberUtils.parseDouble(cord.longitude),
    );
    double distance = calculateDistance(a, b);
    return "${distance.toStringAsFixed(dec)} Km";
  }

  void goToNearByMerchants({BaseObject? object}) {
    // bool locPerm = prefUtils.getBool(PrefConstants.LOCATION_PERMISSION_ALLOWED);
    // if (!locPerm) {
    //   locationDisclosure((accepted) {
    //     if (accepted) {
    //       init(onLocInit: () {
    //         NavApi.fireTarget(NearByMerchantsScreen(), model: object);
    //       });
    //     }
    //   });
    //   return;
    // }

    ProminentDisclosureApi().showLocationDisclosure(
      onAccept: (accept) {
        if (accept) {
          NavApi.fireTarget(NearByMerchantsScreen(), model: object);
        }
      },
    );
  }

  static bool isLocationWithinRange(Coordinates? points) {
    if (points == null || points.latitude.isEmpty) {
      return false;
    }
    suggestion.value = prefUtils.getDefaultLocation();
    LatLng p = LatLng(suggestion.value.latitude, suggestion.value.longitude);
    LatLng p2 = LatLng(points.latitude.toDouble(), points.longitude.toDouble());
    double distance = calculateDistance(p, p2);
    // double d = Geolocator.distanceBetween(
    //     p.latitude, p.longitude, p2.latitude, p2.longitude);
    // print("ADD == > $distance ==> $d");
    return distance <= 16;
  }

  static AddressModel updateAddressModel(
    AddressModel model, {
    Coordinates? shopCoordinates,
  }) {
    Coordinates? points = model.coordinate;

    if (points.latitude.isEmpty) {
      return model;
    }
    suggestion.value = prefUtils.getDefaultLocation();

    double latitude = shopCoordinates == null
        ? suggestion.value.latitude
        : NumberUtils.parseDouble(shopCoordinates.latitude);
    double longitude = shopCoordinates == null
        ? suggestion.value.longitude
        : NumberUtils.parseDouble(shopCoordinates.longitude);

    LatLng p = LatLng(latitude, longitude);
    LatLng p2 = LatLng(points.latitude.toDouble(), points.longitude.toDouble());
    double distance = calculateDistance(p, p2);
    return model.copyWith(distance: distance, isWithinRange: distance <= 16);
  }

  Future<void> openMap({required dynamic lat, required dynamic lng}) async {
    String url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      SnackBarApi.snackBarToast(
        "Could not open Map on your device.",
        title: "Map failed to open",
      );
    }
  }
}


class LatLng{
  final double latitude;
  final double longitude;

  LatLng(this.latitude, this.longitude);
}