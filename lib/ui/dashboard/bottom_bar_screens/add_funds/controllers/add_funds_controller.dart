import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/add_funds/screens/entry_to_add_card_number.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/add_funds/screens/scan_to_add_funds.dart';

class AddFundsController extends BaseController{
  void onScanQrCode() {
    NavApi.fireTarget(ScanToAddFunds());
  }

  void onEnterCardDigit() {
    navUtils.fireTarget(EntryToAddCardNumber());
  }

}