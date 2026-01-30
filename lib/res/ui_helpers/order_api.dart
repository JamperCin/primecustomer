import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/data/model/remote/orders_model.dart';
import 'package:primecustomer/data/model/remote/product_model.dart';
import 'package:primecustomer/data/model/remote/shop_payment_model.dart';
import 'package:primecustomer/extensions/product_extension.dart';
import 'package:primecustomer/extensions/string_extension.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/utils/date_time_utils.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:primecustomer/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/app_dimens.dart';
import '../app/app_text_styles.dart';

class OrderApi {
  static final OrderApi _instance = OrderApi._internal();
  RxInt currentPodIndex = 0.obs;

  OrderApi._internal() {
    debugPrint("Creating instance");
  }

  factory OrderApi() {
    return _instance;
  }

  ///Widget to identify the status of an order
  Widget _orderStatusWidget(String status) {
    Color color = Colors.black;
    switch (status.toLowerCase()) {
      case 'pending':
        color = AppColors.violet;
        break;
      case 'request_waiting':
        color = AppColors.introColor2;
        break;
      case 'delivered':
        color = AppColors.primaryGreenColor;
        break;
    }

    return Container(
      decoration: UiApi.deco(
        opacity: 0,
        borderColor: color,
        borderRadius: 20,
        color: color,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.dimen5,
        vertical: AppDimens.dimen2,
      ),
      child: Text(
        status.toUpperCase().replaceAll("_", " "),
        style: AppTextStyles.smallerSubDescStyleBold.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }

  Widget productImageWidget(ProductModel p) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        UiApi.horizontalListView(
            list: p.images
                .map((url) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppDimens.dimen5),
                      child: InkWell(
                        onTap: () {
                          // controller.onImageSelected(url);
                        },
                        child: Container(
                          decoration: UiApi.deco(
                            borderColor: AppColors.backgroundExt,
                            opacity: 0,
                          ),
                          padding: EdgeInsets.all(AppDimens.dimen5),
                          child: UiApi.imageLoader(
                            height: AppDimens.dimen50,
                            width: AppDimens.dimen50,
                            url: url,
                            border: 5,
                            heroTag: url,
                            placeHolder: UiApi.assetImage(
                              "assets/images/ic_rect.png",
                              height: AppDimens.dimen50,
                              width: AppDimens.dimen50,
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList()),
      ],
    );
  }

  ///Widget to be used as the listView's item used from [ordersListWidget]
  static Widget orderItemWidget(ShopPaymentModel shop,
      {Function(ShopPaymentModel)? onTap}) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(shop);
        }
      },
      child: shop.orders.isNotEmpty
          ? Container(
              margin: EdgeInsets.only(top: AppDimens.dimen5),
              decoration: UiApi.deco(borderRadius: 5),
              padding: EdgeInsets.symmetric(
                vertical: AppDimens.dimen5,
                horizontal: AppDimens.dimen5,
              ),
              child: Row(
                children: [
                  UiApi.imageLoader(
                    url: shop.orders.first.product.shuffleImage,
                    width: AppDimens.dimen80,
                    height: AppDimens.dimen70,
                  ),
                  SizedBox(width: AppDimens.dimen10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        UiApi.richText(mod: [
                          RichTextModel(
                            text: shop.orders.first.client.name
                                .capitalizeFirstLetters(),
                            style: AppTextStyles.descStyleBold,
                          )
                        ]),
                        SizedBox(height: AppDimens.dimen3),
                        UiApi.richText(
                          mod: [
                            RichTextModel(
                              text: "GHS",
                              style: AppTextStyles.subDescStyleLight
                                  .copyWith(color: AppColors.market3),
                            ),
                            RichTextModel(
                              text: ' ',
                              style: AppTextStyles.descStyleLight,
                            ),
                            RichTextModel(
                              text: NumberUtils.moneyFormat(shop.amount,
                                  decPlace: 2),
                              style: AppTextStyles.descStyleBold
                                  .copyWith(color: AppColors.market3),
                            ),
                          ],
                          maxLines: 1,
                        ),
                        SizedBox(height: AppDimens.dimen3),
                        UiApi.richText(
                          maxLines: 2,
                          mod: [
                            RichTextModel(
                              text: StringUtils.concatProductName(shop.orders),
                              style: AppTextStyles.smallSubDescStyleRegular,
                            )
                          ],
                        ),
                        SizedBox(height: AppDimens.dimen3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${shop.orders.length} product(s)",
                              style: AppTextStyles.smallSubDescStyleLight,
                            ),
                            Text(
                              DateTimeUtils.formatDateString(shop.createAt,
                                  format: "MMM dd mm yyyy"),
                              style: AppTextStyles.smallSubDescStyleLight,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: AppDimens.dimen10,
                    color: AppColors.iconColor,
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  ///This is the list of orders that is displayed when order is [PENDING]
  Widget ordersListWidget({
    required RxList<ShopPaymentModel> orders,
    required RxBool isDoneLoading,
    required Future<void> onRefresh,
    ScrollController? scrollController,
    Function(ShopPaymentModel)? onTap,
  }) {
    return Obx(
      () => orders.isNotEmpty && isDoneLoading.value
          ? RefreshIndicator(
              onRefresh: () {
                return onRefresh; //controller.fetchOrders(refresh: true);
              },
              child: UiApi.listView(
                scrollController: scrollController,
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.dimen12,
                  vertical: AppDimens.dimen10,
                ),
                list: [
                  ...orders.map(
                    (e) => orderItemWidget(e, onTap: onTap),
                  )
                ],
              ),
            )
          : UiApi.loader(),
    );
  }

  Widget productCarouselWidget(
    List<OrderModel> orders,
    OrderModel selectedOrder, {
    Function(OrderModel)? onTap,
    Function(OrderModel)? onView,
  }) {
    return UiApi.horizontalListView(
      list: [
        ...orders.map((e) => productCarouselItemWidget(
              e,
              selectedOrder,
              onTap: onTap,
              onView: onView,
            ))
      ],
      aspectRatio: 1.35,
    );
  }

  Widget productCarouselItemWidget(
    OrderModel order,
    OrderModel selectedOrder, {
    Function(OrderModel)? onTap,
    Function(OrderModel)? onView,
  }) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(order);
        }
      },
      child: Container(
        width: SizeConfig.screenWidth * .52,
        margin: EdgeInsets.only(right: AppDimens.dimen8),
        padding: EdgeInsets.all(AppDimens.dimen10),
        decoration: UiApi.deco(
          borderColor: order == selectedOrder
              ? AppColors.introColor1
              : AppColors.backgroundExt,
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
                    text: order.product.name,
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
                maxLines: 4,
                mod: [
                  RichTextModel(
                    text: order.product.description,
                    style: AppTextStyles.smallSubDescStyleLight,
                  )
                ],
              ),
            ),
            SizedBox(height: AppDimens.dimen10),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  _orderStatusWidget(order.deliveryStatus),
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
                          style: AppTextStyles.subDescStyleBold,
                        ),
                        SizedBox(height: AppDimens.dimen2),
                        UiApi.richText(mod: [
                          RichTextModel(
                            text: 'GHS ',
                            style: AppTextStyles.smallSubDescStyleRegular
                                .copyWith(color: AppColors.orange),
                          ),
                          RichTextModel(
                            text: NumberUtils.moneyFormatDouble(
                                order.product.price,
                                decPlace: 2),
                            style: AppTextStyles.titleStyleBold
                                .copyWith(color: AppColors.orange),
                          )
                        ])
                      ],
                    ),
                  ),
                  // UiApi.divider(
                  //     height: AppDimens.dimen40,
                  //     color: AppColors.dimWhite,
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: AppDimens.dimen5)),
                  Flexible(
                    flex: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Qty',
                          style: AppTextStyles.subDescStyleBold
                              .copyWith(color: AppColors.black),
                        ),
                        SizedBox(height: AppDimens.dimen2),
                        Text(
                          '${order.quantity}',
                          style: AppTextStyles.descStyleBold
                              .copyWith(color: AppColors.orange),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimens.dimen20),
            UiApi.button(
              height: AppDimens.dimen30,
              width: AppDimens.dimen120,
              onPressed: () {
                if (onView != null) {
                  onView(order);
                }
              },
              backgroundColor: AppColors.white,
              borderColor: order == selectedOrder
                  ? AppColors.introColor1
                  : AppColors.dimWhite,
              text: 'View More',
              textStyle: AppTextStyles.subDescStyleBold.copyWith(
                color: order == selectedOrder
                    ? AppColors.introColor1
                    : AppColors.dimWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget additionalProductDetailsWidget(
    OrderModel order, {
    GestureTapCallback? onTap,
  }) {
    ProductModel p = order.product;
    return Column(
      children: [
        UiApi.carouselSlider(
          enlargeCenterPage: true,
          viewportFraction: .5,
          list: order.product.images.map(
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
          () => UiApi.pod(order.product.images.length, currentPodIndex,
              activeColor: AppColors.market3),
        ),
        SizedBox(height: AppDimens.dimen20),
        Text(p.name, style: AppTextStyles.title),
        SizedBox(height: AppDimens.dimen10),
        Text(p.description, style: AppTextStyles.descStyleLight),
        SizedBox(height: AppDimens.dimen20),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.dimen5, vertical: AppDimens.dimen10),
          decoration: UiApi.deco(),
          margin: EdgeInsets.symmetric(horizontal: AppDimens.dimen5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget(
                'Ordered On',
                DateTimeUtils.formatDateString(order.createdAt,
                    format: 'dd MMM yyyy'),
                icon: Icons.date_range,
              ),
              textWidget(
                'Status',
                order.deliveryStatus,
                icon: Icons.delivery_dining,
                isStatus: true,
              ),
              textWidget(
                'Unit Price',
                NumberUtils.moneyCurrencyFormat(order.product.price, dec: 2),
                icon: Icons.monetization_on_outlined,
              ),
            ],
          ),
        ),
        SizedBox(height: AppDimens.dimen20),
        UiApi.iconText(
          text: 'Quantity Ordered: ',
          subText: '${order.quantity}',
          iconData: Icons.add_shopping_cart,
          iconColor: AppColors.black,
        ),
        UiApi.iconText(
          text: 'Reference : ',
          subText: order.reference,
          iconColor: AppColors.black,
          iconData: Icons.numbers,
        ),
        UiApi.iconText(
          text: 'Total Price : ',
          subText: order.deliveryOption.toUpperCase(),
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
              text: NumberUtils.moneyFormat(order.grossAmount, decPlace: 2),
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
              text: NumberUtils.moneyFormat(order.netAmount, decPlace: 2),
              style: AppTextStyles.titleStyleBold
                  .copyWith(color: AppColors.orange),
            )
          ]),
        ),
        UiApi.iconText(
          text: 'Discount Price : ',
          subText: order.deliveryOption.toUpperCase(),
          iconData: Icons.monetization_on,
          iconColor: AppColors.black,
          subWidget: UiApi.richText(mod: [
            RichTextModel(
              text: 'GHS ',
              style: AppTextStyles.smallSubDescStyleRegular
                  .copyWith(color: AppColors.orange),
            ),
            RichTextModel(
              text: NumberUtils.moneyFormat(order.totalDiscount, decPlace: 2),
              style: AppTextStyles.titleStyleBold
                  .copyWith(color: AppColors.orange),
            )
          ]),
        ),

        // UiApi.button(
        //   onPressed: onTap,
        //   backgroundColor: AppColors.white,
        //   borderColor: AppColors.red,
        //   text: 'Remove product from order',
        //   textColor: AppColors.red,
        // ),
        SizedBox(height: AppDimens.dimen20),
      ],
    );
  }

  Widget textWidget(
    String title,
    String data, {
    IconData? icon,
    bool isStatus = false,
    TextStyle? titleStyle,
    TextStyle? subTitleStyle,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon ?? Icons.add,
              size: AppDimens.dimen14,
            ),
            Text(
              title,
              style: titleStyle ?? AppTextStyles.subDescRegular,
            ),
          ],
        ),
        SizedBox(height: AppDimens.dimen5),
        isStatus
            ? _orderStatusWidget(data)
            : Text(
                data,
                style: subTitleStyle ?? AppTextStyles.subDescStyleBold,
              ),
      ],
    );
  }
}
