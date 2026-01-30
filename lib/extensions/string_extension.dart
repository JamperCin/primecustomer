import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/number_utils.dart';

extension StringExtension on String {
  ///Capitalize all First Letters
  String capitalizeFirstLetters() {
    return Utils.capitalizeLetter(val: this, capOnlyFirstLetter: true);
  }

  double toDouble() {
    return NumberUtils.parseDouble(this);
  }
}
