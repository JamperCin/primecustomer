import 'dart:async';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/model/remote/address_model.dart';
import 'package:primecustomer/data/model/remote/coordinates.dart';
import 'package:primecustomer/data/model/remote/orders_model.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:primecustomer/data/model/remote/shop_payment_model.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/geo_location_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/order_api.dart';
import 'package:primecustomer/utils/date_time_utils.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetailsController extends BaseController {
  Rx<ShopPaymentModel> shopPaymentModel = const ShopPaymentModel().obs;
  Rx<OrderModel> selectedOrder = const OrderModel().obs;
  RxList<OrderModel> orderList = RxList<OrderModel>();
  Rx<ProductModel> selectedProduct = const ProductModel().obs;
  RxInt currentPodIndex = 0.obs;
  OrderApi orderApi = OrderApi();
  RxString estimatedDuration = ''.obs;
  RxString estimatedDistance = ''.obs;

  // Completer<GoogleMapController> mapCompleter = Completer();
  // RxMap<MarkerId, Marker> markersSet = RxMap<MarkerId, Marker>();

  /// this is the key object - the PolylinePoints
  /// which generates every polyline between start and finish
  //RxList<Polyline> polyLines = RxList<Polyline>();
  double mapZoom = 10.4746;

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    //mapApi.setWebService(webService: webService);
  }

  Future<void> initData(ShopPaymentModel model) async {
    shopPaymentModel.value = model;
    orderList.clear();
    model.orders.forEach((e) {
      orderList.value.add(e.copyWith(selected: e == model.orders.first));
    });

    selectedOrder.value = orderList.first;
    selectedProduct.value = selectedOrder.value.product;

    await Future.delayed(const Duration(milliseconds: 180));
    // if (canShowMap()) {
    //   drawPolyLine(_getDeliveryAddress(), call: () {
    //     _plotMarker(
    //       _getClientAddress(),
    //       markerId: "client",
    //       title: selectedOrder.value.client.name,
    //       icon:
    //           BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    //     );
    //     _plotMarker(
    //       _getDeliveryAddress(),
    //       markerId: "user",
    //       title: selectedOrder.value.client.name,
    //       icon:
    //           BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    //     );
    //   });
    // }
  }

  void onProductTapped(OrderModel order) {
    selectedOrder.value = order.copyWith(selected: true);
    selectedProduct.value = selectedOrder.value.product;
    int index = orderList.indexWhere((e) => e.id == order.id);
    orderList.removeAt(index);
    orderList.insert(index, selectedOrder.value);
  }

  void onProductView(OrderModel order) {
    selectedOrder.value = order.copyWith(selected: true);
    selectedProduct.value = selectedOrder.value.product;
    int index = orderList.indexWhere((e) => e.id == order.id);
    orderList.removeAt(index);
    orderList.insert(index, selectedOrder.value);
    _viewProductAdditionDetails(order);
  }

  ///View the additional information of an order or a product
  void _viewProductAdditionDetails(OrderModel order) {
    DialogsApi.showBottomSheet(
      showCloseButton: false,
      backgroundColor: AppColors.white,
      topPadding: 0,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.dimen10,
        vertical: AppDimens.dimen10,
      ),
      child: orderApi.additionalProductDetailsWidget(order, onTap: () {
        _confirmRemovalOfProduct(order);
      }),
      containerSize: SizeConfig.screenHeight * .7,
    );
  }

  ///Confirm the deletion or removal of a product
  void _confirmRemovalOfProduct(OrderModel order) {}

  // void onMapCreated(GoogleMapController controller) {
  //   controller.setMapStyle(mapApi.mapStyle);
  //   if (!mapCompleter.isCompleted) {
  //     mapCompleter.complete(controller);
  //   }
  // }

  bool canShowMap() {
    return shopPaymentModel
            .value.orders.first.deliveryAddress.longitude.isNotEmpty &&
        (shopPaymentModel.value.orders.first.client.coordinates?.latitude ?? "")
            .isNotEmpty;
  }

  // LatLng _getDeliveryAddress() {
  //   AddressModel cord = shopPaymentModel.value.orders.first.deliveryAddress;
  //   return LatLng(NumberUtils.parseDouble(cord.latitude),
  //       NumberUtils.parseDouble(cord.longitude));
  // }

  // LatLng _getClientAddress() {
  //   Coordinates? cord = shopPaymentModel.value.orders.first.client.coordinates;
  //   return LatLng(NumberUtils.parseDouble(cord?.latitude ?? "0.0"),
  //       NumberUtils.parseDouble(cord?.longitude ?? "0.0"));
  // }

  // CameraPosition initCameraPosition({AddressModel? cord}) {
  //   cord = cord ?? shopPaymentModel.value.orders.first.deliveryAddress;
  //   return CameraPosition(
  //     target: LatLng(NumberUtils.parseDouble(cord.latitude),
  //         NumberUtils.parseDouble(cord.longitude)),
  //     zoom: mapZoom,
  //   );
  // }

  // Future<void> animateTo(LatLng latLng, {double? zoom}) async {
  //   final c = await mapCompleter.future;
  //   final p = CameraPosition(target: latLng, zoom: zoom ?? mapZoom);
  //   c.animateCamera(CameraUpdate.newCameraPosition(p));
  // }

  ///Draw PolyLine on the map
  // void drawPolyLine(LatLng dest, {Function? call}) {
  //   mapApi.drawPolyLine(
  //     _getClientAddress(),
  //     dest,
  //     polyline: (line) {
  //       polyLines.clear();
  //       polyLines.add(line);
  //       animateTo(dest);
  //       if (call != null) {
  //         call();
  //       }
  //     },
  //     callback: (route) {
  //       estimatedDistance.value = route.distance ?? '';
  //       DateTime now = DateTime.now();
  //       DateTime newDate = now.add(Duration(seconds: route.durationValue));
  //       now.add(Duration(seconds: newDate.second));

  //       estimatedDuration.value =
  //           DateTimeUtils.formatDate(now, format: 'hh:mm aa');
  //       print("Dura ${route.durationValue}");
  //       print("Dura 2 ${DateTimeUtils.formatDate(now, format: 'hh:mm aa')}");
  //       //  now.add(Duration(seconds: route.durationValue));

  //       // print("Dura 3${DateTimeUtils.formatDate(now, format: 'hh:mm aa')}");
  //     },
  //   );
  // }

  ///Add marker to the map screen
  // void _plotMarker(LatLng position,
  //     {String? title, String? markerId, BitmapDescriptor? icon}) async {
  //   Marker marker = await _getMarker(
  //     title: title ?? "",
  //     markerId: "marker_id_$markerId",
  //     latLng: position,
  //     icon: icon ?? mapApi.markerIcon,
  //   );
  //   markersSet.putIfAbsent(marker.markerId, () => marker);
  // }

  // Future<Marker> _getMarker({
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

  String getEstimatedTimeOfDelivery() {
    return "12:56 pm";
  }

  // String getEstimatedDistanceOfDelivery() {
  //   return GeoLocationApi.getDistance(
  //       _getClientAddress(), _getDeliveryAddress());
  // }
}
