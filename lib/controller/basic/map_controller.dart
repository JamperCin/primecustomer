
import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/enum/action_event.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends BaseController {
  //Completer<GoogleMapController> mapCompleter = Completer();

  /// this is the key object - the PolylinePoints
  /// which generates every polyline between start and finish
  //RxList<Polyline> polyLines = RxList<Polyline>();

  TextEditingController searchEdtCtrl = TextEditingController();

  // CameraPosition initCameraPosition(Coordinates? cord) {
  //   return CameraPosition(
  //     target: LatLng(NumberUtils.parseDouble(cord?.latitude ?? "0.0"),
  //         NumberUtils.parseDouble(cord?.longitude ?? "0.0")),
  //     zoom: 14.4746,
  //   );
  // }

  @override
  void onInit() {
    super.onInit();
  }

  // void onMapCreated(GoogleMapController controller) {
  //   printLog(mapApi.mapStyle);
  //   controller.setMapStyle(mapApi.mapStyle);
  //   mapCompleter.complete(controller);
  // }

  void onNavBackOnClick() {
    NavApi.fireEvent(Event(action: EventAction.BACK));
  }

  void onSearchOnClick() {
    if (searchEdtCtrl.text.isNotEmpty) {}
  }
}
