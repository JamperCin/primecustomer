import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/coordinates.dart';
import 'package:get/get.dart';

import '../remote/suggestion.dart';

class DeliveryAddressModel extends BaseObject {
  String? name;
  String? residentialAddress;
  String? phone;
  RxBool? isSelected;
  Coordinates? coordinates;
  bool isWithinRange;

  DeliveryAddressModel({
    this.name,
    this.residentialAddress,
    this.coordinates,
    this.phone,
    this.isSelected,
    this.isWithinRange = true,
  });
}
