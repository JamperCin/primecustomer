import 'package:primecustomer/controller/view/all_cards_controller.dart';
import 'package:primecustomer/data/enum/display_type.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/card_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCardsScreen extends BaseScreenStandard {
  final AllCardsController controller = Get.put(AllCardsController());

  AllCardsScreen() {
    controller.isDoneLoadingCards.value = false;
    controller.cardsList.clear();
    Utils.startTimer(1, () {
      controller.initData(getModel());
    });
  }

  @override
  String appBarTitle() {
    return controller.appBarTitle.value;
  }

  @override
  CardModel getModel() {
    CardModel card = baseObject as CardModel;
    return card;
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        topWidget(),
        Padding(
          padding: EdgeInsets.only(top: AppDimens.dimen110),
          child: UiApi.listView(
              list: listView(),
              scrollController: controller.scrollController,
              padding: EdgeInsets.only(
                //  top: AppDimens.dimen10,
                bottom: AppDimens.dimen10,
              )),
        ),
      ],
    );
  }

  Widget topWidget() {
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.dimen20,
        right: AppDimens.dimen20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppDimens.dimen20),
          UiApi.homeSearchBar(
            padding: EdgeInsets.zero,
            hintText: "Search here ...",
            enabled: false,
            controller: controller.searchController,
            onTap: () {
              controller.cardController?.searchCard(mContext!);
            },
            onSearchChanged: (val) {
              controller.onSearchOnline(val.toLowerCase());
            },
            /*onFilterClick: () {
              PlacesPickerApi.pickLocation((sug) {
                controller.searchController.text = sug.address;
              });
            },*/
          ),
          SizedBox(height: AppDimens.dimen5),
          Text(
            "Search by merchant name, location, card amount, etc.",
            style: AppTextStyles.smallSubDescStyleRegular,
          )
        ],
      ),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(UiApi.securityQuestionsWarning());

    list.add(SizedBox(height: AppDimens.dimen20));

    ///============Render OTHER Cards by Same merchant====================
    list.add(CardApi.renderCard(
      list: controller.cardsList,
      isDone: controller.isDoneLoadingCards,
      cardType: DisplayType.GRID_VERTICAL,
      heroTag: "_all_cards",
      titleWidget: const SizedBox(),
      showMerchantName: true,
      showAmount: !controller.isOneCardPerMerchant.value,
      onTap: (card) {
        controller.cardController?.onCardSelected(card, "_all_cards");
      },
      loaderLength: 5,
      showSubText: controller.isOneCardPerMerchant.value,
      advertIndexes: [10, 45],
      advertList: controller.advertList,
    ));

    list.add(Obx(
      () =>
          controller.isDoneLoadingCards.value && controller.mainCardList.isEmpty
              ? UiApi.noDataWidget(
                  url: controller
                      .selectedCardModel.value.selectedMenuCategory?.logo,
                  title: "No cards available",
                  message:
                      "There are no cards at the moment for the selected group or category. Kindly try using a different group or category.",
                )
              : const SizedBox(),
    ));

    list.add(Obx(
      () => controller.isLoadingMore.value
          ? UiApi.loaderMore()
          : const SizedBox(),
    ));

    list.add(SizedBox(height: AppDimens.dimen50));

    return list;
  }
}
