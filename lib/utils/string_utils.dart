import 'package:primecustomer/data/model/remote/orders_model.dart';

class StringUtils {
  static String concatProductName(List<OrderModel> orders) {
    StringBuffer buffer = StringBuffer();
    for (var element in orders) {
      buffer
          .write(element.product.name + (element == orders.last ? "" : " , "));
    }
    return buffer.toString();
  }
}
