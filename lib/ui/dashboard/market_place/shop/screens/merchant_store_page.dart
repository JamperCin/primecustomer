import 'package:primecustomer/controller/market/products_controller.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/product_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_sliver_standard.dart';
import 'package:primecustomer/ui/dashboard/market_place/shop/controllers/shop_details_controller.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';

import '../../../../../data/model/remote/shop_model.dart';

class MerchantStorePage extends BaseSliverStandard {
  final controller = Get.put(ShopDetailsController());

  MerchantStorePage() {
    controller.clearData();
    Utils.delayTimer(() => controller.initData(shop: getModel()));
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  bool decorateBody() {
    return true;
  }

  @override
  double expandedTitleScale() {
    return 1.0;
  }

  @override
  Widget? flexImageWidget() {
    return Obx(
      () => Stack(
        children: [
          UiApi.imageLoader(
            url: controller.selectedShop.value.logo,
            heroTag: "_accounts",
            setOverlay: true,
            border: 0,
          ),
          /*Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UiApi.richText(
                  maxLines: 2,
                  mod: [
                    RichTextModel(
                        text: controller.selectedShop.value.name
                            .capitalizeFirstLetters(),
                        style: AppTextStyles.h5StyleBold.copyWith(
                          color: AppColors.white,
                        ))
                  ],
                ),
                SizedBox(height: AppDimens.dimen10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.dimen5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if ((controller.selectedShop.value.location?.address ??
                              '')
                          .isNotEmpty)
                        Expanded(
                          child: Row(
                            children: [
                              UiApi.circleEmpty(
                                  colorOpacity: Colors.white.withOpacity(0.4),
                                  borderColor: Colors.white.withOpacity(0.4),
                                  child: Icon(
                                    Icons.location_pin,
                                    color: AppColors.white,
                                    size: AppDimens.dimen10,
                                  )),
                              Flexible(
                                child: UiApi.richText(mod: [
                                  RichTextModel(
                                    text: controller.selectedShop.value.location
                                            ?.address ??
                                        '',
                                    style: AppTextStyles.subDescRegular
                                        .copyWith(color: AppColors.white),
                                  )
                                ]),
                              )
                            ],
                          ),
                        ),
                      if ((controller.selectedShop.value.location?.address ??
                              '')
                          .isNotEmpty)
                        SizedBox(
                          width: AppDimens.dimen10,
                        ),
                      Container(
                        decoration: UiApi.deco(
                          color: AppColors.secondaryGreenColor,
                          borderColor: AppColors.secondaryGreenColor,
                          opacity: 0,
                          borderRadius: 20,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimens.dimen10,
                          vertical: AppDimens.dimen2,
                        ),
                        child: Text(
                          'Opened'.toUpperCase(),
                          style: AppTextStyles.descStyleBold
                              .copyWith(color: AppColors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }

  @override
  double expandedHeight() {
    return AppDimens.dimen150;
  }

  @override
  Widget? flexBarWidget() {
    return Obx(
      () => UiApi.richText(
        mod: [
          RichTextModel(
              text: Utils.capitalizeLetter(
                val: controller.selectedShop.value.name,
                capAllFirstLetters: true,
              ),
              style:
                  AppTextStyles.titleStyleBold.copyWith(color: AppColors.white))
        ],
      ),
    );
  }

  @override
  ShopModel getModel() {
    return baseObject as ShopModel;
  }

  @override
  Color backgroundColor() {
    return AppColors.white;
  }

  @override
  Color appBarBackgroundColor() {
    return AppColors.market3;
  }

  @override
  List<Widget> actions() {
    return [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.dimen20),
        child: InkWell(
          child: Icon(
            Icons.search,
            color: AppColors.white,
            size: AppDimens.dimen25,
          ),
          onTap: controller.onSearchProduct,
        ),
      ),
    ];
  }

  // @override
  // Widget? appBarTitleWidget() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(
  //       vertical: AppDimens.dimen5,
  //     ),
  //     child: Obx(
  //       () => Row(
  //         children: [
  //           UiApi.circleImageView(
  //             url: controller.selectedShop.value.logo,
  //             radius: AppDimens.dimen20,
  //             setOverlay: true,
  //           ),
  //           SizedBox(width: AppDimens.dimen10),
  //           Expanded(
  //             child: UiApi.richText(
  //               maxLines: 2,
  //               mod: [
  //                 RichTextModel(
  //                     text: controller.selectedShop.value.name
  //                         .capitalizeFirstLetters(),
  //                     style: AppTextStyles.descStyleBold)
  //               ],
  //             ),
  //           ),
  //           SizedBox(width: AppDimens.dimen10),
  //           UiApi.button(
  //             width: AppDimens.dimen90,
  //             text: 'View',
  //             backgroundColor: AppColors.white,
  //             borderColor: AppColors.primaryGreenColor,
  //             textStyle: AppTextStyles.subDescRegular.copyWith(
  //               color: AppColors.primaryGreenColor,
  //             ),
  //             height: AppDimens.dimen30,
  //             onPressed: controller.onViewShopMoreInfo,
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(
      list: listView(),
      isLoadingMore: controller.isLoadingMore,
      scrollController: controller.scrollController,
      padding: EdgeInsets.only(
        top: AppDimens.dimen10,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(UiApi.titleView(
      title: "Working Days",
      backgroundColor: AppColors.white,
    ));

    list.add(SizedBox(height: AppDimens.dimen5));

    list.add(Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.dimen16),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: AppDimens.dimen15, maxHeight: AppDimens.dimen20),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...controller.workingDays.map(
              (element) => UiApi.workingDayItem(element),
            )
          ],
        ),
      ),
    ));

    list.add(SizedBox(height: AppDimens.dimen30));

    list.add(UiApi.titleView(
      title: "Products Categories",
      backgroundColor: AppColors.white,
      // subTitle: UiApi.subTitleView(
      //   text: "View All",
      //   style: AppTextStyles.subDescStyleMedium
      //       .copyWith(color: AppColors.dimWhiteExt),
      //   // onSubTextOnClick: () {
      //   //   // controller.viewAllMenuCategories();
      //   // },
      // ),
    ));

    list.add(UiApi.menuListWidget(
        menuList: controller.menuCatList,
        rectangularShape: true,
        onMenuOnClick: controller.onMenuOnClick,
        padding: EdgeInsets.only(left: AppDimens.dimen16)));

    list.add(SizedBox(height: AppDimens.dimen40));

    list.add(Obx(
      () => controller.discountedProducts.isNotEmpty
          ? Column(
              children: [
                UiApi.titleView(
                  title: "Discount Offers",
                  backgroundColor: AppColors.white,
                ),
                SizedBox(height: AppDimens.dimen10),
                ProductApi.discountedProductWidget(
                  onTap: controller.onProductOnTap,
                  products: controller.discountedProducts,
                  isDoneLoading: controller.isDoneLoadingDiscountedProducts,
                ),
                SizedBox(height: AppDimens.dimen40)
              ],
            )
          : const SizedBox.shrink(),
    ));

    ///Best Selling Products on the platform
    list.add(ProductApi.productHorizontal(
      list: controller.productsList,
      isDone: controller.isDoneLoading,
      padding: EdgeInsets.symmetric(horizontal: AppDimens.dimen10),
      onAddRemove: controller.onAddRemoveCart,
      title: "New Products Available", titleViewBgColor: AppColors.white,
      subTitleWidget: const SizedBox.shrink(),
      onProductOnTap: controller.onProductOnTap,
      // onBasketOnTap: controller.onAddToBasket,
    ));

    list.add(ProductApi.linearHorizontal(
      list: controller.productsList,
      isDone: controller.isDoneLoading,
      padding: EdgeInsets.symmetric(horizontal: AppDimens.dimen10),
      title: "Most Purchased Products", titleViewBgColor: AppColors.white,
      subTitleWidget: const SizedBox.shrink(),
      onProductOnTap: controller.onProductOnTap,
      // onBasketOnTap: controller.onAddToBasket,
    ));

    list.add(ProductApi.gridHorizontal(
      list: controller.productsList,
      isDone: controller.isDoneLoading,
      padding: EdgeInsets.symmetric(horizontal: AppDimens.dimen10),
      title: "More Products", titleViewBgColor: AppColors.white,
      subTitleWidget: const SizedBox.shrink(),
      onProductOnTap: controller.onProductOnTap,
      // onBasketOnTap: controller.onAddToBasket,
    ));

    list.add(SizedBox(height: AppDimens.dimen20));

    return list;
  }

  @override
  Widget bottomNavigationBar({BuildContext? context}) {
    return Obx(
      () => ProductsController.cartList.isNotEmpty
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: UiApi.deco(),
                  width: SizeConfig.screenWidth,
                  padding: EdgeInsets.only(
                    left: AppDimens.dimen10,
                    top: AppDimens.dimen10,
                    right: AppDimens.dimen10,
                    bottom: AppDimens.dimen10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Bounce(
                            child: UiApi.richText(mod: [
                              RichTextModel(
                                text: "Total: ",
                                style: AppTextStyles.titleStyleBold,
                              ),
                              RichTextModel(
                                text: "¢",
                                style: AppTextStyles.descStyleRegular
                                    .copyWith(color: AppColors.redLight),
                              ),
                              RichTextModel(
                                text: ProductsController.totalCartAmount.value,
                                style: AppTextStyles.h4StyleBold
                                    .copyWith(color: AppColors.redLight),
                              ),
                            ]),
                          ),
                          Text(
                            "Excluding Delivery fee",
                            style: AppTextStyles.subDescStyleLight
                                .copyWith(color: AppColors.deactivatedText),
                          )
                        ],
                      ),
                      UiApi.decoratedButton(
                        width: SizeConfig.screenWidth * 0.4,
                        text: "Proceed",
                        style: AppTextStyles.subDescStyleBold
                            .copyWith(color: AppColors.white),
                        icon: const SizedBox.shrink(),
                        padding: EdgeInsets.only(right: AppDimens.dimen5),
                        backgroundColor: AppColors.market3,
                        onTap: () {
                          controller.onGoToCheckOut();
                        },
                      )
                    ],
                  ),
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
