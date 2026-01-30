import 'package:primecustomer/res/api/geo_location_api.dart';

import 'product_services/cart_service.dart';

class ServiceInjectors {
  static final ServiceInjectors _instance = ServiceInjectors._internal();
  late GeoLocationApi geolocationApi;
  late CartService cartService;

  ///instantiate singleton services here for usage through the app
  ServiceInjectors._internal() {
    geolocationApi = GeoLocationApi();
    cartService = CartService();
  }

  factory ServiceInjectors() {
    return _instance;
  }
}
