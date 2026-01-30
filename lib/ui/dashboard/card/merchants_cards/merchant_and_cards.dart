import 'package:badges/badges.dart' as badge;
import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/controller/view/card_details_controller.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/assets_config.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/card_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_sliver_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:get/get.dart';

class MerchantAndCards extends BaseSliverStandard {
  final CardDetailsController controller = Get.put(CardDetailsController());
  CardUtils? cardUtils;

  MerchantAndCards() {
    controller.clear();
    Utils.startTimer(1, () {
      CardModel card = getModel();
      controller.cardModel = card;
      cardUtils = CardUtils(card.card ?? const PrimeCardModel());
      controller.selectedCard.value = cardUtils?.card ?? const PrimeCardModel();
      controller.initAllRequest(card);
      //todo controller.addSelectedCard(card.card ?? const PrimeCardModel());
    }, duration: const Duration(milliseconds: 120));
  }

  @override
  CardModel getModel() {
    if (baseObject is CardModel) {
      return baseObject as CardModel;
    }

    return CardModel();
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
  }

  /*@override
  String appBarTitle() {
    return Utils.capitalizeLetter(
      capAllFirstLetters: true,
      val: cardUtils?.getMerchantName(),
    );
  }*/

  @override
  Widget? flexImageWidget() {
    return Stack(
      children: [
        Obx(
          () => UiApi.imageLoader(
            url: controller.selectedCard.value.image,
            heroTag: controller.cardModel.heroTag,
            setOverlay: true,
            border: 0,
          ),
        ),
      ],
    );
  }

  @override
  Color backgroundColor() {
    return AppColors.background;
  }

  @override
  List<Widget> actions() {
    return [
      // Obx(() => isGuestUser.value
      //     ? const SizedBox.shrink()
      //     : UiApi.actionWidget(
      //         asset: AssetsConfig.shopIcon,
      //         iconColor: AppColors.market3,
      //         onTap: () {
      //           controller.goToMerchantShop(getModel());
      //         },
      //       )),
      Obx(() => isGuestUser.value
          ? const SizedBox.shrink()
          : UiApi.actionWidget(
              icon: Icons.favorite,
              onTap: () {
                controller.onFavoriteOnClick(controller.selectedCard.value);
              },
            )),
    ];
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(
        list: listView(),
        padding: EdgeInsets.only(
          top: AppDimens.dimen16,
          bottom: MediaQuery.of(context).padding.bottom,
        ));
  }

  @override
  bool decorateBody() {
    return false;
  }

  @override
  double expandedHeight() {
    return SizeConfig.screenHeight * .27;
  }

  @override
  double decoTopHeight() {
    return SizeConfig.screenHeight * (SizeConfig.isTablet ? 0.16 : 0.22);
  }

  @override
  Widget bodyDeco(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => controller.selectedCardsList.isNotEmpty
                ? CardApi.renderCard(
                    list: controller.selectedCardsList,
                    isDone: controller.isDoneLoadingOtherCards,
                    titleWidget: const SizedBox(),
                    loader: const SizedBox(),
                    showMerchantName: false,
                    scrollController: controller.scrollController,
                    showAmount: true,
                    showSubText: false,
                    showDeleteIcon: true,
                    heroTag: "_merchant_card",
                    aspectRatio: 2.0,
                    onDelete: (cardUtils) {
                      controller.onDeleteSelectedCard(cardUtils.card);
                    },
                    childAspectRatio: .7,
                  )
                : CardApi.elevatedCard(
                    card: controller.selectedCard.value,
                    width: SizeConfig.screenWidth *
                        (SizeConfig.isTablet ? 0.65 : 0.75),
                    height: SizeConfig.screenHeight *
                        (SizeConfig.isTablet ? 0.26 : 0.22),
                    showNewTag: false,
                    showAmount: false,
                  ),
          ),
        ],
      ),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(SizedBox(height: AppDimens.dimen110));

    list.add(Padding(
      padding: EdgeInsets.only(
        left: AppDimens.dimen20,
        right: AppDimens.dimen20,
        bottom: AppDimens.dimen10,
      ),
      child: Text("Select Amount (GHS)", style: AppTextStyles.titleStyleBold),
    ));

    ///Select amount
    list.add(Obx(
      () => controller.cardsOfMerchantList.isNotEmpty
          ? UiApi.createAmountWidget(
              cards: controller.cardsOfMerchantList,
              onAddToCart: controller.onCardSelected,
            )
          : UiApi.loader(size: 1, child: const ListTileShimmer()),
    ));

    list.add(SizedBox(height: AppDimens.dimen30));
    list.add(Padding(
      padding: EdgeInsets.only(left: AppDimens.dimen20),
      child:
          Text("Other merchant's cards", style: AppTextStyles.titleStyleBold),
    ));
    list.add(
      CardApi.renderCard(
        list: controller.otherMerchantsCardsList,
        isDone: controller.isDoneLoadingOtherMerchantsCards,
        aspectRatio: 2.2,
        childAspectRatio: .78,
        heroTag: "_more_merch",
        titleWidget: const SizedBox(),
        onTap: (card) {
          controller.onOtherMerchantCardOnClick(card);
        },
      ),
    );
    list.add(cardInformation());

    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(Obx(() => merchantInfo(controller.selectedCard.value)));

    list.add(SizedBox(height: AppDimens.dimen40));

    list.add(Padding(
      padding:
          EdgeInsets.only(left: AppDimens.dimen40, right: AppDimens.dimen40),
      child: UiApi.button(
        text: "Go to Your Cart",
        backgroundColor: AppColors.white,
        borderColor: AppColors.kDarkColors,
        opacity: .3,
        textStyle: AppTextStyles.descStyleRegular
            .copyWith(color: AppColors.primaryGreenColor),
        onPressed: () {
          controller.goToCart();
        },
      ),
    ));

    list.add(SizedBox(height: AppDimens.dimen20));

    return list;
  }

  ///Merchant Information for one merchant
  Widget merchantInfo(PrimeCardModel card) {
    return UiApi.merchantClientInfo(
      card.client,
      cardDesc: card.description,
      rateOnTap: () {
        controller.onViewRatings(card.client);
      },
      callOnTap: () {
        controller.callContact(card.client.telephone);
      },
      mapOnTap: () {
        controller.onMapOnClick(card.client);
      },
    );
  }

  ///Card Information
  Widget cardInformation() {
    return Obx(
      () => controller.selectedCardsList.isNotEmpty
          ? UiApi.cardSummary(
              cardsList: controller.selectedCardsList,
              totalAmount: controller.actualTotal.value,
              discounts: controller.discountTotal.value,
              subTotal: controller.subTotal.value,
              onDelOnTap: controller.onDeleteSelectedCard,
            )
          : const SizedBox(),
    );
  }

  List<Widget> cardsListWidget() {
    List<Widget> list = [];
    for (PrimeCardModel p in controller.otherMerchantsCardsList) {
      list.add(Padding(
        padding: EdgeInsets.only(
          right: AppDimens.dimen10,
          left: AppDimens.dimen10,
        ),
        child: CardApi.elevatedCard(
          card: p,
          width: SizeConfig.screenWidth * 0.47,
          //  height: SizeConfig.screenWidth * 0.8,
          showNewTag: true,
          showAmount: false,
          showMerchantName: true,
        ),
      ));
    }

    return list;
  }

  @override
  Widget bottomNavigationBar({BuildContext? context}) {
    return Container(
      decoration: UiApi.deco(),
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.only(
        left: AppDimens.dimen10,
        top: AppDimens.dimen10,
        right: AppDimens.dimen10,
        bottom: AppDimens.dimen20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Obx(
                  () => Row(
                    children: [
                      badge.Badge(
                        badgeStyle: badge.BadgeStyle(badgeColor: AppColors.red),
                        child: UiApi.assetImage(
                          "assets/images/ic_basket.svg",
                          assetColor: AppColors.primaryGreenColor,
                          height: AppDimens.dimen25,
                        ),
                        badgeContent: Text(
                            "${controller.selectedCardsList.length}",
                            style: AppTextStyles.smallSubDescStyleSemiBold
                                .copyWith(color: AppColors.white)),
                      ),
                      SizedBox(width: AppDimens.dimen13),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiApi.richText(
                            mod: [
                              RichTextModel(
                                text: cardUtils?.getCurrency() ?? "GHS",
                                style: AppTextStyles.smallSubDescStyleMedium,
                              ),
                              RichTextModel(
                                text: " ",
                                style: AppTextStyles.subDescRegular,
                              ),
                              RichTextModel(
                                  text: NumberUtils.moneyFormatDouble(
                                      controller.subTotal.value,
                                      decPlace: 2),
                                  style: AppTextStyles.h5StyleBold),
                            ],
                          ),
                          Text(
                            "Sub Total",
                            style: AppTextStyles.smallerSubDescStyleMedium,
                            // textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              // UiApi.bottomItemWidget(
              //   asset: AssetsConfig.shopIcon,
              //   iconColor: AppColors.black,
              //   text: "Visit Shop",
              //   iconSize: AppDimens.dimen30,
              //   onTap: () {
              //     controller.goToMerchantShop(getModel());
              //   },
              // ),
              UiApi.decoratedButton(
                  width: SizeConfig.screenWidth * 0.45,
                  text: "Proceed To Cart",
                  style: AppTextStyles.subDescStyleBold
                      .copyWith(color: AppColors.white),
                  icon: SizedBox(
                    height: AppDimens.dimen25,
                    child: FloatingActionButton(
                      backgroundColor: AppColors.kGreyWhite.withOpacity(.4),
                      mini: true,
                      heroTag: "_cart_add",
                      child: UiApi.assetImage(
                        "assets/images/ic_basket.svg",
                        height: AppDimens.dimen14,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  padding: EdgeInsets.only(
                    // left: AppDimens.dimen5,
                    right: AppDimens.dimen5,
                  ),
                  backgroundColor: AppColors.introColor2,
                  onTap: () {
                    controller.onProceedToCart();
                  })
            ],
          ),
        ],
      ),
    );
  }

  /* @override
  Widget bottomNavigationBar({BuildContext? context}) {
    return Container(
      decoration: UiApi.deco(),
      padding: EdgeInsets.only(
        left: AppDimens.dimen10,
        top: AppDimens.dimen5,
        right: AppDimens.dimen10,
        bottom: AppDimens.dimen30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    UiApi.bottomItemWidget(
                      child: HeartBeat(
                        key: controller.wishListKey,
                        child: Obx(
                          () => UiApi.circleEmpty(
                            padding: EdgeInsets.all(AppDimens.dimen5),
                            margin: EdgeInsets.only(left: AppDimens.dimen3),
                            borderColor: AppColors.market3,
                            borderWidth: 1,
                            child: Icon(
                              !controller.isWishListed.value
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              color: AppColors.market3,
                              size: AppDimens.dimen18,
                            ),
                          ),
                        ),
                      ),
                      text: "Wishlist",
                      onTap: () {
                        controller.onAddToWishlist();
                      },
                    ),
                    SizedBox(width: AppDimens.dimen30),
                    UiApi.bottomItemWidget(
                      asset: AssetsConfig.shopIcon,
                      iconColor: AppColors.black,
                      text: "Visit Shop",
                      iconSize: AppDimens.dimen30,
                      onTap: () {
                        controller.goToMerchantShop();
                      },
                    ),
                  ],
                ),
              ),
              UiApi.button(
                onPressed: () {
                  controller.onViewBasket();
                },
                child: UiApi.buttonChild(
                  assetSize: AppDimens.dimen20,
                  asset: AssetsConfig.shoppingCart,
                  assetColor: AppColors.white,
                  text: 'View Basket',
                  style: AppTextStyles.descStyleMedium
                      .copyWith(color: AppColors.white),
                ),
                backgroundColor: AppColors.primaryGreenColor,
                width: SizeConfig.screenWidth * 0.52,
              ),
            ],
          )
        ],
      ),
    );
  }*/
}
