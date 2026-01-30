import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/http/web_service.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/utils/pref_utils.dart';

import '../../data/model/remote/account.dart';

class PrimeWalletController extends BaseController {
  WebService? webService;

  PrimeWalletController(this.webService);

  Future<Account?> getWalletDetails({Function? call}) async {
    Account? account;
    await webService?.getPrimeWalletDetails((response) {
      account = response.data?.account;
      prefUtils.savePrimeWalletDetails(response.data?.account);
      if (call != null) {
        call();
      }
    });
    prefUtils = await PrefUtils().getPref();
    return account;
  }
}
