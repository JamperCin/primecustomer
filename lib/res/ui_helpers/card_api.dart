import 'package:carousel_slider/carousel_slider.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:primecustomer/data/enum/PromotionType.dart';
import 'package:primecustomer/data/enum/display_type.dart';
import 'package:primecustomer/data/enum/wallet_type.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/data/model/remote/advert_image_model.dart';
import 'package:primecustomer/data/model/remote/card_account.dart';
import 'package:primecustomer/data/model/remote/eFund_card_model.dart';
import 'package:primecustomer/data/model/remote/e_fund_request_model.dart';
import 'package:primecustomer/data/model/remote/gifted_card.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/advert_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in_up.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:get/get.dart';

import '../../utils/Utils.dart';
import '../../utils/card_utils.dart';
import '../app/app_colors.dart';
import '../app/app_dimens.dart';
import '../app/app_text_styles.dart';

class CardApi {
  ///Main Entry to render Gift cards
  ///Render Card
  static Widget renderCard({
    RxBool? isDone,
    required RxList<Object> list,
    DisplayType cardType = DisplayType.LINEAR_HORIZONTAL,
    Function(PrimeCardModel)? onTap,
    Function(Object)? onAccountTap,
    Function? onSubTextOnClick,
    String? heroTag,
    String? title,
    String? subTitle,
    Color? titleViewBgColor,
    Widget? loader,
    Widget? subTitleWidget,
    Widget? titleWidget,
    bool showSubText = true,
    bool showMerchantName = true,
    bool showAmount = false,
    bool showSelector = false,
    bool showDeleteIcon = false,
    bool showNewTag = true,
    bool showPromo = false,
    ScrollController? scrollController,
    double? aspectRatio,
    double? childAspectRatio,
    int loaderLength = 1,
    List<Widget>? widgetList,
    Function(CardUtils)? onAddToCart,
    Function(CardUtils)? onDelete,
    List<int> advertIndexes = const [],
    RxList<AdvertImageModel>? advertList,
  }) {
    isDone = isDone ?? false.obs;
    return Obx(
      () => (list.isNotEmpty
          ? Column(
              children: [
                titleWidget ??
                    UiApi.titleView(
                      title: title ?? "",
                      backgroundColor: titleViewBgColor ?? AppColors.background,
                      subTitle: subTitleWidget ??
                          UiApi.subTitleView(
                            text: subTitle ?? "View All",
                            onSubTextOnClick: onSubTextOnClick,
                          ),
                    ),
                SizedBox(height: AppDimens.dimen1),
                checkCardType(
                  list: list,
                  heroTag: heroTag,
                  cardType: cardType,
                  onTap: onTap,
                  onAccountTap: onAccountTap,
                  showAmount: showAmount,
                  showSubText: showSubText,
                  showSelector: showSelector,
                  onAddToCart: onAddToCart,
                  showDeleteIcon: showDeleteIcon,
                  showNewTag: showNewTag,
                  onDelete: onDelete,
                  scrollController: scrollController,
                  showMerchantName: showMerchantName,
                  aspectRatio: aspectRatio,
                  showPromo: showPromo,
                  childAspectRatio: childAspectRatio,
                  widgetList: widgetList,
                  advertList: advertList,
                  advertIndexes: advertIndexes,
                ),
                SizedBox(height: AppDimens.dimen20),
              ],
            )
          : isDone!.value
              ? const SizedBox()
              : loader ??
                  UiApi.loader(
                    child: const ListTileShimmer(
                      hasBottomBox: true,
                      hasCustomColors: true,
                      isDisabledAvatar: true,
                    ),
                    size: loaderLength,
                  )),
    );
  }

  ///Main Entry to render Gift cards
  ///Render Card
  static Widget checkCardType({
    RxList<Object>? list,
    DisplayType cardType = DisplayType.LINEAR_HORIZONTAL,
    Function(PrimeCardModel)? onTap,
    Function(Object)? onAccountTap,
    String? heroTag,
    bool showSubText = true,
    bool showAmount = false,
    bool showSelector = false,
    bool showDeleteIcon = false,
    bool showMerchantName = true,
    bool showNewTag = true,
    bool showPromo = false,
    ScrollController? scrollController,
    double? aspectRatio,
    double? childAspectRatio,
    Function(CardUtils)? onAddToCart,
    Function(CardUtils)? onDelete,
    List<Widget>? widgetList,
    List<int> advertIndexes = const [],
    RxList<AdvertImageModel>? advertList,
  }) {
    switch (cardType) {
      case DisplayType.GRID_HORIZONTAL:
        return gridHorizontal(
          onTap: onTap,
          list: list as RxList<PrimeCardModel>,
          heroTag: heroTag,
          showAmount: showAmount,
          showSubText: showSubText,
          showSelector: showSelector,
          onAddToCart: onAddToCart,
          showDeleteIcon: showDeleteIcon,
          showNewTag: showNewTag,
          onDelete: onDelete,
          showPromo: showPromo,
          showMerchantName: showMerchantName,
          aspectRatio: aspectRatio,
          childAspectRatio: childAspectRatio,
        );

      case DisplayType.LINEAR_HORIZONTAL:
        return linearHorizontal(
          onTap: onTap,
          list: list as RxList<PrimeCardModel>,
          heroTag: heroTag,
          showAmount: showAmount,
          showSubText: showSubText,
          showSelector: showSelector,
          onAddToCart: onAddToCart,
          showDeleteIcon: showDeleteIcon,
          showNewTag: showNewTag,
          scrollController: scrollController,
          onDelete: onDelete,
          showPromo: showPromo,
          showMerchantName: showMerchantName,
          aspectRatio: aspectRatio,
          childAspectRatio: childAspectRatio,
        );

      case DisplayType.LINEAR_VERTICAL:
        return linearVertical(
          onTap: onTap,
          list: list as RxList<PrimeCardModel>,
          heroTag: heroTag,
          showAmount: showAmount,
          showSubText: showSubText,
          showSelector: showSelector,
          onAddToCart: onAddToCart,
          showDeleteIcon: showDeleteIcon,
          showNewTag: showNewTag,
          onDelete: onDelete,
          scrollController: scrollController,
          showMerchantName: showMerchantName,
          showPromo: showPromo,
          aspectRatio: aspectRatio,
          childAspectRatio: childAspectRatio,
        );

      case DisplayType.GRID_VERTICAL:
        return gridVertical(
          onTap: onTap,
          list: list as RxList<PrimeCardModel>,
          heroTag: heroTag,
          showAmount: showAmount,
          showSubText: showSubText,
          showSelector: showSelector,
          onAddToCart: onAddToCart,
          showDeleteIcon: showDeleteIcon,
          showNewTag: showNewTag,
          onDelete: onDelete,
          showMerchantName: showMerchantName,
          showPromo: showPromo,
          aspectRatio: aspectRatio,
          childAspectRatio: childAspectRatio,
          advertIndexes: advertIndexes,
          advertList: advertList,
        );
      case DisplayType.LINEAR_PRODUCTS:
      case DisplayType.RECOMMENDED:
        return const SizedBox.shrink();
    }
  }

  ///Render a horizontal list of cards with cards scrolling horizontally
  static Widget linearHorizontal({
    RxList<PrimeCardModel>? list,
    Function(PrimeCardModel)? onTap,
    String? heroTag,
    bool showSubText = true,
    bool showAmount = false,
    bool showSelector = false,
    bool showDeleteIcon = false,
    bool showMerchantName = true,
    bool showNewTag = true,
    bool showPromo = false,
    ScrollController? scrollController,
    double? aspectRatio,
    double? childAspectRatio,
    Function(CardUtils)? onAddToCart,
    Function(CardUtils)? onDelete,
  }) {
    return FadeInUp(
      child: AspectRatio(
        aspectRatio: SizeConfig.getAspectRatio(v: aspectRatio ?? 2.2),
        child: Padding(
            padding: EdgeInsets.only(
                left: AppDimens.dimen3, right: AppDimens.dimen3),
            child: GridView(
              padding: EdgeInsets.all(AppDimens.dimen10),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              children: List<Widget>.generate((list?.length)!, (int index) {
                CardUtils cardUtils = CardUtils(list![index]);
                cardUtils.setIndex(index);
                cardUtils.setList(list);
                return card(
                  cardUtils: cardUtils,
                  onTap: onTap,
                  heroTag: heroTag,
                  showAmount: showAmount,
                  showSubText: showSubText,
                  subText: showPromo ? getPromoTextWidget(cardUtils) : null,
                  showSelector: showSelector,
                  onAddToCart: onAddToCart,
                  showDeleteIcon: showDeleteIcon,
                  showMerchantName: showMerchantName,
                  onDelete: onDelete,
                  showNewTag: showNewTag,
                );
              }),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: AppDimens.subDesc,
                crossAxisSpacing: AppDimens.subDesc,
                childAspectRatio: childAspectRatio ?? .8,
              ),
            )),
      ),
    );
  }

  static Widget linearVertical({
    RxList<PrimeCardModel>? list,
    Function(PrimeCardModel)? onTap,
    String? heroTag,
    bool showSubText = true,
    bool showAmount = false,
    bool showSelector = false,
    bool showDeleteIcon = false,
    bool showMerchantName = true,
    bool showNewTag = true,
    bool showPromo = false,
    ScrollController? scrollController,
    double? aspectRatio,
    double? childAspectRatio,
    Function(CardUtils)? onAddToCart,
    Function(CardUtils)? onDelete,
  }) {
    return FadeInUp(
      child: AspectRatio(
        aspectRatio: SizeConfig.getAspectRatio(v: aspectRatio ?? .3),
        child: Padding(
            padding: EdgeInsets.only(
                left: AppDimens.dimen3, right: AppDimens.dimen3),
            child: GridView(
              padding: EdgeInsets.all(AppDimens.dimen10),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: List<Widget>.generate((list?.length)!, (int index) {
                CardUtils cardUtils = CardUtils(list![index]);
                cardUtils.setIndex(index);
                cardUtils.setList(list);
                return card(
                  cardUtils: cardUtils,
                  onTap: onTap,
                  heroTag: heroTag,
                  subText: showPromo ? getPromoTextWidget(cardUtils) : null,
                  showAmount: showAmount,
                  showSubText: showSubText,
                  showSelector: showSelector,
                  onAddToCart: onAddToCart,
                  showDeleteIcon: showDeleteIcon,
                  showMerchantName: showMerchantName,
                  onDelete: onDelete,
                );
              }),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: AppDimens.subDesc,
                crossAxisSpacing: AppDimens.subDesc,
                childAspectRatio: childAspectRatio ?? 1.7,
              ),
            )),
      ),
    );
  }

  ///Render a horizontal GridView of the cards
  static Widget gridHorizontal({
    RxList<PrimeCardModel>? list,
    Function(PrimeCardModel)? onTap,
    String? heroTag,
    bool showSubText = true,
    bool showAmount = false,
    bool showSelector = false,
    bool showDeleteIcon = false,
    bool showMerchantName = true,
    bool showPromo = false,
    double? aspectRatio,
    double? childAspectRatio,
    Function(CardUtils)? onAddToCart,
    Function(CardUtils)? onDelete,
    bool showNewTag = true,
  }) {
    return FadeInUp(
      child: AspectRatio(
        aspectRatio: SizeConfig.getAspectRatio(v: aspectRatio ?? .8),
        child: Padding(
            padding: EdgeInsets.only(
                left: AppDimens.dimen3, right: AppDimens.dimen3),
            child: GridView(
              padding: EdgeInsets.all(AppDimens.dimen10),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List<Widget>.generate((list?.length)!, (int index) {
                CardUtils cardUtils = CardUtils(list![index]);
                cardUtils.setIndex(index);
                cardUtils.setList(list);
                return card(
                  cardUtils: cardUtils,
                  onTap: onTap,
                  heroTag: heroTag,
                  showAmount: showAmount,
                  showSubText: showSubText,
                  subText: showPromo ? getPromoTextWidget(cardUtils) : null,
                  showSelector: showSelector,
                  onAddToCart: onAddToCart,
                  showDeleteIcon: showDeleteIcon,
                  showMerchantName: showMerchantName,
                  onDelete: onDelete,
                );
              }),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: AppDimens.subDesc,
                crossAxisSpacing: AppDimens.subDesc,
                childAspectRatio: childAspectRatio ?? .75,
              ),
            )),
      ),
    );
  }

  ///Render a horizontal GridView of the cards
  static Widget gridVertical({
    RxList<PrimeCardModel>? list,
    Function(PrimeCardModel)? onTap,
    String? heroTag,
    bool showSubText = true,
    bool showAmount = false,
    bool showSelector = false,
    bool showDeleteIcon = false,
    bool showMerchantName = true,
    bool showNewTag = true,
    bool showPromo = false,
    Function(CardUtils)? onAddToCart,
    Function(CardUtils)? onDelete,
    double? aspectRatio,
    double? childAspectRatio,
    EdgeInsets? padding,
    List<int> advertIndexes = const [],
    RxList<AdvertImageModel>? advertList,
  }) {
    List<Widget> row = [];
    List<Widget> column = [];

    int i = -1;
    int tempIndex = -1;
    int rowLength = 2;

    for (PrimeCardModel c in list!) {
      i++;

      ///Initialise the cardutils
      CardUtils cardUtils = CardUtils(c);
      cardUtils.setIndex(i);
      cardUtils.setList(list);

      ///Add the card widget to the row
      row.add(Flexible(
        flex: 1,
        child: AspectRatio(
          aspectRatio: SizeConfig.getGridAspectRatio(
              v: aspectRatio ?? (SizeConfig.isTablet ? 1.0 : 1.2)),
          child: Padding(
            padding: padding ??
                EdgeInsets.only(
                  bottom: AppDimens.dimen10,
                  left: AppDimens.dimen3,
                  right: AppDimens.dimen3,
                ),
            child: card(
              cardUtils: cardUtils,
              onTap: onTap,
              heroTag: heroTag,
              subText: showPromo ? getPromoTextWidget(cardUtils) : null,
              showAmount: showAmount,
              showSubText: showSubText,
              showSelector: showSelector,
              onAddToCart: onAddToCart,
              showDeleteIcon: showDeleteIcon,
              showMerchantName: showMerchantName,
              onDelete: onDelete,
            ),
          ),
        ),
      ));

      if (i == tempIndex + rowLength) {
        column.add(Row(
          children: row,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ));
        tempIndex = i;
        row = [];
      }

      ///Insert Adverts in between the list
      if (advertList != null && advertIndexes.contains(i)) {
        column.add(SizedBox(height: AppDimens.dimen20));
        column.add(AdvertApi.renderAdvert(
          list: advertList,
          color: AppColors.white,
        ));
        column.add(SizedBox(height: AppDimens.dimen20));
      }

      ///Insert spaces horizontally between cards
      if (row.length == 1) {
        // row.add(SizedBox(width: AppDimens.dimen5));
      }

      if (i == list.length - 1 && i % 2 == 0) {
        row.add(
          Flexible(flex: 1, child: SizedBox(width: SizeConfig.screenWidth)),
        );
        column.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: row,
        ));
      }
    }

    return Padding(
      padding: EdgeInsets.only(left: AppDimens.dimen5, right: AppDimens.dimen5),
      child: Column(children: column),
    );
  }

  ///Render a horizontal GridView of the cards
  static List<Widget> renderCardAccount({
    RxList<BaseObject>? list,
    Function(BaseObject, CardUtils, bool)? onTap,
    String? heroTag,
    WalletType? type,
  }) {
    List<Widget>? widgetList = [];

    ///Handle E-Fund
    if (type == WalletType.E_FUND) {
      if ((list ?? []).isNotEmpty) {
        widgetList.add(SizedBox(height: AppDimens.dimen20));
        widgetList.add(UiApi.divider(width: SizeConfig.screenWidth, height: 1));
      }
      for (BaseObject obj in list ?? []) {
        widgetList.add(UiApi.eFundItem(obj as EfundRequestModel, onTap: onTap));
      }
      return widgetList;
    }

    for (int i = 0; i < list!.length; i++) {
      CardUtils cardUtils = checkTypeOfObject(list[i]);
      cardUtils.setIndex(i);

      widgetList.add(cardAccountItem(
        cardUtils: cardUtils,
        onTap: onTap,
        heroTag: heroTag,
        type: type,
        object: list[i],
      ));
    }

    return widgetList;
  }

  static Widget cardAccountItem({
    Function(BaseObject, CardUtils, bool)? onTap,
    String? heroTag,
    double? width,
    required CardUtils cardUtils,
    WalletType? type,
    required BaseObject object,
    EdgeInsetsGeometry? padding,
  }) {
    PrimeCardModel card = cardUtils.card;
    return InkWell(
      onTap: () {
        if (onTap != null) (onTap(object, cardUtils, false));
      },
      child: Container(
        decoration: UiApi.deco(borderRadius: 7),
        height:
            cardUtils.isGiftedCard() ? AppDimens.dimen130 : AppDimens.dimen110,
        width: width,
        margin: EdgeInsets.only(
          top: AppDimens.dimen10,
          left: AppDimens.dimen16,
          right: AppDimens.dimen16,
        ),
        padding: padding ?? EdgeInsets.only(left: AppDimens.dimen5),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                width: AppDimens.dimen60,
                child: UiApi.imageLoader(
                    url: card.image,
                    heroTag: cardUtils.getHeroTag(alias: heroTag),
                    fit: BoxFit.fitWidth,
                    placeHolder: AssetImageWidget(
                      asset: 'assets/images/ic_cards_cluster.png',
                    )),
              ),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(
                width: SizeConfig.screenWidth,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: AppDimens.dimen3,
                    bottom: AppDimens.dimen3,
                    left: AppDimens.dimen5,
                    right: AppDimens.dimen5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiApi.richText(maxLines: 1, mod: [
                        RichTextModel(
                          text: cardUtils.getMerchantName(),
                          style: AppTextStyles.subDescStyleBold,
                        ),
                      ]),

                      ///Amount and Balance on Card Details
                      UiApi.richText(maxLines: 1, mod: [
                        RichTextModel(
                            text: "Bal: ",
                            style: AppTextStyles.smallSubDescStyleLight),
                        RichTextModel(
                            text: cardUtils.getFormattedAccountBalance(dec: 2),
                            style: AppTextStyles.subDescStyleBold
                                .copyWith(color: AppColors.primaryGreenColor)),
                        RichTextModel(
                            text: " | ", style: AppTextStyles.descStyleMedium),
                        // RichTextModel(
                        //     text: "Price: ",
                        //     style: AppTextStyles.smallSubDescStyleLight),
                        RichTextModel(
                            text: cardUtils.getCurrencyCardActualAmount(dec: 2),
                            style: AppTextStyles.smallSubDescStyleRegular),
                      ]),
                      SizedBox(height: AppDimens.dimen2),

                      ///Card Title Details
                      /*cardUtils.getCardTitle().isEmpty
                          ? const SizedBox()
                          :*/
                      UiApi.richText(
                        maxLines: 1,
                        mod: [
                          RichTextModel(
                            text: cardUtils.getCardTitle(
                                defVal: "No title available"),
                            style: AppTextStyles.smallSubDescStyleRegular,
                          ),
                          /*RichTextModel(
                            text: cardUtils.getCardDescription().isEmpty
                                ? "\nhghkhj"
                                : "\n${cardUtils.getCardDescription()}",
                            style: AppTextStyles.smallestSubDescStyleLight,
                          ),*/
                        ],
                      ),
                      SizedBox(height: AppDimens.dimen3),

                      ///Location details
                      /*cardUtils.getLocation().isEmpty
                          ? const SizedBox()
                          :*/
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: AppDimens.dimen14,
                            color: AppColors.primaryGreenColor,
                          ),
                          SizedBox(width: AppDimens.dimen2),
                          Flexible(
                            child: UiApi.richText(
                              maxLines: 1,
                              mod: [
                                RichTextModel(
                                  text: cardUtils.getLocation(
                                      defaultVal: "Location not available"),
                                  style: AppTextStyles.smallSubDescStyleLight,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppDimens.dimen2),

                      ///gifted person details
                      cardUtils.isGiftedCard()
                          ? Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: AppDimens.dimen14,
                                      color: AppColors.primaryGreenColor,
                                    ),
                                    SizedBox(width: AppDimens.dimen2),
                                    Flexible(
                                      child: UiApi.richText(
                                        maxLines: 1,
                                        mod: [
                                          RichTextModel(
                                            text: cardUtils.giftTypeText(type),
                                            style: AppTextStyles
                                                .smallestSubDescStyleMedium,
                                          ),
                                          RichTextModel(
                                            text: cardUtils.giftPersonName(
                                                type: type),
                                            style: AppTextStyles
                                                .smallSubDescStyleMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                //SizedBox(height: AppDimens.dimen2),
                              ],
                            )
                          : const SizedBox(),

                      ///Status widget
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UiApi.cardWidget(
                            borderColor: cardUtils.accountStatusColor(),
                            borderWidth: 1.3,
                            elevation: 0,
                            child: SizedBox(
                              width: AppDimens.dimen100,
                              child: Padding(
                                padding: EdgeInsets.all(AppDimens.dimen3),
                                child: Text(
                                  cardUtils.getAccountStatus(),
                                  style: AppTextStyles.smallestSubDescStyleBold,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            //color: AppDimens.dimen10,
                          ),

                          ///Emoji icon to send feedback
                          cardUtils.isGiftedCard()
                              ? SizedBox(
                                  height: AppDimens.dimen35,
                                  child: FloatingActionButton(
                                      backgroundColor: AppColors.white,
                                      mini: true,
                                      elevation: 0,
                                      onPressed: () {
                                        ///when an emoji is clicked send TRUE
                                        if (onTap != null) {
                                          (onTap(cardUtils.object!, cardUtils,
                                              true));
                                        }
                                      },
                                      child: Text(cardUtils.emojiFeedback(),
                                          style: AppTextStyles.h4StyleBold)),
                                )
                              : const SizedBox(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 0,
              child: Container(
                width: .6,
                height: SizeConfig.screenWidth *
                    (cardUtils.isGiftedCard() ? 0.25 : 0.2),
                color: AppColors.kSmokeWhite,
              ),
            ),

            ///Account date of purchased or created
            Expanded(
              flex: 0,
              child: SizedBox(
                width: AppDimens.dimen55,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: AppDimens.dimen5,
                    bottom: AppDimens.dimen5,
                    left: AppDimens.dimen5,
                    right: AppDimens.dimen5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cardUtils.accountDate(),
                        style: AppTextStyles.titleStyleRegular
                            .copyWith(color: AppColors.lightDark),
                      ),
                      SizedBox(height: AppDimens.dimen5),
                      Text(
                        cardUtils.accountDate(format: "MMM yy"),
                        style: AppTextStyles.subDescRegular
                            .copyWith(fontSize: AppDimens.dimen10)
                            .copyWith(color: AppColors.lightDark),
                      ),
                      SizedBox(height: AppDimens.dimen5),
                      Text(
                        cardUtils.accountDate(format: "hh:mm aa"),
                        style: AppTextStyles.smallestSubDescStyleRegular
                            .copyWith(color: AppColors.lightDark),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /*Flexible(
              flex: 0,
              child: Container(
                width: AppDimens.dimen2,
                height: SizeConfig.screenWidth * 3,
                color: cardUtils.accountStatusColor(),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  static Widget card({
    Function(PrimeCardModel)? onTap,
    String? heroTag,
    Decoration? deco,
    Widget? subText,
    bool showSubText = true,
    bool showAmount = false,
    bool showSelector = false,
    bool showDeleteIcon = false,
    bool showMerchantName = true,
    bool showNewTag = true,
    required CardUtils cardUtils,
    Function(CardUtils)? onAddToCart,
    Function(CardUtils)? onDelete,
  }) {
    PrimeCardModel card = cardUtils.card;
    return FadeInUp(
      child: InkWell(
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        splashColor: AppColors.lineColor.withOpacity(0.2),
        onTap: () {
          if (onTap != null) onTap(card);
        },
        child: Container(
          height: SizeConfig.screenWidth,
          width: SizeConfig.screenWidth,
          decoration: deco,
          child: Padding(
            padding: EdgeInsets.all(AppDimens.dimen3),
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Stack(
                    children: [
                      Container(
                        decoration: UiApi.deco(borderRadius: AppDimens.dimen10),
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenWidth,
                        child: Center(
                          child: UiApi.imageLoader(
                            url: card.image,
                            border: AppDimens.dimen10,
                            heroTag: cardUtils.getHeroTag(alias: heroTag),
                          ),
                        ),
                      ),
                      showAmount ? amountWidget(cardUtils) : const SizedBox(),
                      showSelector
                          ? selectorWidget(cardUtils, call: onAddToCart)
                          : const SizedBox(),
                      showDeleteIcon
                          ? deleteWidget(cardUtils, call: onDelete)
                          : const SizedBox(),
                      showNewTag && cardUtils.isNewCard()
                          ? newCardTag()
                          : const SizedBox()
                    ],
                  ),
                ),
                Flexible(
                  flex: 0,
                  child: Padding(
                    padding: EdgeInsets.only(top: AppDimens.dimen3),
                    child: Column(
                      children: [
                        showMerchantName
                            ? merchantNameWidget(cardUtils)
                            : SizedBox(height: AppDimens.dimen5),
                        showSubText
                            ? (subText ?? getAmountRangeWidget(cardUtils))
                            : SizedBox(
                                height: showMerchantName
                                    ? AppDimens.dimen10
                                    : AppDimens.dimen16),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget elevatedCard({
    required PrimeCardModel card,
    double? height,
    double? width,
    double borderRadius = 10,
    bool showAmount = false,
    bool showMerchantName = false,
    bool showNewTag = true,
  }) {
    CardUtils cardUtils = CardUtils(card);
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Stack(
              children: [
                Center(
                  child: UiApi.elevatedImageLoader(
                    url: card.image,
                    height: height,
                    width: width,
                    borderRadius: borderRadius,
                  ),
                ),
                showAmount ? amountWidget(cardUtils) : const SizedBox(),
                showNewTag && cardUtils.isNewCard()
                    ? newCardTag()
                    : const SizedBox()
              ],
            ),
          ),
          Flexible(
            flex: 0,
            child: Padding(
              padding: EdgeInsets.only(top: AppDimens.dimen8),
              child: Column(
                children: [
                  showMerchantName
                      ? merchantNameWidget(cardUtils)
                      : SizedBox(height: AppDimens.dimen5),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  static Widget eFundElevatedCard({
    required EfundCardModel efund,
    double? height,
    double? width,
    double borderRadius = 10,
    bool showAmount = false,
    bool showMerchantName = false,
    bool showEFundStatus = false,
    bool showNewTag = true,
  }) {
    CardUtils cardUtils = CardUtils(efund.card);
    PrimeCardModel card = cardUtils.card;
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Stack(
              children: [
                Center(
                  child: UiApi.elevatedImageLoader(
                    url: card.image,
                    height: height,
                    width: width,
                    borderRadius: borderRadius,
                  ),
                ),
                showAmount ? amountWidget(cardUtils) : const SizedBox(),
                showNewTag && cardUtils.isNewCard()
                    ? newCardTag()
                    : const SizedBox()
              ],
            ),
          ),
          Flexible(
            flex: 0,
            child: Padding(
              padding: EdgeInsets.only(top: AppDimens.dimen8),
              child: Column(
                children: [
                  showMerchantName
                      ? merchantNameWidget(cardUtils)
                      : const SizedBox(),
                  showEFundStatus ? eFundStatusWidget(efund) : const SizedBox()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  static List<Widget> listCards({
    RxList<PrimeCardModel>? list,
    Function(PrimeCardModel)? onTap,
    String? heroTag,
    List<Widget>? widgetList,
    bool showSubText = true,
    bool showAmount = false,
    bool showSelector = false,
    bool showDeleteIcon = false,
    bool showMerchantName = true,
    Function(CardUtils)? onAddToCart,
    Function(CardUtils)? onDelete,
  }) {
    List<Widget> rows = [];
    // List<Widget> column = [];

    for (int i = 0; i < list!.length; i++) {
      CardUtils cardUtils = CardUtils(list[i]);
      cardUtils.setIndex(i);
      cardUtils.setList(list);
      Widget cardWidget = Flexible(
        child: SizedBox(
          child: card(
            cardUtils: cardUtils,
            onTap: onTap,
            heroTag: heroTag,
            subText: getPromoTextWidget(cardUtils),
            showAmount: showAmount,
            showSubText: showSubText,
            showSelector: showSelector,
            onAddToCart: onAddToCart,
            showMerchantName: showMerchantName,
            showDeleteIcon: showDeleteIcon,
            onDelete: onDelete,
          ),
          height: SizeConfig.screenWidth / 2.52,
        ),
        flex: 1,
      );

      rows.add(cardWidget);

      if (rows.length == 2) {
        widgetList?.add(Row(
            children: rows, mainAxisAlignment: MainAxisAlignment.spaceAround));
        rows = [];
      } else if (i == list.length - 1 && list.length % 2 != 0) {
        widgetList?.add(Row(
          children: [
            cardWidget,
            Flexible(
                flex: 1,
                child: SizedBox(
                  width: SizeConfig.screenWidth,
                ))
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ));
      }
    }
    if (list.isEmpty) {
      widgetList?.add(const ListTileShimmer());
    }

    print("Addig AGAIN == ${widgetList?.length}");

    return widgetList!;
  }

  static Widget cardSlider(
    List<PrimeCardModel> list, {
    Function(int)? onPageChanged,
  }) {
    return CarouselSlider.builder(
      itemCount: list.length,
      options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: false,
          enableInfiniteScroll: list.length > 2,
          reverse: true,
          autoPlayCurve: Curves.easeIn,
          scrollPhysics: const BouncingScrollPhysics(),
          aspectRatio: SizeConfig.getAspectRatio(v: 3),
          viewportFraction: .5,
          onPageChanged: (index, val) {
            if (onPageChanged != null) {
              onPageChanged(index);
            }
          }),
      itemBuilder: (context, index, ind) {
        return Padding(
          padding: EdgeInsets.all(AppDimens.dimen5),
          child: elevatedCard(
            card: list[index],
            // width: SizeConfig.screenWidth * 0.47,
            showNewTag: true,
            showAmount: true,
          ),
        );
      },
    );
  }

  ///======================= Widgets =================================================

  static Widget newCardTag() {
    return Align(
      child: Padding(
        padding: const EdgeInsets.only(right: 1, top: 1),
        child: UiApi.assetImage(
          "assets/images/ic_new_card.png",
          height: AppDimens.dimen20,
          width: AppDimens.dimen20,
        ),
      ),
      alignment: Alignment.topRight,
    );
  }

  static Widget getPromoTextWidget(CardUtils cardUtils) {
    PrimeCardModel card = cardUtils.card;
    String currency = cardUtils.currency;

    /// Discounted promotion amount
    if (cardUtils.promotionType == PromotionType.promotionDiscount) {
      return RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "${card.currency ?? currency} ",
              style: AppTextStyles.subDescStyleLight.copyWith(
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 2),
            ),
            TextSpan(
              text: NumberUtils.moneyFormat(card.amount),
              style: AppTextStyles.subDescStyleLight.copyWith(
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 2),
            ),
            const TextSpan(text: " "),
            TextSpan(
              text: "${card.currency ?? currency} ",
              style: AppTextStyles.subDescRegular,
            ),
            TextSpan(
              text: NumberUtils.moneyFormat(cardUtils.getDueAmount()),
              style: AppTextStyles.subDescRegular,
            ),
          ],
        ),
      );
    } else {
      return const Text("");
    }
  }

  ///Return an Amount Widget to be shown on cards
  ///@param [carUtils]
  ///This widget is shown on a card when the boolean parameter [showAmount] is set to TRUE
  static Widget amountWidget(CardUtils cardUtils) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: UiApi.container(
        child: Text(
          cardUtils.getCurrencyDueAmount(dec: 2),
          style:
              AppTextStyles.subDescStyleBold.copyWith(color: AppColors.white),
        ),
      ),
    );
  }

  static Widget merchantNameWidget(CardUtils cardUtils) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: Utils.capitalizeLetter(
                val: cardUtils.getClient().name, capAllFirstLetters: true),
            style: AppTextStyles.smallSubDescStyleBold,
          ),
        ],
      ),
    );
  }

  static Widget eFundStatusWidget(EfundCardModel eFund) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: "| Not Funded",
            style: AppTextStyles.smallSubDescStyleBold
                .copyWith(color: CardUtils(eFund.card).accountStatusColor()),
          ),
        ],
      ),
    );
  }

  static Widget getAmountRangeWidget(CardUtils cardUtils) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: cardUtils.getAmountRange(),
            style:
                AppTextStyles.subDescRegular.copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }

  ///Return an Amount Widget to be shown on cards
  ///@param [carUtils]
  ///This widget is shown on a card when the boolean parameter [showAmount] is set to TRUE
  static Widget selectorWidget(CardUtils cardUtils,
      {Function(CardUtils)? call}) {
    RxBool isSelected = cardUtils.card.isAlreadySelected.obs;

    return Align(
      alignment: Alignment.bottomRight,
      child: Obx(
        () => Container(
          margin: EdgeInsets.only(bottom: AppDimens.dimen4),
          height: AppDimens.dimen30,
          child: FloatingActionButton(
            backgroundColor:
                isSelected.value ? AppColors.red : AppColors.primaryGreenColor,
            child: Icon(
              isSelected.value ? Icons.remove : Icons.add,
              size: AppDimens.dimen16,
            ),
            heroTag: cardUtils.getHeroTag(alias: "${cardUtils.index}"),
            mini: true,
            onPressed: () {
              cardUtils.setSelection(!cardUtils.card.isAlreadySelected);
              cardUtils.list.removeAt(cardUtils.index);
              cardUtils.list.insert(cardUtils.index, cardUtils.card);
              if (call != null) call(cardUtils);
            },
          ),
        ),
      ),
    );
  }

  ///Return an Amount Widget to be shown on cards
  ///@param [carUtils]
  ///This widget is shown on a card when the boolean parameter [showAmount] is set to TRUE
  static Widget deleteWidget(CardUtils cardUtils, {Function(CardUtils)? call}) {
    return Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: EdgeInsets.only(bottom: AppDimens.dimen4),
          height: AppDimens.dimen30,
          child: FloatingActionButton(
            backgroundColor: Colors.black.withOpacity(.5), //AppColors.red,
            child: Icon(
              Icons.delete_forever_rounded,
              size: AppDimens.dimen18,
              color: AppColors.white,
            ),
            heroTag: cardUtils.getHeroTag(alias: "${cardUtils.index}"),
            mini: true,
            onPressed: () {
              if (call != null) call(cardUtils);
            },
          ),
        ));
  }

  ///Check which Card account we are displaying
  static CardUtils checkTypeOfObject(BaseObject object) {
    if (object is CardAccount) {
      return CardUtils(object.card).setObject(object);
    }

    if (object is GiftedCard) {
      return CardUtils(object.account.card).setObject(object);
    }

    //todo if (object is EfundRequestModel) {
    //   return CardUtils(object.cardAccount.card).setObject(object);
    // }

    return CardUtils(const PrimeCardModel());
  }

  static Widget cardSummaryItem(
    PrimeCardModel card, {
    double opacity = 0.1,
    Color? borderColor,
    int count = 1,
    double radius = 10,
    Color? textAmountColor,
    EdgeInsetsGeometry? padding,
    GestureTapCallback? onDelOnTap,
  }) {
    CardUtils cardUtils = CardUtils(card);
    return Container(
      decoration: UiApi.deco(
          borderRadius: radius,
          borderColor: borderColor ?? AppColors.line,
          opacity: opacity),
      margin: EdgeInsets.only(bottom: AppDimens.dimen2),
      padding: padding ??
          EdgeInsets.only(
            right: AppDimens.dimen8,
            //bottom: AppDimens.dimen3,
            left: AppDimens.dimen8,
          ),
      child: Row(
        children: [
          Container(
            child: UiApi.imageLoader(
              url: card.image,
              placeHolder: UiApi.assetImage(
                "assets/images/ic_rect.png",
                height: AppDimens.dimen40,
                width: AppDimens.dimen65,
              ),
              height: AppDimens.dimen40,
              width: AppDimens.dimen65,
              border: 2,
            ),
            decoration: UiApi.deco(opacity: 0.5, borderRadius: 2),
          ),
          SizedBox(width: AppDimens.dimen10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppDimens.dimen5),
                UiApi.richText(
                  maxLines: 1,
                  mod: [
                    RichTextModel(
                      text: cardUtils.getMerchantName(),
                      style: AppTextStyles.descStyleBold,
                    )
                  ],
                ),
                SizedBox(height: AppDimens.dimen3),
                UiApi.richText(
                  maxLines: 2,
                  mod: [
                    RichTextModel(
                      text: cardUtils.getCardTitle(),
                      style: AppTextStyles.subDescStyleLight,
                    )
                  ],
                ),
                SizedBox(height: AppDimens.dimen3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UiApi.richText(
                      maxLines: 1,
                      mod: [
                        RichTextModel(
                          text: "${cardUtils.getCurrency()} ",
                          style:
                              AppTextStyles.smallerSubDescStyleRegular.copyWith(
                            color: textAmountColor ?? AppColors.redLight,
                          ),
                        ),
                        RichTextModel(
                          text: cardUtils.getFormattedDueAmount(dec: 2),
                          style: AppTextStyles.descStyleSemiBold.copyWith(
                            color: textAmountColor ?? AppColors.redLight,
                          ),
                        ),
                        RichTextModel(text: "  "),
                        cardUtils.promotionType ==
                                PromotionType.promotionDiscount
                            ? RichTextModel(
                                text: cardUtils.getCurrencyCardActualAmount(
                                    dec: 2),
                                style: AppTextStyles.smallSubDescStyleRegular
                                    .copyWith(
                                  fontSize: AppDimens.dimen9,
                                  decoration: TextDecoration.lineThrough,
                                  decorationStyle: TextDecorationStyle.solid,
                                  decorationThickness: 1,
                                  color: cardUtils.card.isAlreadySelected
                                      ? AppColors.white
                                      : AppColors.primaryGreenColor,
                                ),
                              )
                            : RichTextModel(),
                      ],
                    ),
                    onDelOnTap != null
                        ? InkWell(
                            onTap: onDelOnTap,
                            child: Icon(
                              Icons.delete_forever_sharp,
                              color: AppColors.redLight,
                              size: AppDimens.dimen20,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                SizedBox(height: AppDimens.dimen2),
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget redemptionSummaryItem(
    PrimeCardModel card, {
    double opacity = 0.1,
    Color? borderColor,
    int count = 1,
    double radius = 10,
    EdgeInsetsGeometry? padding,
    bool showDiscount = false,
  }) {
    CardUtils cardUtils = CardUtils(card);
    return Container(
      decoration: UiApi.deco(
          borderRadius: radius,
          borderColor: borderColor ?? AppColors.line,
          opacity: opacity),
      margin: EdgeInsets.only(bottom: AppDimens.dimen2),
      padding: padding ??
          EdgeInsets.only(
            right: AppDimens.dimen8,
            //bottom: AppDimens.dimen3,
            left: AppDimens.dimen8,
          ),
      child: Row(
        children: [
          Container(
            child: UiApi.imageLoader(
              url: card.image,
              placeHolder: UiApi.assetImage(
                "assets/images/ic_rect.png",
                height: AppDimens.dimen40,
                width: AppDimens.dimen65,
              ),
              height: AppDimens.dimen40,
              width: AppDimens.dimen65,
              border: 2,
            ),
            decoration: UiApi.deco(opacity: 0.5, borderRadius: 2),
          ),
          SizedBox(width: AppDimens.dimen10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppDimens.dimen5),
                UiApi.richText(
                  maxLines: 1,
                  mod: [
                    RichTextModel(
                      text: cardUtils.getMerchantName(),
                      style: AppTextStyles.descStyleBold,
                    )
                  ],
                ),
                SizedBox(height: AppDimens.dimen3),
                UiApi.richText(
                  maxLines: 2,
                  mod: [
                    RichTextModel(
                      text: cardUtils.getCardTitle(),
                      style: AppTextStyles.subDescStyleLight,
                    )
                  ],
                ),
                SizedBox(height: AppDimens.dimen3),
                UiApi.richText(
                  maxLines: 1,
                  mod: [
                    RichTextModel(
                      text: "${cardUtils.getCurrency()} ",
                      style: AppTextStyles.smallerSubDescStyleRegular.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    RichTextModel(
                      text: cardUtils.getFormattedCardActualAmount(dec: 2),
                      style: AppTextStyles.descStyleRegular.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDimens.dimen2),
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget renderEFundCards(PrimeCardModel card) {
    return Container();
  }

  static Widget cardWidget(BaseObject object, BaseObject selectedObject,
      {Function(BaseObject)? onTap}) {
    CardUtils cardUtils = checkTypeOfObject(object);
    PrimeCardModel card = cardUtils.card;
    bool checked = selectedObject == object;

    return InkWell(
      onTap: () {
        if (onTap != null) onTap(object);
      },
      child: Container(
        decoration: UiApi.deco(borderRadius: 7),
        height: AppDimens.dimen95,
        margin: EdgeInsets.only(
          top: AppDimens.dimen5,
          left: AppDimens.dimen2,
          right: AppDimens.dimen2,
        ),
        padding: EdgeInsets.only(left: AppDimens.dimen5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: AppDimens.dimen80,
              child: UiApi.imageLoader(
                url: card.image,
                heroTag: cardUtils.getHeroTag(alias: card.image),
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppDimens.dimen3,
                  horizontal: AppDimens.dimen8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppDimens.dimen3),
                    UiApi.richText(maxLines: 1, mod: [
                      RichTextModel(
                        text: cardUtils.getMerchantName(),
                        style: AppTextStyles.subDescStyleBold,
                      ),
                    ]),
                    SizedBox(height: AppDimens.dimen3),

                    ///Amount and Balance on Card Details
                    UiApi.richText(maxLines: 1, mod: [
                      RichTextModel(
                          text: "Bal: ",
                          style: AppTextStyles.smallSubDescStyleLight),
                      RichTextModel(
                          text: cardUtils.getFormattedAccountBalance(dec: 2),
                          style: AppTextStyles.subDescStyleBold
                              .copyWith(color: AppColors.primaryGreenColor)),
                    ]),
                    SizedBox(height: AppDimens.dimen3),

                    ///Card Title details
                    UiApi.richText(
                      maxLines: 2,
                      mod: [
                        RichTextModel(
                          text: cardUtils.getCardTitle(
                              defVal: "No title available"),
                          style: AppTextStyles.smallSubDescStyleRegular,
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimens.dimen3),
                  ],
                ),
              ),
            ),

            ///Account date of purchased or created
            UiApi.checkBox(
              (val) {
                if (onTap != null) onTap(object);
              },
              checkValue: checked,
            ),
          ],
        ),
      ),
    );

    return cardAccountItem(
      cardUtils: cardUtils,
      // onTap: onTap,
      //heroTag: heroTag,
      // type: type,
      object: object,
    );
  }
}
