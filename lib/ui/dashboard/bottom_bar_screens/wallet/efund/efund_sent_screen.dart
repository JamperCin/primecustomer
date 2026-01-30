import 'package:primecustomer/controller/view/efund_cards_controller.dart';
import 'package:primecustomer/data/model/remote/eFund_card_model.dart';
import 'package:primecustomer/data/model/remote/e_fund_request_model.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/card_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_sliver_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class EfundSentScreen extends BaseSliverStandard {
  final EFundCardsController controller = Get.put(EFundCardsController());

  EfundSentScreen() {
    controller.clear();
    Utils.startTimer(1, () {
      controller.eFund.value = getModel();
    }, duration: const Duration(milliseconds: 180));
  }

  @override
  bool decorateBody() {
    return false;
  }

  @override
  Widget? flexImageWidget() {
    return UiApi.imageLoader(
      url:
          "https://primeegiftfiles.s3.us-east-2.amazonaws.com/mobile/ic_fund_me.jpg",
      setOverlay: true,
      border: 0,
    );
  }

  @override
  double? floatWidgetPaddingRight() {
    return SizeConfig.screenWidth * 0.05;
  }

  @override
  double? floatWidgetPaddingLeft() {
    return floatWidgetPaddingRight();
  }

  @override
  EfundRequestModel getModel() {
    return baseObject as EfundRequestModel;
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Widget floatingWidget({BuildContext? context}) {
    return Container(
      decoration: UiApi.deco(),
      padding: EdgeInsets.all(AppDimens.dimen10),
      width: SizeConfig.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          UiApi.iconOnClick(
              title: "Comment",
              onTap: () {
                controller.onCommentOnClick();
              }),
          // UiApi.iconOnClick(
          //     title: "Edit",
          //     icon: Icons.edit,
          //     color: AppColors.yellowColor,
          //     onTap: () {
          //       controller.onEditEFund();
          //     }),
          UiApi.iconOnClick(
              title: "Cancel",
              icon: Icons.cancel_rounded,
              color: AppColors.red,
              onTap: () {
                controller.onCancelEFund();
              }),
        ],
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        UiApi.listView(list: listView(), padding: EdgeInsets.zero),
        guestUserInfoWidget(context),
      ],
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(SizedBox(height: AppDimens.dimen40));
    list.add(Padding(
      padding: EdgeInsets.only(
        left: AppDimens.dimen20,
        right: AppDimens.dimen20,
        top: AppDimens.dimen20,
      ),
      child: Text("Potential Funders", style: AppTextStyles.h5StyleBold),
    ));
    list.add(SizedBox(height: AppDimens.dimen5));
    list.add(Obx(() => Padding(
          padding: EdgeInsets.only(
            left: AppDimens.dimen5,
            right: AppDimens.dimen5,
          ),
          child:
              UiApi.potentialCustomers(controller.eFund.value.potentialFunders),
        )));

    list.add(Padding(
      padding: EdgeInsets.only(
        left: AppDimens.dimen20,
        right: AppDimens.dimen20,
        top: AppDimens.dimen20,
      ),
      child: Text("Card(s)", style: AppTextStyles.h5StyleBold),
    ));

    list.add(Obx(() => cards()));

    return list;
  }

  Widget cards() {
    List<Widget> cards = [];
    for (EfundCardModel mod in controller.eFund.value.items) {
      cards.add(Padding(
        padding: EdgeInsets.all(AppDimens.dimen10),
        child: CardApi.eFundElevatedCard(
          efund: mod,
          width: SizeConfig.screenWidth * .57,
          showMerchantName: false,
          showAmount: true,
          showEFundStatus: true,
        ),
      ));
    }

    return SizedBox(
      height: SizeConfig.screenHeight * 0.21,
      child: ListView(
        children: cards,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget guestUserInfoWidget(BuildContext context) {
    return Obx(
      () => SlidingUpPanel(
        color: AppColors.background,
        minHeight: controller.minPanelHeight.value,
        controller: controller.panelController,
        margin:
            EdgeInsets.only(right: AppDimens.dimen10, left: AppDimens.dimen10),
        padding: EdgeInsets.all(AppDimens.dimen16),
        maxHeight: SizeConfig.screenHeight * 0.8,
        panel: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: AppDimens.dimen5,
                width: AppDimens.dimen70,
                decoration: UiApi.deco(
                  color: AppColors.general(0XFFd7d6da),
                  borderColor: AppColors.general(0XFFd7d6da),
                  opacity: 0,
                ),
              ),
              Column(
                children: [
                  SizedBox(height: AppDimens.dimen20),
                  UiApi.assetImage(
                    "assets/images/prime_logo_new.png",
                    height: AppDimens.dimen80,
                    width: AppDimens.dimen80,
                  ),
                  SizedBox(height: AppDimens.dimen20),
                  UiApi.textArea(controller.commentTxt),
                ],
              )
            ],
          ),
        ),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        backdropEnabled: true,
        backdropTapClosesPanel: true,
      ),
    );
  }
}
