import 'dart:ui' as ui;

import 'package:primecustomer/data/http/web_service.dart';
import 'package:primecustomer/data/model/local/RouteModel.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapApi {
  String mapStyle;
  Color mapStyleColor = Colors.black;
  //BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  WebService? webService;

  MapApi({
    this.mapStyle = "",
    this.mapStyleColor = Colors.black,
  });

  MapApi setWebService({WebService? webService}) {
    this.webService = webService;
    return this;
  }

  MapApi init() {
    loadMapStyle();
   // getAssetByte();
    return this;
  }

  void setMapStyle(String mapStyle) {
    this.mapStyle = mapStyle;
  }

  loadMapStyle() {
    rootBundle.loadString(_getStyle()).then((mapStyle) {
      setMapStyle(mapStyle);
    });
  }

  String _getStyle() {
    var hour = DateTime.now().hour;

    if (hour >= 6 && hour < 18) {
      mapStyleColor = AppColors.black;
      return 'assets/map/style_uber.txt';
    }

    mapStyleColor = AppColors.white;
    return 'assets/map/night_style.txt';
  }

  // void getAssetBitmap() {
  //   BitmapDescriptor.fromAssetImage(
  //           const ImageConfiguration(size: Size(10, 10)),
  //           'assets/images/ic_pin.png')
  //       .then((onValue) {
  //     markerIcon = onValue;
  //   });
  // }

  // void getAssetByte() async {
  //   try {
  //     final Uint8List unit = await getBytesFromAsset(
  //         'assets/images/ic_pin.png', AppDimens.dimen150);
  //     markerIcon = BitmapDescriptor.fromBytes(unit);
  //   } catch (e) {
  //     markerIcon = BitmapDescriptor.defaultMarker;
  //   }
  // }

  Future<Uint8List> getBytesFromAsset(String path, double width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width.toInt());
    ui.FrameInfo fi = await codec.getNextFrame();
    ByteData d = await fi.image.toByteData(format: ui.ImageByteFormat.png) ??
        ByteData(0);
    return d.buffer.asUint8List();
  }

  // void drawPolyLine(LatLng point1, LatLng point2,
  //     {Function(RouteModel)? callback, Function(Polyline)? polyline}) {
  //   webService?.getRouteCoordinates(point1, point2, (routeData) {
  //     if (callback != null) {
  //       callback(routeData);
  //     }

  //     if (polyline != null) {
  //       polyline(Polyline(
  //         polylineId: const PolylineId(
  //             "Constants.currentRoutePolylineId"), //pass any string here
  //         width: 5,
  //         geodesic: true,
  //         endCap: Cap.squareCap,
  //         startCap: Cap.roundCap,
  //         jointType: JointType.round,
  //         points: convertToLatLng(routeData.route ?? ""),
  //         color: mapStyleColor,
  //       ));
  //     }
  //   });
  // }

  ///Convert the list of points to LATLNG
  // static List<LatLng> convertToLatLng(String route) {
  //   List points = decodePoly(route);
  //   List<LatLng> result = <LatLng>[];
  //   for (int i = 0; i < points.length; i++) {
  //     if (i % 2 != 0) {
  //       result.add(LatLng(points[i - 1], points[i]));
  //     }
  //   }
  //   return result;
  // }

  ///Decode the polylines from the google api
  static List decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = [];
    int index = 0;
    int len = poly.length;
    int c = 0;
    // repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negative then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

    /*adding to previous value as done in encoding */
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    debugPrint(lList.toString());

    return lList;
  }
}
