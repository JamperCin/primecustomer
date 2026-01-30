import 'package:primecustomer/data/enum/display_type.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:primecustomer/data/model/remote/product_summary.dart';
import 'package:primecustomer/data/model/remote/shop_model.dart';
import 'package:primecustomer/extensions/color_extension.dart';
import 'package:primecustomer/extensions/product_extension.dart';
import 'package:primecustomer/extensions/string_extension.dart';
import 'package:primecustomer/res/config/assets_config.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in_up.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../data/model/local/base_object.dart';
import '../../data/model/remote/advert_image_model.dart';
import '../../utils/number_utils.dart';
import '../app/app_colors.dart';
import '../app/app_dimens.dart';
import '../app/app_text_styles.dart';
import 'advert_api.dart';

class ProductApi extends StatelessWidget {
  final RxList<BaseObject> list;
  final DisplayType displayType;
  final double? aspectRatio;
  final double? childAspectRatio;
  final int crossAxisCount;
  final List<int> advertIndexes;
  final RxList<AdvertImageModel>? advertList;
  final Function(BaseObject)? onProductOnTap;
  final Function(BaseObject)? onViewProductDetails;
  final Function(BaseObject)? onBasketOnTap;
  final Function(BaseObject)? onAddToBasketOnTap;
  final Function(BaseObject)? onFavoriteOnTap;
  final EdgeInsetsGeometry? padding;
  RxBool? isDone;
  final Widget? titleWidget;
  final String? title;
  final String? subTitle;
  final String? heroTag;
  final Color? titleViewBgColor;
  final Widget? loader;
  final Widget? subTitleWidget;
  final Function? onSubTextOnClick;
  final int loaderLength;
  bool showHorizontalProduct;
  final Function(BaseObject, int count)? onAddRemove;
  final Function(BaseObject)? onDeleteItem;

  ///Constructor
  ProductApi.linearHorizontal({
    Key? key,
    required this.list,
    this.advertIndexes = const <int>[],
    this.advertList,
    this.onProductOnTap,
    this.onBasketOnTap,
    this.onDeleteItem,
    this.padding,
    this.isDone,
    this.showHorizontalProduct = false,
    this.titleWidget,
    this.title,
    this.subTitle,
    this.titleViewBgColor,
    this.loader,
    this.subTitleWidget,
    this.onFavoriteOnTap,
    this.onSubTextOnClick,
  })  : childAspectRatio = 1.4,
        crossAxisCount = 1,
        aspectRatio = 1.35,
        loaderLength = 1,
        heroTag = "_linear_hor",
        displayType = DisplayType.LINEAR_HORIZONTAL,
        onAddRemove = null,
        onAddToBasketOnTap = null,
        onViewProductDetails = null,
        super(key: key);

  ///Constructor
  ProductApi.recommended({
    Key? key,
    required this.list,
    this.advertIndexes = const <int>[],
    this.onProductOnTap,
    this.padding,
    this.isDone,
    this.titleWidget,
    this.title,
    this.subTitle,
    this.titleViewBgColor,
    this.loader,
    this.subTitleWidget,
  })  : childAspectRatio = 1,
        crossAxisCount = 1,
        aspectRatio = 1.18,
        loaderLength = 1,
        heroTag = "_recommended_hor",
        displayType = DisplayType.RECOMMENDED,
        onAddRemove = null,
        advertList = null,
        onAddToBasketOnTap = null,
        onDeleteItem = null,
        onFavoriteOnTap = null,
        onBasketOnTap = null,
        onSubTextOnClick = null,
        showHorizontalProduct = false,
        onViewProductDetails = null,
        super(key: key);

  ProductApi.gridHorizontal({
    Key? key,
    required this.list,
    this.advertIndexes = const <int>[],
    this.loaderLength = 3,
    this.crossAxisCount = 2,
    this.advertList,
    this.onProductOnTap,
    this.onBasketOnTap,
    this.padding,
    this.isDone,
    this.titleWidget,
    this.showHorizontalProduct = false,
    this.title,
    this.subTitle,
    this.titleViewBgColor,
    this.loader,
    this.subTitleWidget,
    this.onFavoriteOnTap,
    this.onSubTextOnClick,
    this.onAddToBasketOnTap,
  })  : displayType = DisplayType.GRID_HORIZONTAL,
        heroTag = "_grid_hor_$crossAxisCount",
        childAspectRatio = crossAxisCount == 2
            ? 1.4
            : crossAxisCount == 3
                ? 1.4
                : 1.3,
        aspectRatio = crossAxisCount == 2
            ? 0.7
            : crossAxisCount == 3
                ? 0.47
                : 0.37,
        onAddRemove = null,
        onDeleteItem = null,
        onViewProductDetails = null,
        super(key: key);

  ProductApi.gridVertical({
    Key? key,
    required this.list,
    this.advertIndexes = const <int>[],
    this.loaderLength = 3,
    this.advertList,
    this.onProductOnTap,
    this.onBasketOnTap,
    this.padding,
    this.isDone,
    this.titleWidget,
    this.title,
    this.subTitle,
    this.showHorizontalProduct = false,
    this.titleViewBgColor,
    this.loader,
    this.onAddToBasketOnTap,
    this.subTitleWidget,
    this.onFavoriteOnTap,
    this.onSubTextOnClick,
  })  : displayType = DisplayType.GRID_VERTICAL,
        childAspectRatio = 0,
        aspectRatio = 0,
        crossAxisCount = 0,
        onAddRemove = null,
        onDeleteItem = null,
        onViewProductDetails = null,
        heroTag = "grid_vertical",
        super(key: key);

  ProductApi.productHorizontal({
    Key? key,
    required this.list,
    this.advertIndexes = const <int>[],
    this.loaderLength = 3,
    this.advertList,
    this.onProductOnTap,
    this.onBasketOnTap,
    this.padding,
    this.isDone,
    this.titleWidget,
    this.title,
    this.subTitle,
    this.onAddRemove,
    this.onViewProductDetails,
    this.onDeleteItem,
    this.showHorizontalProduct = false,
    this.titleViewBgColor,
    this.loader,
    this.subTitleWidget,
    this.onFavoriteOnTap,
    this.onSubTextOnClick,
    this.aspectRatio = 2.5,
  })  : displayType = DisplayType.LINEAR_PRODUCTS,
        childAspectRatio = 0,
        crossAxisCount = 0,
        onAddToBasketOnTap = null,
        heroTag = "grid_vertical",
        super(key: key);

  ///Main Entry to render Gift cards
  ///Render Card
  @override
  Widget build(BuildContext context) {
    isDone = isDone ?? false.obs;
    return Obx(
      () => (list.isNotEmpty
          ? Column(
              children: [
                titleWidget ??
                    (title != null
                        ? UiApi.titleView(
                            title: title ?? "",
                            backgroundColor:
                                titleViewBgColor ?? AppColors.background,
                            subTitle: subTitleWidget ??
                                UiApi.subTitleView(
                                  text: subTitle ?? "View All",
                                  onSubTextOnClick: onSubTextOnClick,
                                ),
                          )
                        : const SizedBox.shrink()),
                SizedBox(height: AppDimens.dimen1),
                _checkDisplayType(),
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
  Widget _checkDisplayType() {
    switch (displayType) {
      case DisplayType.GRID_HORIZONTAL:
        return _gridHorizontalWidget();

      case DisplayType.LINEAR_HORIZONTAL:
        return _gridHorizontalWidget();

      case DisplayType.LINEAR_VERTICAL:
        return _gridVerticalWidget();

      case DisplayType.GRID_VERTICAL:
        return _gridVerticalWidget();

      case DisplayType.LINEAR_PRODUCTS:
        return _horizontalProductWithWishWidget();
      case DisplayType.RECOMMENDED:
        return _gridRecommendedWidget();
    }
  }

  ///GRID HORIZONTAL display of products
  Widget _gridRecommendedWidget() {
    return UiApi.horizontalListView(
      aspectRatio: aspectRatio ?? 1.18,
      padding: padding,
      list: [
        ...list.map(
          (e) => searchedProductItemWidget(
            e as ProductModel,
            onTap: onProductOnTap,
            width: SizeConfig.screenWidth * 0.9,
          ),
        )
      ],
    );
  }

  ///GRID HORIZONTAL display of products
  Widget _gridHorizontalWidget() {
    return AspectRatio(
      aspectRatio: SizeConfig.getAspectRatio(v: aspectRatio ?? .68),
      child: Padding(
          padding:
              EdgeInsets.only(left: AppDimens.dimen3, right: AppDimens.dimen3),
          child: GridView(
            padding: EdgeInsets.all(AppDimens.dimen10),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: List<Widget>.generate((list.length), (int index) {
              Object object = list[index];

              ShopModel shopModel =
                  object is ShopModel ? object : const ShopModel();
              ProductModel prod = object is ShopModel
                  ? (object.latestProducts.first)
                  : object is ProductModel
                      ? object
                      : const ProductModel();
              if (object is ShopModel) {
                prod = prod.copyWith(
                  shopName: shopModel.name,
                  shopCode: shopModel.code,
                  shopId: shopModel.id,
                );
              }

              return _productItemWidget(prod);
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: AppDimens.subDesc,
              crossAxisSpacing: AppDimens.subDesc,
              childAspectRatio: childAspectRatio ?? 1.35,
            ),
          )),
    );
  }

  ///GRID VERTICAL display of products
  Widget _gridVerticalWidget() {
    List<Widget> row = [];
    List<Widget> column = [];

    int i = -1;
    int tempIndex = -1;
    int rowLength = 2;

    for (Object c in list) {
      if (c is ShopModel && c.latestProducts.isNotEmpty) {
        i++;

        ProductModel prod = c.latestProducts.first;
        prod = prod.copyWith(shopName: c.name, shopCode: c.code, shopId: c.id);

        ///Add the Product widget to the row
        row.add(_productWidget(prod));

        if (i == tempIndex + rowLength) {
          column.add(Row(
            children: row,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ));
          tempIndex = i;
          row = [];
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

      if (c is ProductModel) {
        i++;

        ///Add the Product widget to the row
        row.add(_productWidget(c));

        if (i == tempIndex + rowLength) {
          column.add(Row(
            children: row,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ));
          tempIndex = i;
          row = [];
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

      ///Insert Adverts in between the list
      if (advertList != null && advertIndexes.contains(i)) {
        column.add(SizedBox(height: AppDimens.dimen20));
        column.add(AdvertApi.renderAdvert(
          list: advertList!,
          color: AppColors.white,
        ));
        column.add(SizedBox(height: AppDimens.dimen20));
      }
    }

    return Padding(
      padding: EdgeInsets.only(left: AppDimens.dimen5, right: AppDimens.dimen5),
      child: Column(children: column),
    );
  }

  Widget _horizontalProductWidget() {
    return Container(
      padding: padding,
      child: Column(
        children: [
          ...list.map(
              (element) => productItemWidgetHorizontal(element as ProductModel))
        ],
      ),
    );
  }

  Widget _horizontalProductWithWishWidget() {
    return UiApi.horizontalListView(
      aspectRatio: aspectRatio ?? 2.6,
      list: [
        ...list.map(
          (element) => element is ProductModel
              ? _wishProductItemWidget(element)
              : _wishProductSummaryItemWidget(element as ProductSummary),
        )
      ],
    );
  }

  Widget _productWidget(ProductModel product) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: padding ??
            EdgeInsets.only(
              bottom: AppDimens.dimen10,
              left: AppDimens.dimen3,
              right: AppDimens.dimen3,
            ),
        child: _productItemWidget(product),
      ),
    );
  }

  Widget _productItemWidget(ProductModel prod) {
    String url = (prod.images).first;
    prod = prod.copyWith(heroTag: const Uuid().v4(), displayedImage: url);

    return FadeInUp(
      child: InkWell(
        onTap: () {
          if (onProductOnTap != null) {
            onProductOnTap!(prod);
          }
        },
        child: Container(
          decoration: UiApi.deco(
            opacity: 0.0,
            borderColor: AppColors.backgroundExt,
            borderWidth: 1,
          ),
          height: SizeConfig.screenWidth * 0.65,
          width: SizeConfig.screenWidth * 0.5,
          padding: EdgeInsets.all(AppDimens.dimen5),
          margin: EdgeInsets.only(top: AppDimens.dimen5),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Flexible(
                      child: UiApi.imageLoader(
                        height: AppDimens.dimen110,
                        width: SizeConfig.screenWidth,
                        border: 5,
                        url: url,
                        fit: BoxFit.cover,
                        heroTag: prod.heroTag,
                        placeHolder: UiApi.assetImage(
                          "assets/images/ic_rect.png",
                          height: AppDimens.dimen110,
                          width: SizeConfig.screenWidth,
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimens.dimen8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: UiApi.richText(maxLines: 2, mod: [
                        RichTextModel(
                          text: prod.name,
                          style:
                              AppTextStyles.smallSubDescStyleSemiBold.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(height: AppDimens.dimen3),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: UiApi.richText(maxLines: 3, mod: [
                        RichTextModel(
                          text: prod.description,
                          style: AppTextStyles.smallSubDescStyleLight.copyWith(
                            color: AppColors.black,
                          ),
                        )
                      ]),
                    ),
                    SizedBox(height: AppDimens.dimen5),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UiApi.richText(mod: [
                    RichTextModel(
                      text: '${prod.currency} ',
                      style: AppTextStyles.smallerSubDescStyleSemiBold.copyWith(
                        color: AppColors.market3,
                      ),
                    ),
                    RichTextModel(
                      text: NumberUtils.moneyFormatDouble(prod.price,
                          decPlace: 2),
                      style: AppTextStyles.h5StyleBold.copyWith(
                        color: AppColors.market3,
                      ),
                    )
                  ]),
                  Flexible(
                    child: SizedBox(
                      height: AppDimens.dimen30,
                      child: onFavoriteOnTap != null
                          ? _onFavoriteOnTapWidget(prod)
                          : onBasketOnTap != null
                              ? _onBasketOnTapWidget(prod)
                              : onAddToBasketOnTap != null
                                  ? _onAddToBasketOnTapWidget(prod)
                                  : null,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _onFavoriteOnTapWidget(ProductModel prod) {
    return FloatingActionButton(
      heroTag: '${prod.name}_${prod.code}',
      onPressed: () {
        if (onFavoriteOnTap != null) {
          onFavoriteOnTap!(prod);
        }
      },
      mini: true,
      backgroundColor: AppColors.market3,
      child: Icon(
        prod.isFavorite ? Icons.favorite : Icons.favorite_border,
        color: AppColors.white,
        size: AppDimens.dimen20,
      ),
    );
  }

  Widget _onBasketOnTapWidget(ProductModel prod) {
    return FloatingActionButton(
      heroTag: '${prod.name}_${prod.code}',
      onPressed: () {
        if (onBasketOnTap != null) {
          onBasketOnTap!(prod);
        }
      },
      mini: true,
      backgroundColor: prod.count > 0 ? AppColors.dirtyRed : AppColors.market3,
      child: prod.count > 0
          ? Icon(
              Icons.remove,
              size: AppDimens.dimen25,
              color: AppColors.white,
            )
          : UiApi.assetImage(
              AssetsConfig.basket,
              height: AppDimens.dimen18,
              width: AppDimens.dimen18,
            ),
    );
  }

  Widget _onAddToBasketOnTapWidget(ProductModel prod) {
    return FloatingActionButton(
      heroTag: '${prod.name}_${prod.code}',
      onPressed: () {
        if (onAddToBasketOnTap != null) {
          onAddToBasketOnTap!(prod);
        }
      },
      mini: true,
      backgroundColor:
          prod.count > 0 ? AppColors.dirtyRed : AppColors.backgroundExt,
      child: Icon(
        prod.count > 0 ? Icons.remove : Icons.add,
        size: AppDimens.dimen20,
        color: AppColors.market3,
      ),
    );
  }

  Widget productItemWidgetHorizontal(ProductModel prod) {
    RxInt count = prod.count.obs;
    return Container(
      margin: EdgeInsets.only(bottom: AppDimens.dimen2),
      padding: EdgeInsets.all(AppDimens.dimen5),
      child: InkWell(
        onTap: () {
          if (onProductOnTap != null) {
            onProductOnTap!(prod);
          }
        },
        child: Row(
          children: [
            Expanded(
              flex: 0,
              child: UiApi.imageLoader(
                url: prod.shuffleImage,
                border: 5,
                width: AppDimens.dimen60,
                height: AppDimens.dimen60,
                placeHolder: UiApi.assetImage(
                  "assets/images/ic_rect.png",
                  width: AppDimens.dimen50,
                  height: AppDimens.dimen50,
                ),
              ),
            ),
            SizedBox(width: AppDimens.dimen10),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UiApi.richText(
                              maxLines: 1,
                              mod: [
                                RichTextModel(
                                  text: prod.name,
                                  style: AppTextStyles.descStyleRegular,
                                )
                              ],
                            ),
                            SizedBox(height: AppDimens.dimen3),
                            UiApi.richText(
                              maxLines: 2,
                              mod: [
                                RichTextModel(
                                  text: prod.description,
                                  style: AppTextStyles.subDescStyleLight,
                                )
                              ],
                            ),
                            SizedBox(height: AppDimens.dimen3),
                            Row(
                              children: [
                                Text(
                                  "GHS ",
                                  style: AppTextStyles.h5StyleSemiBold.copyWith(
                                    color: AppColors.redLight,
                                  ),
                                ),
                                Text(
                                  NumberUtils.moneyFormatDouble(prod.price,
                                      decPlace: 2),
                                  style: AppTextStyles.descStyleBold.copyWith(
                                    color: AppColors.redLight,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          if (count.value > 0)
                            UiApi.buttonIcon(
                              isRounded: true,
                              roundContainerColour: AppColors.redLight,
                              child: Icon(
                                Icons.remove,
                                size: AppDimens.dimen14,
                                color: AppColors.white,
                              ),
                              onTap: () {
                                count.value--;
                                if (onAddRemove != null) {
                                  onAddRemove!(prod, count.value);
                                }
                              },
                            ),

                          // if (count.value > 0)
                          //   UiApi.buttonIcon(
                          //     child: Obx(
                          //       () => Text(
                          //         "${count.value}",
                          //         style: AppTextStyles.subDescRegular,
                          //       ),
                          //     ),
                          //   ),
                          if (count.value == 0)
                            UiApi.buttonIcon(
                              isRounded: true,
                              roundContainerColour: AppColors.primaryGreenColor,
                              child: Icon(
                                Icons.add,
                                size: AppDimens.dimen14,
                                color: AppColors.white,
                              ),
                              onTap: () {
                                count.value++;
                                if (onAddRemove != null) {
                                  onAddRemove!(prod, count.value);
                                }
                              },
                            ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimens.dimen2),
                  const Divider(thickness: 1, color: AppColors.backgroundExt),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget discountedProductWidget({
    required RxList<ProductModel> products,
    Function(ProductModel)? onTap,
    required RxBool isDoneLoading,
    bool displayList = true,
  }) {
    ProductModel prod =
        products.isNotEmpty ? products.first : const ProductModel();

    return Obx(
      () => isDoneLoading.value && products.isNotEmpty
          ? (displayList
              ? UiApi.horizontalListView(
                  list: [
                    ...products.map((element) => _discountProductItemWidget(
                          element,
                          onTap: onTap,
                          imageHeight: double.infinity,
                          margin: EdgeInsets.symmetric(
                              horizontal: AppDimens.dimen5),
                          width: SizeConfig.screenWidth * .9,
                        ))
                  ],
                  aspectRatio: 2.42,
                )
              : _discountProductItemWidget(prod, onTap: onTap))
          : UiApi.loader(size: 1),
    );
  }

  static Widget _discountProductItemWidget(
    ProductModel prod, {
    Function(ProductModel)? onTap,
    double? width,
    double? imageHeight,
    EdgeInsetsGeometry? margin,
  }) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(prod);
        }
      },
      child: Container(
        margin: margin ?? EdgeInsets.symmetric(horizontal: AppDimens.dimen10),
        decoration: UiApi.deco(
          opacity: 0.3,
          color: AppColors.white,
          borderColor: AppColors.backgroundExt,
        ),
        width: width,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(AppDimens.dimen8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiApi.richText(
                      maxLines: 3,
                      mod: [
                        RichTextModel(
                          text:
                              '${NumberUtils.calcDiscountPercent(prod.price, prod.discount)}% discount \noff our ${prod.name}',
                          style: AppTextStyles.descStyleBold,
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimens.dimen3),
                    amountModuleWidget(prod),
                    SizedBox(height: AppDimens.dimen3),
                    Flexible(
                      child: Text(
                        'Valid Until 28/04/2027',
                        style: AppTextStyles.smallSubDescStyleRegular.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimens.dimen3),
                    Row(
                      children: [
                        Expanded(
                          child: UiApi.richText(
                            maxLines: 1,
                            mod: [
                              RichTextModel(
                                text: prod.shop.name.capitalizeFirstLetters(),
                                style: AppTextStyles.smallSubDescStyleBold
                                    .copyWith(
                                  color: AppColors.market3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        UiApi.assetImage(
                          AssetsConfig.discount,
                          height: AppDimens.dimen20,
                          width: AppDimens.dimen20,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 0,
              child: UiApi.imageLoader(
                height: imageHeight ?? AppDimens.dimen120,
                width: AppDimens.dimen120,
                url: prod.images.first,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _wishProductItemWidget(ProductModel prod) {
    RxInt count = prod.count.obs;
    return InkWell(
      onTap: () {
        if (onProductOnTap != null) {
          onProductOnTap!(prod);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppDimens.dimen10),
        decoration: UiApi.deco(
          opacity: 0.3,
          color: AppColors.white,
          borderColor: AppColors.white,
        ),
        // height: AppDimens.dimen200,
        width: SizeConfig.screenWidth * 0.85,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(AppDimens.dimen5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiApi.richText(
                      maxLines: 1,
                      mod: [
                        RichTextModel(
                          text: prod.name,
                          style: AppTextStyles.descStyleBold,
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimens.dimen3),
                    UiApi.richText(
                      maxLines: 2,
                      mod: [
                        RichTextModel(
                          text: prod.description,
                          style: AppTextStyles.smallSubDescStyleRegular,
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimens.dimen3),
                    Row(
                      children: [
                        Text(
                          "GHS ",
                          style: AppTextStyles.h5StyleSemiBold.copyWith(
                            color: AppColors.redLight,
                          ),
                        ),
                        Text(
                          NumberUtils.moneyFormatDouble(prod.price,
                              decPlace: 2),
                          style: AppTextStyles.descStyleBold.copyWith(
                            color: AppColors.redLight,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        if (count.value > 0)
                          UiApi.buttonIcon(
                            isRounded: true,
                            roundContainerColour: AppColors.redLight,
                            child: Icon(
                              Icons.remove,
                              size: AppDimens.dimen14,
                              color: AppColors.white,
                            ),
                            onTap: () {
                              count.value--;
                              if (onAddRemove != null) {
                                onAddRemove!(prod, count.value);
                              }
                            },
                          ),

                        // if (count.value > 0)
                        // UiApi.buttonIcon(
                        //   isRounded: true,
                        //   roundContainerBorderColour: AppColors.white,
                        //   roundContainerColour: AppColors.white,
                        //   child: Obx(
                        //     () => Text(
                        //       "${count.value}",
                        //       style: AppTextStyles.titleStyleBold,
                        //     ),
                        //   ),
                        // ),
                        if (count.value == 0)
                          UiApi.buttonIcon(
                            isRounded: true,
                            roundContainerColour: AppColors.primaryGreenColor,
                            child: Icon(
                              Icons.add,
                              size: AppDimens.dimen14,
                              color: AppColors.white,
                            ),
                            onTap: () {
                              count.value++;
                              if (onAddRemove != null) {
                                onAddRemove!(prod, count.value);
                              }
                            },
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 0,
              child: UiApi.imageLoader(
                height: AppDimens.dimen100,
                width: AppDimens.dimen100,
                url: prod.images.first,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _wishProductSummaryItemWidget(ProductSummary productSummary) {
    ProductModel prod = productSummary.product;
    RxInt count = productSummary.quantity.obs;
    return InkWell(
      onTap: () {
        if (onProductOnTap != null) {
          onProductOnTap!(prod);
        }
      },
      child: Container(
        width: SizeConfig.screenWidth * .52,
        margin: EdgeInsets.all(AppDimens.dimen2),
        padding: EdgeInsets.symmetric(
            horizontal: AppDimens.dimen10, vertical: AppDimens.dimen5),
        decoration: UiApi.deco(
          borderColor: AppColors.backgroundExt,
          opacity: 0.2,
          borderWidth: 2,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: UiApi.richText(
                textAlign: TextAlign.left,
                maxLines: 1,
                mod: [
                  RichTextModel(
                    text: prod.name,
                    style: AppTextStyles.descStyleBold,
                  )
                ],
              ),
            ),
            SizedBox(height: AppDimens.dimen5),
            Align(
              alignment: Alignment.topLeft,
              child: UiApi.richText(
                textAlign: TextAlign.left,
                maxLines: 2,
                mod: [
                  RichTextModel(
                    text: prod.description,
                    style: AppTextStyles.smallSubDescStyleLight,
                  )
                ],
              ),
            ),
            SizedBox(height: AppDimens.dimen10),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Unit Price',
                          style: AppTextStyles.smallSubDescStyleBold,
                        ),
                        SizedBox(height: AppDimens.dimen2),
                        UiApi.richText(mod: [
                          RichTextModel(
                            text: 'GHS ',
                            style: AppTextStyles.smallSubDescStyleRegular
                                .copyWith(color: AppColors.black),
                          ),
                          RichTextModel(
                            text: NumberUtils.moneyFormatDouble(
                                productSummary.unitAmount,
                                decPlace: 2),
                            style: AppTextStyles.descStyleBold
                                .copyWith(color: AppColors.black),
                          )
                        ])
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Qty',
                          style: AppTextStyles.smallSubDescStyleBold
                              .copyWith(color: AppColors.black),
                        ),
                        SizedBox(height: AppDimens.dimen2),
                        Text(
                          '${count.value}',
                          style: AppTextStyles.descStyleBold
                              .copyWith(color: AppColors.orange),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimens.dimen8),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Price:',
                    style: AppTextStyles.smallSubDescStyleBold
                        .copyWith(color: AppColors.black),
                  ),
                  SizedBox(height: AppDimens.dimen2),
                  Text(
                    NumberUtils.moneyCurrencyFormat(
                        productSummary.payableAmount,
                        dec: 2),
                    style: AppTextStyles.descStyleBold
                        .copyWith(color: AppColors.orange),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimens.dimen5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    UiApi.buttonIcon(
                      child: Icon(Icons.remove, size: AppDimens.dimen14),
                      onTap: () {
                        if (count.value > 1) {
                          count.value--;
                          if (onAddRemove != null) {
                            onAddRemove!(productSummary, count.value);
                          }
                        }
                      },
                    ),
                    UiApi.buttonIcon(
                      child: Obx(
                        () => Text(
                          "${count.value}",
                          style: AppTextStyles.subDescRegular,
                        ),
                      ),
                    ),
                    UiApi.buttonIcon(
                      child: Icon(Icons.add, size: AppDimens.dimen14),
                      onTap: () {
                        count.value++;
                        if (onAddRemove != null) {
                          onAddRemove!(productSummary, count.value);
                        }
                      },
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    if (onDeleteItem != null) {
                      onDeleteItem!(productSummary);
                    }
                  },
                  icon: Icon(Icons.delete,
                      size: AppDimens.dimen20, color: AppColors.redLight),
                ),
              ],
            ),
            SizedBox(height: AppDimens.dimen5),
            UiApi.button(
              height: AppDimens.dimen26,
              width: AppDimens.dimen100,
              onPressed: () {
                if (onViewProductDetails != null) {
                  onViewProductDetails!(productSummary);
                }
              },
              backgroundColor: AppColors.white,
              borderColor: AppColors.introColor1,
              text: 'View More',
              textStyle: AppTextStyles.smallSubDescStyleBold.copyWith(
                color: AppColors.introColor1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget searchedProductItemWidget(
    ProductModel prod, {
    Function(ProductModel)? onTap,
    double? width,
  }) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(prod);
        }
      },
      child: Container(
        width: width,
        decoration: UiApi.deco(
          opacity: 0,
          borderRadius: 10,
          borderWidth: 1,
          borderColor: AppColors.backgroundExt,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: AppDimens.dimen10,
          vertical: AppDimens.dimen5,
        ),
        padding: EdgeInsets.all(AppDimens.dimen10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(AppDimens.dimen5),
                  decoration: UiApi.deco(
                    opacity: 0,
                    borderRadius: 10,
                    borderWidth: 2,
                    borderColor: AppColors.background,
                  ),
                  child: UiApi.imageLoader(
                    url: prod.shop.logo,
                    height: AppDimens.dimen30,
                    width: AppDimens.dimen30,
                  ),
                ),
                SizedBox(width: AppDimens.dimen10),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiApi.richText(
                        mod: [
                          RichTextModel(
                              text: prod.name,
                              style: AppTextStyles.descStyleBold)
                        ],
                        maxLines: 2,
                      ),
                      SizedBox(height: AppDimens.dimen3),
                      UiApi.richText(
                        mod: [
                          RichTextModel(
                              text: prod.description,
                              style: AppTextStyles.smallSubDescStyleLight)
                        ],
                        maxLines: 3,
                      ),
                      SizedBox(height: AppDimens.dimen5),
                      amountModuleWidget(prod),
                      SizedBox(height: AppDimens.dimen5),
                      UiApi.richText(
                        mod: [
                          RichTextModel(
                              text: prod.shop.name.capitalizeFirstLetters(),
                              style:
                                  AppTextStyles.smallSubDescStyleBold.copyWith(
                                color: AppColors.primaryGreenColor,
                              ))
                        ],
                        maxLines: 2,
                      ),
                      SizedBox(height: AppDimens.dimen5),
                      Row(
                        children: [
                          UiApi.textAndIcon(
                            text: '34km',
                            icon: Icons.location_on,
                          ),
                          UiApi.textAndIcon(
                            text: 'Mon - Fri',
                            icon: Icons.date_range,
                          ),
                          UiApi.textAndIcon(
                            text: '8am - 10pm',
                            icon: Icons.access_time_rounded,
                          ),
                        ],
                      ),
                      SizedBox(height: AppDimens.dimen3),
                      UiApi.richText(
                        mod: [
                          RichTextModel(
                              text: prod.shop.description,
                              style: AppTextStyles.smallSubDescStyleRegular)
                        ],
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimens.dimen3),
            UiApi.horizontalListView(
              aspectRatio: 4,
              padding: EdgeInsets.zero,
              list: [
                ...prod.images.map(
                  (e) => Padding(
                    padding: EdgeInsets.only(right: AppDimens.dimen10),
                    child: UiApi.imageLoader(
                      url: e,
                      height: AppDimens.dimen100,
                      width: AppDimens.dimen100,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  static Widget additionalProductDetailsWidget(
    ProductSummary productSummary,
    RxInt currentPodIndex, {
    Function(ProductSummary, int count)? onAddRemove,
    Function(ProductSummary)? onDeleteItem,
  }) {
    ProductModel prod = productSummary.product;
    RxInt count = productSummary.quantity.obs;

    return Column(
      children: [
        UiApi.carouselSlider(
          enlargeCenterPage: true,
          viewportFraction: .5,
          list: prod.images.map(
            (e) {
              return Container(
                decoration: UiApi.deco(opacity: 0),
                margin: EdgeInsets.all(AppDimens.dimen5),
                child: UiApi.imageLoader(
                  url: e,
                  border: 5,
                  heroTag: e,
                  placeHolder: UiApi.assetImage(
                    "assets/images/ic_rect.png",
                    height: AppDimens.dimen100,
                    width: AppDimens.dimen100,
                  ),
                ),
              );
            },
          ).toList(),
          currentPod: currentPodIndex,
          aspectRatio: 2.2,
        ),
        SizedBox(height: AppDimens.dimen4),
        Obx(
          () => UiApi.pod(prod.images.length, currentPodIndex,
              activeColor: AppColors.market3),
        ),
        SizedBox(height: AppDimens.dimen20),
        Text(prod.name, style: AppTextStyles.title),
        SizedBox(height: AppDimens.dimen10),
        Text(prod.description, style: AppTextStyles.descStyleLight),
        SizedBox(height: AppDimens.dimen20),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.dimen5, vertical: AppDimens.dimen10),
          decoration: UiApi.deco(
            opacity: 0,
            borderColor: AppColors.backgroundExt,
            borderRadius: 5,
          ),
          margin: EdgeInsets.symmetric(horizontal: AppDimens.dimen5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UiApi.textWidget(
                'Unit Price',
                NumberUtils.moneyCurrencyFormat(prod.price, dec: 2),
                icon: Icons.monetization_on_outlined,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              UiApi.textWidget(
                'Quantity',
                '${productSummary.quantity}',
                icon: Icons.date_range,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ],
          ),
        ),
        SizedBox(height: AppDimens.dimen20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                UiApi.buttonIcon(
                  child: Icon(Icons.remove, size: AppDimens.dimen14),
                  onTap: () {
                    if (count.value > 1) {
                      count.value--;
                      if (onAddRemove != null) {
                        onAddRemove(productSummary, count.value);
                      }
                    }
                  },
                ),
                UiApi.buttonIcon(
                  child: Obx(
                    () => Text(
                      "${count.value}",
                      style: AppTextStyles.subDescRegular,
                    ),
                  ),
                ),
                UiApi.buttonIcon(
                  child: Icon(Icons.add, size: AppDimens.dimen14),
                  onTap: () {
                    count.value++;
                    if (onAddRemove != null) {
                      onAddRemove(productSummary, count.value);
                    }
                  },
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                if (onDeleteItem != null) {
                  onDeleteItem(productSummary);
                }
              },
              icon: Icon(Icons.delete,
                  size: AppDimens.dimen20, color: AppColors.redLight),
            ),
          ],
        ),
        /* UiApi.iconText(
          text: 'Quantity Ordered: ',
          subText: '${prod.quantity}',
          iconData: Icons.add_shopping_cart,
          iconColor: AppColors.black,
        ),
        UiApi.iconText(
          text: 'Total Price : ',
          // subText: order.deliveryOption.toUpperCase(),
          iconData: Icons.monetization_on,
          iconColor: AppColors.black,
          subWidget: UiApi.richText(mod: [
            RichTextModel(
              text: 'GHS ',
              style: AppTextStyles.smallSubDescStyleRegular.copyWith(
                color: AppColors.orange,
                decoration: TextDecoration.lineThrough,
                decorationStyle: TextDecorationStyle.solid,
                decorationThickness: 2,
              ),
            ),
            RichTextModel(
              text: NumberUtils.moneyFormat(prod.price, decPlace: 2),
              style: AppTextStyles.titleStyleBold.copyWith(
                color: AppColors.orange,
                decoration: TextDecoration.lineThrough,
                decorationStyle: TextDecorationStyle.solid,
                decorationThickness: 2,
              ),
            ),
            RichTextModel(
              text: '   ',
              style: AppTextStyles.title,
            ),
            RichTextModel(
              text: 'GHS ',
              style: AppTextStyles.smallSubDescStyleRegular
                  .copyWith(color: AppColors.orange),
            ),
            RichTextModel(
              text: NumberUtils.moneyFormat(prod.price, decPlace: 2),
              style: AppTextStyles.titleStyleBold
                  .copyWith(color: AppColors.orange),
            )
          ]),
        ),
        UiApi.iconText(
          text: 'Discount Price : ',
          // subText: prod.deliveryOption.toUpperCase(),
          iconData: Icons.monetization_on,
          iconColor: AppColors.black,
          subWidget: UiApi.richText(mod: [
            RichTextModel(
              text: 'GHS ',
              style: AppTextStyles.smallSubDescStyleRegular
                  .copyWith(color: AppColors.orange),
            ),
            RichTextModel(
              text: NumberUtils.moneyFormat(prod.price, decPlace: 2),
              style: AppTextStyles.titleStyleBold
                  .copyWith(color: AppColors.orange),
            )
          ]),
        ),*/
        SizedBox(height: AppDimens.dimen20),
      ],
    );
  }

  ///============= Product Widget Modules =================
  ///

  /// Amount display both with discount and actual amount
  static Widget amountModuleWidget(
    ProductModel prod, {
    Color? textColor,
    Color? discountTextColor,
    double? textSize,
    double? discountTextSize,
    bool verticalAxis = false,
  }) {
    return UiApi.richText(mod: [
      RichTextModel(
        text: 'GHS ',
        style: AppTextStyles.smallSubDescStyleRegular
            .copyWith(color: textColor ?? AppColors.black),
      ),
      RichTextModel(
        text: NumberUtils.moneyFormatDouble(prod.netAmount, decPlace: 2),
        style: AppTextStyles.descStyleBold.copyWith(
          color: textColor ?? AppColors.black,
          fontSize: textSize ?? AppDimens.desc,
        ),
      ),
      if (prod.discount > 0) RichTextModel(text: verticalAxis ? '\n' : '    '),
      if (prod.discount > 0)
        RichTextModel(
          text: 'GHS ',
          style: AppTextStyles.smallSubDescStyleRegular.copyWith(
            color: discountTextColor ?? AppColors.black,
            decoration: TextDecoration.lineThrough,
            decorationStyle: TextDecorationStyle.solid,
            decorationThickness: 2,
            fontSize: discountTextSize ?? AppDimens.smallSubDesc,
          ),
        ),
      if (prod.discount > 0)
        RichTextModel(
          text: NumberUtils.moneyFormatDouble(prod.price, decPlace: 2),
          style: AppTextStyles.descStyleBold.copyWith(
            color: discountTextColor ?? AppColors.black,
            decoration: TextDecoration.lineThrough,
            decorationStyle: TextDecorationStyle.solid,
            decorationThickness: 2,
            fontSize: discountTextSize ?? AppDimens.smallSubDesc,
          ),
        ),
    ]);
  }

  ///Widget to update the quantity of a product or delete the product
  static Widget quantityUpdateWidget(
    BaseObject obj, {
    Function(BaseObject)? onQuantityUpdate,
    Function(BaseObject)? onDeleteItem,
    Color? plusButtonColor,
    Color? plusButtonBorderColor,
    Color? subButtonColor,
    Color? subButtonBorderColor,
    Color? plusButtonIconColor,
    Color? subButtonIconColor,
    bool circularButton = false,
    bool zeroQuantity = false,
    TextStyle? textStyle,
    Color? textBorderColor,
  }) {
    ProductModel productModel =
        obj is ProductSummary ? obj.product : (obj as ProductModel);

    RxInt count =
        obj is ProductSummary ? (obj).quantity.obs : productModel.count.obs;

    return Row(
      children: [
        UiApi.buttonIcon(
          isRounded: circularButton,
          roundContainerColour: subButtonColor,
          roundContainerBorderColour: subButtonBorderColor,
          child: Icon(
            Icons.remove,
            size: AppDimens.dimen14,
            color: subButtonIconColor,
          ),
          onTap: () {
            if (zeroQuantity && count.value >= 1) {
              count.value--;

              if (obj is ProductSummary) {
                obj = (obj as ProductSummary).copyWith(quantity: count.value);
              } else {
                productModel = productModel.copyWith(count: count.value);
                obj = productModel;
              }

              if (onQuantityUpdate != null) {
                onQuantityUpdate(obj);
              }
            } else if (count.value > 1) {
              count.value--;

              if (obj is ProductSummary) {
                obj = (obj as ProductSummary).copyWith(quantity: count.value);
              } else {
                productModel = productModel.copyWith(count: count.value);
                obj = productModel;
              }
              if (onQuantityUpdate != null) {
                onQuantityUpdate(obj);
              }
            }
          },
        ),
        UiApi.buttonIcon(
          roundContainerBorderColour: textBorderColor ?? AppColors.lineExt,
          child: Obx(
            () => Text(
              "${count.value}",
              style: textStyle ?? AppTextStyles.subDescRegular,
            ),
          ),
        ),
        UiApi.buttonIcon(
          isRounded: circularButton,
          roundContainerBorderColour: plusButtonBorderColor,
          roundContainerColour: plusButtonColor,
          child: Icon(
            Icons.add,
            size: AppDimens.dimen14,
            color: plusButtonIconColor,
          ),
          onTap: () {
            count.value++;

            if (obj is ProductSummary) {
              obj = (obj as ProductSummary).copyWith(quantity: count.value);
            } else {
              productModel = productModel.copyWith(count: count.value);
              obj = productModel;
            }
            if (onQuantityUpdate != null) {
              onQuantityUpdate(obj);
            }
          },
        ),
      ],
    );
  }

  static Widget productBasketItemWidget(
    ProductModel prod, {
    Function(BaseObject)? onProdUpdate,
  }) {
    // RxInt count = prod.count.obs;
    // String key = const Uuid().v4();
    // return Dismissible(
    //   key: Key(key),
    //   onDismissed: (direction) {
    //     controller.onAddRemoveCart(prod, 0);
    //   },
    //   behavior: HitTestBehavior.deferToChild,
    //   background: Container(
    //     color: Colors.red,
    //     child: Center(
    //       child: Text(
    //         "DELETE",
    //         style:
    //             AppTextStyles.h5StyleRegular.copyWith(color: AppColors.white),
    //       ),
    //     ),
    //   ),
    //   child: ,
    // );

    return Container(
      decoration: UiApi.deco(borderRadius: 0),
      padding: EdgeInsets.all(AppDimens.dimen8),
      margin: EdgeInsets.only(top: AppDimens.dimen5),
      child: Row(
        children: [
          Container(
            decoration: UiApi.deco(
                opacity: 0, borderWidth: 1, borderColor: AppColors.line),
            padding: EdgeInsets.all(AppDimens.dimen5),
            child: UiApi.imageLoader(
              url: prod.images.first,
              placeHolder: UiApi.assetImage(
                "assets/images/ic_rect.png",
                height: AppDimens.dimen50,
                width: AppDimens.dimen50,
              ),
              height: AppDimens.dimen50,
              width: AppDimens.dimen50,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: AppDimens.dimen5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiApi.richText(
                  maxLines: 2,
                  mod: [
                    RichTextModel(
                      text: prod.name,
                      style: AppTextStyles.smallerSubDescStyleBold,
                    )
                  ],
                ),
                SizedBox(height: AppDimens.dimen3),
                UiApi.richText(
                  maxLines: 3,
                  mod: [
                    RichTextModel(
                      text: prod.description,
                      style: AppTextStyles.smallerSubDescStyleLight,
                    )
                  ],
                ),
                SizedBox(height: AppDimens.dimen5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "¢",
                          style: AppTextStyles.h5StyleSemiBold.copyWith(
                            color: AppColors.redLight,
                          ),
                        ),
                        Text(
                          NumberUtils.moneyFormatDouble(prod.price,
                              decPlace: 2),
                          style: AppTextStyles.h5StyleBold.copyWith(
                            color: AppColors.redLight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  if (onProdUpdate != null) {
                    prod = prod.copyWith(count: 0);
                    onProdUpdate(prod);
                  }
                },
                icon: Icon(
                  Icons.delete,
                  size: AppDimens.dimen20,
                  color: AppColors.redLight,
                ),
              ),
              SizedBox(height: AppDimens.dimen14),
              quantityUpdateWidget(
                prod,
                textStyle: AppTextStyles.descStyleBold,
                onQuantityUpdate: onProdUpdate,
              ),
              // Row(
              //   children: [
              //     UiApi.buttonIcon(
              //       child: Icon(Icons.remove, size: AppDimens.dimen14),
              //       onTap: () {
              //         if (count.value > 1) {
              //           count.value--;
              //           if (onProdUpdate != null) {
              //             onProdUpdate(prod, count.value);
              //           }
              //         }
              //       },
              //     ),
              //     UiApi.buttonIcon(
              //       child: Obx(
              //         () => Text(
              //           "${count.value}",
              //           style: AppTextStyles.subDescRegular,
              //         ),
              //       ),
              //     ),
              //     UiApi.buttonIcon(
              //       child: Icon(Icons.add, size: AppDimens.dimen14),
              //       onTap: () {
              //         count.value++;
              //         if (onProdUpdate != null) {
              //           onProdUpdate(prod, count.value);
              //         }
              //       },
              //     ),
              //   ],
              // ),
            ],
          )
        ],
      ),
    );
  }

  static Widget productCartItemWidget(
    ProductSummary productSummary, {
    Function(BaseObject)? onProdUpdate,
    Function(ProductSummary)? onDeleteProduct,
    Function(ProductSummary)? onTap,
  }) {
    ProductModel prod = productSummary.product;
    return InkWell(
      onTap: () {
        if (onTap != null) onTap(productSummary);
      },
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: UiApi.deco(
                    opacity: 0, borderWidth: 1, borderColor: AppColors.line),
                padding: EdgeInsets.all(AppDimens.dimen5),
                child: UiApi.imageLoader(
                  url: prod.images.first,
                  placeHolder: UiApi.assetImage(
                    "assets/images/ic_rect.png",
                    height: AppDimens.dimen50,
                    width: AppDimens.dimen50,
                  ),
                  height: AppDimens.dimen50,
                  width: AppDimens.dimen50,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: AppDimens.dimen5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiApi.richText(
                      maxLines: 1,
                      mod: [
                        RichTextModel(
                          text: prod.name,
                          style: AppTextStyles.smallerSubDescStyleBold,
                        )
                      ],
                    ),
                    SizedBox(height: AppDimens.dimen3),
                    UiApi.richText(
                      maxLines: 2,
                      mod: [
                        RichTextModel(
                          text: prod.description,
                          style: AppTextStyles.smallerSubDescStyleLight,
                        )
                      ],
                    ),
                    SizedBox(height: AppDimens.dimen5),
                    amountModuleWidget(
                      prod,
                      verticalAxis: true,
                      textColor: AppColors.market3,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      if (onDeleteProduct != null) {
                        onDeleteProduct(productSummary);
                      }
                    },
                    icon: Icon(
                      Icons.delete,
                      size: AppDimens.dimen20,
                      color: AppColors.redLight,
                    ),
                  ),
                  SizedBox(height: AppDimens.dimen14),
                  quantityUpdateWidget(
                    productSummary,
                    onQuantityUpdate: onProdUpdate,
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: AppDimens.dimen5),
          UiApi.divider(
            width: SizeConfig.screenWidth,
            color: AppColors.backgroundExt,
          ),
          SizedBox(height: AppDimens.dimen5),
        ],
      ),
    );
  }

  static Widget colorOfProductWidget({
    String color = '',
    RxString? selectedColor,
    Function(String)? onTap,
  }) {
    return UiApi.buttonIcon(
      onTap: () {
        if (onTap != null) onTap(color);
      },
      roundContainerBorderColour: HexColor.fromHex(color),
      roundContainerColour: HexColor.fromHex(color),
      width: AppDimens.dimen60,
      margin: EdgeInsets.only(right: AppDimens.dimen14),
      child: Icon(
        Icons.done_rounded,
        color: selectedColor?.value == color
            ? AppColors.white
            : HexColor.fromHex(color),
      ),
    );
  }

  static Widget sizeOfProductWidget({
    String size = '',
    RxString? selectedSize,
    Function(String)? onTap,
  }) {
    return UiApi.buttonIcon(
      onTap: () {
        if (onTap != null) onTap(size);
      },
      roundContainerBorderColour:
          selectedSize?.value == size ? AppColors.market3 : AppColors.lineExt,
      width: AppDimens.dimen60,
      margin: EdgeInsets.only(right: AppDimens.dimen14),
      child: Text(
        size,
        style: AppTextStyles.titleStyleMedium.copyWith(
          color:
              selectedSize?.value == size ? AppColors.market3 : AppColors.black,
        ),
      ),
    );
  }
}
