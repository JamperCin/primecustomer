import 'package:primecustomer/controller/basic/page_anim_controller.dart';
import 'package:primecustomer/controller/view/promo_controller.dart';
import 'package:primecustomer/data/enum/display_type.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/card_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/ui/dashboard/notification/notification_screen.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';

class PromoScreen extends BaseScreenStandard {
  final PromoController controller = Get.put(PromoController());

  PromoScreen() {
    controller.isDoneLoadingPromoCards.value = false;
    controller.promoList.clear();
    Utils.startTimer(1, () {
      controller.initAllRequest();
    });
  }

  @override
  double appBarElevation() {
    return 0;
  }

  @override
  String appBarTitle() {
    return "Promotionals";
  }

  @override
  Color appBarBackgroundColor() {
    return AppColors.background;
  }

  @override
  List<Widget> actions() {
    return [
      UiApi.circleEmpty(
        onTap: () {
          NavApi.fireTarget(NotificationScreen());
        },
        padding: EdgeInsets.all(AppDimens.dimen2),
        margin: EdgeInsets.only(
            right: AppDimens.dimen10,
            top: AppDimens.dimen3,
            bottom: AppDimens.dimen3),
        child: UiApi.appBarNotification(notificationCounter),
      ),
    ];
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Widget body(BuildContext context) {
    return getMainListViewUI();
  }

  @override
  List<Widget> listView() {
    List<Widget> list = <Widget>[];

    list.add(UiApi.securityQuestionsWarning());

    ///Add the top banner with search bar
    list.add(UiApi.containerRoundCorners(
      margin: EdgeInsets.only(
          left: AppDimens.dimen16,
          right: AppDimens.dimen16,
          bottom: AppDimens.dimen20),
      borderRadius: 20,
      gradient: AppColors.gradient([AppColors.grad1, AppColors.grad2]),
      //backgroundColor: AppColors.lightBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Looking for deals?",
            style: AppTextStyles.h3StyleBold,
          ),
          SizedBox(height: AppDimens.dimen10),
          Text(
            "Merchant special and discounted deals on Prime.",
            style: AppTextStyles.descStyleRegular,
          ),
          SizedBox(height: AppDimens.dimen10),
          UiApi.searchBarWidget(
              margin: EdgeInsets.zero,
              borderRadius: 10,
              hintText: "Search here...",
              enabled: false,
              onTap: () {
                controller.cardController?.searchCard(mContext!);
              }),
          SizedBox(height: AppDimens.dimen10),
          Text(
            "N.B: Promotional e-cards are date bound and are used for the said promotional product",
            style: AppTextStyles.subDescStyleLight,
          ),
        ],
      ),
    ));

    ///---------------------------Promotional Cards here -------------------------
    list.add(CardApi.renderCard(
      list: controller.promoList,
      isDone: controller.isDoneLoadingPromoCards,
      cardType: DisplayType.GRID_VERTICAL,
      showPromo: true,
      loader: UiApi.loader(),
      heroTag: "_promo",
      title: "Promotional Cards",
      titleWidget: const SizedBox(),
      onTap: (card) {
        controller.cardController
            ?.onCardSelected(card, "_promo", filter: "promotions_only");
      },
    ));

    return list;
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: PageAnimationController.getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return Container(
            color: appBarBackgroundColor(),
            child: ListView.builder(
              padding: EdgeInsets.only(
                top: AppDimens.dimen16,
                // right: AppDimens.dimen16,
                // left: AppDimens.dimen16,
                bottom: MediaQuery.of(context).padding.bottom,
              ),
              itemCount: listView().length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) =>
                  listView()[index],
            ),
          );
        }
      },
    );
  }
}
