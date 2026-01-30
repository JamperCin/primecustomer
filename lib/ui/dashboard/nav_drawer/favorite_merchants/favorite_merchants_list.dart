import 'package:primecustomer/controller/view/favorite_cards_controller.dart';
import 'package:primecustomer/data/enum/display_type.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/card_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FavoriteMerchantsListScreen extends BaseScreenStandard {
  final FavoriteCardsController controller = Get.put(FavoriteCardsController());

  FavoriteMerchantsListScreen() {
    controller.cardsList.clear();
    controller.isDoneLoadingFavorite.value = false;
    Utils.startTimer(1, () {
      controller.getFavoriteCards();
      controller.getAdverts();
    });
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  String appBarTitle() {
    return "Favorite Cards";
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(
      list: listView(),
      padding: EdgeInsets.zero,
      scrollController: controller.scrollController,
      isLoadingMore: controller.isLoadingMore,
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    // list.add(Obx(() => controller.cardsList.isNotEmpty &&
    //         controller.isDoneLoadingFavorite.value
    //     ? favoriteWidget()
    //     : controller.cardsList.isEmpty && controller.isDoneLoadingFavorite.value
    //         ? Center(
    //             child: UiApi.noDataWidget(
    //             asset: "assets/images/ic_onboarding_three.svg",
    //             assetSize: AppDimens.dimen200,
    //             title: "Empty List",
    //             message: "You have no favorite cards saved on your account. "
    //                 "Your cards you favorite for later buying appears here.",
    //           ))
    //         : UiApi.loader(size: 4)));

    list.add(UiApi.securityQuestionsWarning());

    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(Padding(
      padding: EdgeInsets.only(
        left: AppDimens.dimen16,
        right: AppDimens.dimen16,
        top: AppDimens.dimen10,
      ),
      child: UiApi.homeSearchBar(
        padding: EdgeInsets.zero,
        hintText: "Search here ...",
        controller: controller.searchController,
        onSearchChanged: (val) {
          controller.onSearchOffline(val.toLowerCase());
        },
      ),
    ));
    list.add(SizedBox(height: AppDimens.dimen5));
    list.add(Padding(
      padding: EdgeInsets.only(
        left: AppDimens.dimen16,
        right: AppDimens.dimen16,
        bottom: AppDimens.dimen20,
      ),
      child: Text(
        "Search by merchant name, location, card amount, etc.",
        style: AppTextStyles.smallSubDescStyleRegular,
      ),
    ));

    ///============Render OTHER Cards by Same merchant====================
    list.add(CardApi.renderCard(
      list: controller.cardsList,
      isDone: controller.isDoneLoadingFavorite,
      cardType: DisplayType.GRID_VERTICAL,
      heroTag: "_all_cards",
      titleWidget: const SizedBox(),
      showMerchantName: true,
      onTap: (card) {
        controller.cardController?.onCardSelected(card, "_all_cards");
      },
      loaderLength: 5,
      showSubText: true,
      advertIndexes: [10, 45],
      advertList: controller.advertList,
    ));

    list.add(Obx(
      () =>
          controller.isDoneLoadingFavorite.value && controller.cardsList.isEmpty
              ? Center(
                  child: UiApi.noDataWidget(
                  asset: "assets/images/ic_onboarding_three.svg",
                  assetSize: AppDimens.dimen200,
                  title: "Empty List",
                  message: "You have no favorite cards saved on your account. "
                      "Your cards you favorite for later purchases appears here.",
                ))
              : const SizedBox(),
    ));

    // list.add(Obx(
    //   () => controller.isLoadingMore.value
    //       ? UiApi.loaderMore()
    //       : const SizedBox(),
    // ));

    return list;
  }

  Widget favoriteItemWidget(PrimeCardModel card) {
    CardUtils cardUtils = CardUtils(card);
    return Container(
      decoration: UiApi.deco(),
      padding: EdgeInsets.all(AppDimens.dimen16),
      child: Row(
        children: [
          UiApi.imageLoader(
            height: AppDimens.dimen50,
            width: AppDimens.dimen70,
            url: card.image,
          )
        ],
      ),
    );
  }

  Widget favoriteWidget() {
    List<Widget> list = [];

    for (PrimeCardModel card in controller.cardsList) {
      list.add(favoriteItemWidget(card));
    }

    return Column(children: list);
  }
}
