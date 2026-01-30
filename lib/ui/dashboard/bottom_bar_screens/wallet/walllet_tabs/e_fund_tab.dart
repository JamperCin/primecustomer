import 'package:primecustomer/controller/view/wallet_controller.dart';
import 'package:primecustomer/data/enum/wallet_type.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EfundTab extends BaseScreenStandard {
  WalletController controller = Get.put(WalletController());

  EfundTab() {
    controller.clearList();
    Utils.startTimer(1, () {
      controller.fetchWallet(type: WalletType.E_FUND);
    }, duration: const Duration(milliseconds: 360));
  }

  @override
  bool showAppBar() {
    return false;
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.walletBodyWidget(
      controller.cardAccountList,
      controller.isDoneLoading,
      scrollController: controller.scrollController,
      isLoadingMore: controller.isLoadingMore,
      walletType: WalletType.E_FUND,
      onCardSelected: controller.onAccountSelected,
      onFilterOnTap: controller.onFilterOnClick,
      onSearch: controller.onSearchOffline,
      onViewAllCards: controller.viewAllTypesOfCard,
    );
  }
}
