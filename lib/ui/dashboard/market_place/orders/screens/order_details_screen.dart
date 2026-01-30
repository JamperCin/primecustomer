import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/data/model/remote/shop_payment_model.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/assets_config.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_sliver_basic.dart';
import 'package:primecustomer/ui/dashboard/market_place/orders/controllers/order_details_controller.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/date_time_utils.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetailScreen extends BaseSliverBasic {
  final controller = Get.put(OrderDetailsController());

  OrderDetailScreen() {
    Utils.delayTimer(() {
      controller.initData(getModel());
    });
  }

  @override
  Widget titleWidget(BuildContext context) {
    return Obx(
      () => Text(
        controller.selectedOrder.value.product.name,
        style: AppTextStyles.titleStyleRegular.copyWith(color: AppColors.white),
      ),
    );
  }

  // @override
  // String appBarTitle() {
  //   return 'Order Details';
  // }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  ShopPaymentModel getModel() {
    return baseObject as ShopPaymentModel;
  }

  @override
  Widget flexBackGroundWidget() {
    return Obx(
      () => controller.selectedProduct.value.images.isNotEmpty
          ? UiApi.carouselSlider(
              list: controller.selectedProduct.value.images.map(
                (e) {
                  return UiApi.imageLoader(
                    url: e,
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenWidth,
                    heroTag: e,
                    border: 0,
                    fit: BoxFit.cover,
                  );
                },
              ).toList(),
              currentPod: controller.currentPodIndex,
            )
          : const SizedBox(),
    );
  }

  @override
  Widget flexBackGroundSubWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: AppDimens.dimen20),
        child: Obx(
          () => UiApi.pod(controller.selectedProduct.value.images.length,
              controller.currentPodIndex,
              activeColor: AppColors.market3),
        ),
      ),
    );
  }

  @override
  Widget page(BuildContext context) {
    return Obx(
      () => controller.orderList.isNotEmpty
          ? UiApi.listView(
              list: listView(),
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.dimen16,
                vertical: AppDimens.dimen14,
              ))
          : UiApi.loader(),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];
    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(UiApi.titleIconWidget(
      title:
          '${controller.orderList.length} Product(s) in your order ${controller.shopPaymentModel.value.orderStats}',
      asset: AssetsConfig.basketWithProducts,
      titleStyle: AppTextStyles.descStyleBold,
    ));
    list.add(SizedBox(height: AppDimens.dimen5));

    list.add(
      controller.orderApi.productCarouselWidget(
        controller.orderList.value,
        controller.selectedOrder.value,
        onTap: controller.onProductTapped,
        onView: controller.onProductView,
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(UiApi.titleIconWidget(
      title: 'Order details',
      asset: AssetsConfig.shoppingCart,
      titleStyle: AppTextStyles.descStyleBold,
    ));
    list.add(SizedBox(height: AppDimens.dimen10));

    ///Order Details
    list.add(Container(
      decoration: UiApi.deco(),
      padding: EdgeInsets.all(AppDimens.dimen10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UiApi.richText(mod: [
            RichTextModel(
              text: 'Order No. : ',
              style: AppTextStyles.descStyleLight,
            ),
            RichTextModel(
              text: controller.shopPaymentModel.value.reference,
              style: AppTextStyles.descStyleBold,
            ),
          ]),
          SizedBox(height: AppDimens.dimen5),
          UiApi.richText(mod: [
            RichTextModel(
              text: "Total Products  : ",
              style: AppTextStyles.subDescStyleLight,
            ),
            RichTextModel(
              text: '${controller.shopPaymentModel.value.orders.length}',
              style: AppTextStyles.descStyleBold,
            ),
          ]),
          SizedBox(height: AppDimens.dimen5),
          UiApi.richText(
            mod: [
              RichTextModel(
                text: "Total Amount : ",
                style: AppTextStyles.subDescStyleLight,
              ),
              RichTextModel(
                text: "GHS",
                style: AppTextStyles.subDescStyleLight,
              ),
              RichTextModel(
                text: ' ',
                style: AppTextStyles.descStyleLight,
              ),
              RichTextModel(
                text: NumberUtils.moneyFormat(
                    controller.shopPaymentModel.value.amount,
                    decPlace: 2),
                style: AppTextStyles.title,
              ),
            ],
            maxLines: 1,
          ),
          SizedBox(height: AppDimens.dimen5),
          UiApi.richText(
            mod: [
              RichTextModel(
                text: "Placed On : ",
                style: AppTextStyles.subDescStyleLight,
              ),
              RichTextModel(
                text: DateTimeUtils.formatDateString(
                    controller.shopPaymentModel.value.createAt,
                    format: "MMM dd mm yyyy"),
                style: AppTextStyles.descStyleBold,
              ),
            ],
            maxLines: 1,
          ),
        ],
      ),
    ));

    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(UiApi.titleIconWidget(
      title: 'Delivery Info',
      asset: AssetsConfig.shoppingCart,
      titleStyle: AppTextStyles.descStyleBold,
    ));
    list.add(SizedBox(height: AppDimens.dimen10));

    if (controller.canShowMap()) {
      list.add(SizedBox(
        height: SizeConfig.screenHeight * 0.4,
        child: Stack(
          children: [
            // GoogleMap(
            //   mapType: MapType.normal,
            //   myLocationEnabled: true,
            //   myLocationButtonEnabled: true,
            //   zoomControlsEnabled: true,
            //   zoomGesturesEnabled: true,
            //   markers: Set<Marker>.of(controller.markersSet.values),
            //   polylines: Set<Polyline>.of(controller.polyLines),
            //   initialCameraPosition: controller.initCameraPosition(),
            //   onMapCreated: controller.onMapCreated,
            //   gestureRecognizers: Set()
            //     ..add(Factory<EagerGestureRecognizer>(
            //         () => EagerGestureRecognizer())),
            // ),
            Container(
              width: SizeConfig.screenWidth,
              padding: EdgeInsets.all(AppDimens.dimen10),
              margin: EdgeInsets.all(AppDimens.dimen10),
              decoration: UiApi.deco(),
              child: Obx(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'ETA',
                            style: AppTextStyles.descStyleLight,
                          ),
                        ),
                        SizedBox(width: AppDimens.dimen10),
                        Flexible(
                          flex: 0,
                          child: Text(
                            controller.estimatedDuration.value,
                            style: AppTextStyles.descStyleBold,
                          ),
                        ),
                        UiApi.divider(
                          height: AppDimens.dimen30,
                          width: 3,
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimens.dimen5),
                        ),
                        Flexible(
                          flex: 0,
                          child: Text(
                            controller.estimatedDistance.value,
                            style: AppTextStyles.descStyleBold,
                          ),
                        ),
                      ],
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
    }

    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(
      UiApi.deliveryInfoText(
        title: 'Recipient name',
        value:
            controller.shopPaymentModel.value.orders.first.deliveryAddress.name,
      ),
    );
    list.add(SizedBox(height: AppDimens.dimen10));
    list.add(
      UiApi.deliveryInfoText(
        title: 'Recipient Telephone',
        icon: Icons.call,
        value: controller
            .shopPaymentModel.value.orders.first.deliveryAddress.phone,
      ),
    );
    list.add(SizedBox(height: AppDimens.dimen10));
    list.add(
      UiApi.deliveryInfoText(
        title: 'Delivery Address',
        icon: Icons.map,
        value: (controller.shopPaymentModel.value.orders.first.deliveryAddress
                    .locationName +
                "\n" +
                controller.shopPaymentModel.value.orders.first.deliveryAddress
                    .residentialAddress)
            .trim(),
      ),
    );

    ///Orders List
    /* list.add(Column(
      children: [
        UiApi.titleIconWidget(
          icon: Icons.add,
          title: 'Items in your order'.toUpperCase(),
          titleStyle: AppTextStyles.descStyleBold,
        ),
        SizedBox(height: AppDimens.dimen5),
        UiApi.divider(height: 1, width: SizeConfig.screenWidth),
        SizedBox(height: AppDimens.dimen5),
        ...controller.shopPaymentModel.value.orders
            .map((e) => orderApi.orderProductItemWidget(e))
      ],
    ));
*/

    return list;
  }

  @override
  Widget bottomNavigationBar({BuildContext? context}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: UiApi.deco(),
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.only(
            left: AppDimens.dimen10,
            right: AppDimens.dimen10,
            top: AppDimens.dimen10,
            bottom: AppDimens.dimen20,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UiApi.richText(
                          mod: [
                            RichTextModel(
                              text: "GHS",
                              style: AppTextStyles.subDescStyleBold
                                  .copyWith(color: AppColors.market3),
                            ),
                            RichTextModel(
                              text: " ",
                              style: AppTextStyles.subDescRegular,
                            ),
                            RichTextModel(
                                text: NumberUtils.moneyFormat(
                                    controller.shopPaymentModel.value.amount,
                                    decPlace: 2),
                                style: AppTextStyles.h4StyleBold
                                    .copyWith(color: AppColors.market3)),
                          ],
                        ),
                        Text(
                          'Total Price',
                          style: AppTextStyles.subDescStyleBold,
                          // textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: UiApi.decoratedButton(
                    text: "Update Order",
                    style: AppTextStyles.subDescStyleBold
                        .copyWith(color: AppColors.white),
                    icon: UiApi.assetImage(
                      "assets/images/ic_promo.svg",
                      height: AppDimens.dimen20,
                      width: AppDimens.dimen20,
                      assetColor: AppColors.white,
                    ),
                    padding: EdgeInsets.only(
                      right: AppDimens.dimen5,
                      left: AppDimens.dimen10,
                    ),
                    backgroundColor: AppColors.introColor2,
                    onTap: () {
                      // controller.viewCardDetails(card: getModel());
                    }),
              )
            ],
          ),
        ),
      ],
    );
  }
}
