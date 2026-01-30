import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart'
    show CarouselSlider, CarouselOptions;
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart';
import 'package:primecustomer/controller/view/dashboard_controller.dart';
import 'package:primecustomer/data/enum/display_type.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/geo_location_api.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/advert_api.dart';
import 'package:primecustomer/res/ui_helpers/card_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/services/services_injector.dart';

import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/ui/dashboard/notification/notification_screen.dart';
import 'package:primecustomer/widgets/PosterCardsWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/view/home_controller.dart';
import '../../../../data/model/remote/category_model.dart';
import '../../../../res/app/app_colors.dart';
import '../../../../res/app/app_dimens.dart';
import '../../../../widgets/title_text_widget.dart';

class HomeScreen extends BaseScreenStandard {
  HomeController controller = Get.put(HomeController());

  HomeScreen() {
    controller.clear();
    controller.initAllRequest();
  }

  @override
  double appBarElevation() {
    return 0;
  }

  @override
  Color appBarBackgroundColor() {
    return AppColors.background;
  }

  @override
  Color backgroundColor() {
    return appBarBackgroundColor();
  }

  // @override
  // Widget appBarTitleWidget() {
  //   return Obx(
  //     () => UiApi.appBarLocationWidget(
  //       margin:
  //           EdgeInsets.only(left: AppDimens.dimen35, right: AppDimens.dimen25),
  //       text: GeoLocationApi.suggestion.value.address,
  //       onTap: () {
  //         ServiceInjectors().geolocationApi.goToNearByMerchants();
  //       },
  //     ),
  //   );
  // }

  @override
  Widget appBarTitleWidget() {
    return ContainerWidget(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.dimen10,
        vertical: AppDimens.dimen5,
      ),
      color: AppColors.white,
      margin: EdgeInsets.only(
        left: AppDimens.dimen45,
        right: AppDimens.dimen10,
      ),
      onTap: () => controller.cardController?.searchCard(mContext!),
      child: Row(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.search,
            color: AppColors.deactivatedText,
            size: AppDimens.dimen18,
          ),
          SizedBox(width: AppDimens.dimen10),
          Text(
            "Search for merchant or card...",
            style: AppTextStyles.smallSubDescStyleLight.copyWith(
              color: AppColors.deactivatedText,
            ),
          ),
          SizedBox(width: AppDimens.dimen5),
          AssetImageWidget(
            asset: "assets/images/ic_filter.svg",
            height: AppDimens.dimen14,
            width: AppDimens.dimen14,
            assetColor: AppColors.primaryGreenColor,
            onTap: () {
              controller.onFilterOnClick();
            },
          ),
        ],
      ),
    );
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  List<Widget> actions() {
    return [
      Obx(
        () => UiApi.circleEmpty(
          onTap: () {
            if (isGuestUser.value) {
              DashBoardController ctrl = DashBoardController();
              ctrl.confirmSignOut();
            } else {
              NavApi.fireTarget(NotificationScreen());
            }
          },
          padding: EdgeInsets.all(
            isGuestUser.value ? AppDimens.dimen6 : AppDimens.dimen2,
          ),
          margin: EdgeInsets.only(
            right: AppDimens.dimen10,
            top: AppDimens.dimen3,
            bottom: AppDimens.dimen3,
          ),
          child: isGuestUser.value
              ? UiApi.assetImage(
                  "assets/images/ic_logout.png",
                  height: AppDimens.dimen20,
                  width: AppDimens.dimen20,
                  assetColor: AppColors.redLight,
                )
              : UiApi.appBarNotification(notificationCounter),
        ),
      ),
    ];
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(
      list: listView(),
      padding: EdgeInsets.only(
        top: AppDimens.dimen20,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
    );
  }

  Widget _topHeaderWidget() {
    return Obx(
      () => controller.posterCardsList.isNotEmpty
          ? CarouselSlider.builder(
              itemCount: controller.posterCardsList.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return PosterCardsWidget(
                  poster: controller.posterCardsList[index],
                );
              },
              options: CarouselOptions(
                height: appDimen.screenHeight * 0.12,
                viewportFraction: 0.65,
                autoPlay: true,
                reverse: false,
                enableInfiniteScroll: false,
                initialPage: 0,
              ),
            )
          : ShimmerWidget.withList(length: 1),
    );
  }

  Widget _categoryWidget(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.dp(), vertical: 5.dp()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TitleTextWidget(
            title: 'Categories',
            onTap: () {
              controller.viewAllMenuCategories();
            },
          ),
          SizedBox(height: 5.dp()),
          FutureBuilder(
            future: controller.getMenuCategories(),
            builder:
                (
                  BuildContext context,
                  AsyncSnapshot<List<CategoryModel>> snapshot,
                ) {
                  return snapshot.hasData
                      ? SizedBox(
                          height: 105.dp(),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ...snapshot.data!.map(
                                (e) => Column(
                                  children: [
                                    ContainerWidget(
                                      onTap: () {
                                        controller.viewAllTypesOfCardOnClick(
                                          menu: e,
                                        );
                                      },
                                      color: colorScheme.tertiary,
                                      padding: EdgeInsets.all(10.dp()),
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 5.dp(),
                                      ),
                                      child: NetworkImageWidget(
                                        // asset: "assets/images/${e.url}",
                                        url: e.logo,
                                        height: 30.dp(),
                                        width: 30.dp(),
                                      ),
                                    ),
                                    SizedBox(height: 5.dp()),
                                    Center(
                                      child: SizedBox(
                                        width: 70.dp(),
                                        child: Text(
                                          e.name,
                                          textAlign: TextAlign.center,
                                          style: textTheme.labelMedium
                                              ?.copyWith(fontSize: 10.dp()),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : ShimmerWidget();
                },
          ),
        ],
      ),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> listViews = <Widget>[];

    listViews.add(UiApi.securityQuestionsWarning());

    listViews.add(SizedBox(height: AppDimens.dimen2));

    /// SearchBar and filter for the category
    // listViews.add(
    //   UiApi.homeSearchBar(
    //     hintText: "Search for merchant or card...",
    //     enabled: false,
    //     onTap: () {
    //       controller.cardController?.searchCard(mContext!);
    //     },
    //     onSearchChanged: (val) {
    //       controller.onSearchOnline(val);
    //     },
    //     onFilterClick: () {
    //       controller.onFilterOnClick();
    //     },
    //   ),
    // );

    // listViews.add(SizedBox(height: AppDimens.dimen20));

    //listViews.add(_topHeaderWidget());

    listViews.add(SizedBox(height: AppDimens.dimen20));

    // listViews.add(ContainerWidget(
    //   height: appDimen.screenHeight * 0.3,
    //   width: appDimen.screenWidth,
    //   borderColor: AppColors.white,
    //   color: AppColors.iconColor,
    // ));

    ///Menu Categories TitleView
    listViews.add(
      UiApi.titleView(
        title: "Categories",
        backgroundColor: AppColors.background,
        subTitle: UiApi.subTitleView(
          text: "View All",
          onSubTextOnClick: () {
            controller.viewAllMenuCategories();
          },
        ),
      ),
    );

    /// Add Menu categories like Wedding, Christmas etc
    listViews.add(
      UiApi.menuListWidget(
        menuList: controller.menuCatList,
        //shouldGrid: true,
        onMenuOnClick: (menu) {
          controller.viewAllTypesOfCardOnClick(menu: menu);
        },
      ),
    );

    //listViews.add(_categoryWidget(mContext!));

    listViews.add(SizedBox(height: AppDimens.dimen20));

    ///Filtering list
    listViews.add(
      Obx(
        () => controller.isFilteringCards.value
            ? UiApi.loader()
            : const SizedBox(),
      ),
    );

    listViews.add(
      CardApi.renderCard(
        list: controller.filteredCards,
        isDone: controller.isFilteringCards,
        cardType: DisplayType.GRID_VERTICAL,
        heroTag: "_all_filtered_cards",
        title: "Filtered Cards",
        subTitleWidget: const SizedBox(),
        showMerchantName: true,
        onTap: (card) {
          controller.cardController?.onCardSelected(
            card,
            "_all_filtered_cards",
          );
        },
        loaderLength: 5,
        loader: const SizedBox(),
        showSubText: true,
        //advertIndexes: [10, 45],
        advertList: controller.advertList,
      ),
    );

    ///---------------------------Featured Cards here -------------------------
    listViews.add(
      CardApi.renderCard(
        list: controller.featuredCardsList,
        isDone: controller.isDoneLoadingFeaturedCards,
        heroTag: "_featured",
        title: "Featured Cards",
        aspectRatio: 2.2,
        childAspectRatio: .75,
        onTap: (card) {
          controller.cardController?.onCardSelected(
            card,
            "_featured",
            filter: "is_featured",
          );
        },
        onSubTextOnClick: () {
          controller.viewAllTypesOfCardOnClick(filter: "is_featured");
        },
      ),
    );

    ///==============Advert ========

    listViews.add(AdvertApi.renderAdvert(list: controller.advertList));

    listViews.add(SizedBox(height: AppDimens.dimen20));

    ///---------------------------Trending Cards here -------------------------
    ///Trending TitleView
    listViews.add(
      CardApi.renderCard(
        list: controller.trendingCardsList,
        isDone: controller.isDoneLoadingTrendingCards,
        heroTag: "_trending",
        title: "Trending Cards",
        aspectRatio: 2.2,
        childAspectRatio: .75,
        onTap: (card) {
          controller.cardController?.onCardSelected(
            card,
            "_trending",
            filter: "is_trending",
          );
        },
        onSubTextOnClick: () {
          controller.viewAllTypesOfCardOnClick(filter: "is_trending");
        },
      ),
    );

    ///------------Newly Arrivals created cards or New Arrivals here------------------
    ///Newly Arrived Cards
    ///
    listViews.add(
      CardApi.renderCard(
        list: controller.newCardsList,
        isDone: controller.isDoneLoadingNewCards,
        aspectRatio: 2.2,
        childAspectRatio: .75,
        heroTag: "_new",
        title: "Newly Arrived Cards",
        onTap: (card) {
          controller.cardController?.onCardSelected(
            card,
            "_new",
            filter: "is_new",
          );
        },
        onSubTextOnClick: () {
          controller.viewAllTypesOfCardOnClick(filter: "is_new");
        },
      ),
    );

    ///------------Promotional Cards For only Guest Users only------------------
    ///Promotional Cards
    ///

    if (isGuestUser.value) {
      listViews.add(
        CardApi.renderCard(
          list: controller.promoCardsList,
          isDone: controller.isDoneLoadingPromoList,
          aspectRatio: 2.2,
          childAspectRatio: .75,
          showPromo: true,
          heroTag: "_promo",
          title: "Promotional Cards",
          onTap: (card) {
            controller.cardController?.onCardSelected(
              card,
              "promotions_only",
              filter: "promotions_only",
            );
          },
          onSubTextOnClick: () {
            controller.viewAllTypesOfCardOnClick(filter: "promotions_only");
          },
        ),
      );
    }

    ///------------More cards or New Arrivals here------------------
    ///More Cards
    ///
    listViews.add(
      CardApi.renderCard(
        list: controller.moreCardsList,
        isDone: controller.isDoneLoadingMoreCards,
        cardType: DisplayType.GRID_HORIZONTAL,
        aspectRatio: .82,
        childAspectRatio: .78,
        heroTag: "_more",
        title: "More Cards",
        onTap: (card) {
          controller.cardController?.onCardSelected(card, "_more");
        },
        onSubTextOnClick: () {
          controller.viewAllTypesOfCardOnClick(filter: "All_Cards");
        },
      ),
    );

    listViews.add(
      Obx(
        () =>
            controller.moreCardsList.isNotEmpty &&
                controller.isDoneLoadingMoreCards.value
            ? Padding(
                padding: EdgeInsets.only(
                  left: AppDimens.dimen40,
                  right: AppDimens.dimen40,
                ),
                child: UiApi.button(
                  text: "View All Cards",
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.kDarkColors,
                  opacity: .3,
                  textStyle: AppTextStyles.descStyleRegular.copyWith(
                    color: AppColors.primaryGreenColor,
                  ),
                  onPressed: () {
                    controller.viewAllTypesOfCardOnClick(filter: "All_Cards");
                  },
                ),
              )
            : const SizedBox(),
      ),
    );

    listViews.add(
      Obx(
        () =>
            controller.doneLoadingAllCards().value &&
                controller.allCardsEmpty().value
            ? Padding(
                padding: EdgeInsets.all(AppDimens.dimen24),
                child: UiApi.noDataWidget(
                  asset: "assets/images/ic_cards_group.png",
                  title: "Empty Cards",
                  message:
                      "There are no cards at the moment. Kindly at a later time.",
                ),
              )
            : const SizedBox(),
      ),
    );

    listViews.add(SizedBox(height: AppDimens.dimen50));

    return listViews;
  }
}
