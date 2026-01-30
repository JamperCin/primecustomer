import 'dart:math';

import 'package:primecustomer/data/model/remote/product_model.dart';

extension ProductExt on ProductModel {
  ///Get a random image for display
  String get shuffleImage => images[Random().nextInt(images.length)];

  ///Return the exact price of a product after deduction of discount
  double get netAmount => price - discount;
}
