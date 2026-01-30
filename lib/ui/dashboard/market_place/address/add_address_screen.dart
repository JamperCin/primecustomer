import 'package:primecustomer/controller/market/address_controller.dart';
import 'package:primecustomer/data/model/remote/address_model.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/app/app_dimens.dart';

class AddAddressScreen extends BaseScreenStandard {
  final AddressController controller = Get.put(AddressController());
  final Function(AddressModel)? call;

  AddAddressScreen({this.call}) {
    controller.onInitData();
  }

  @override
  String appBarTitle() {
    return "Add Delivery Address";
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(list: listView());
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];
    list.add(SizedBox(height: AppDimens.dimen40));
    list.add(UiApi.textFormField(
        labelText: "Full Name",
        hintText: "Enter full name",
        controller: controller.nameTxt,
        height: AppDimens.dimen60,
        textCapitalization: TextCapitalization.words,
        style: AppTextStyles.descStyleLight,
        hintStyle: AppTextStyles.descStyleRegular,
        labelStyle: AppTextStyles.descStyleRegular,
        onChanged: (val) {
          controller.validateForm();
        }));

    list.add(SizedBox(height: AppDimens.dimen40));
    list.add(UiApi.textFormField(
        labelText: "Phone Number",
        hintText: "Enter Phone Number",
        controller: controller.phoneTxt,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
        height: AppDimens.dimen60,
        hintStyle: AppTextStyles.descStyleRegular,
        labelStyle: AppTextStyles.descStyleRegular,
        onChanged: (val) {
          controller.validateForm();
        }));

    list.add(SizedBox(height: AppDimens.dimen40));
    list.add(UiApi.textFormField(
        labelText: "Location",
        hintText: "Search Location",
        controller: controller.locationTxt,
        suffixIcon: Icon(
          Icons.location_pin,
          size: AppDimens.dimen28,
        ),
        enabled: false,
        onTap: () {
          controller.pickLocation();
        },
        height: AppDimens.dimen60,
        textCapitalization: TextCapitalization.words,
        hintStyle: AppTextStyles.descStyleRegular,
        labelStyle: AppTextStyles.descStyleRegular,
        onChanged: (val) {
          controller.validateForm();
        }));

    return list;
  }

  @override
  Widget bottomNavigationBar({BuildContext? context}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: UiApi.deco(opacity: .5, borderRadius: 0),
          width: SizeConfig.screenWidth,
          padding: EdgeInsets.only(
            left: AppDimens.dimen40,
            right: AppDimens.dimen40,
            top: AppDimens.dimen12,
            bottom: AppDimens.dimen24,
          ),
          child: Obx(
            () => UiApi.button(
              text: "Save Address",
              border: 8,
              animate: controller.isSavingAddress,
              textColor: controller.isValidForm.value
                  ? AppColors.white
                  : AppColors.lineExt,
              backgroundColor: controller.isValidForm.value
                  ? AppColors.primaryGreenColor
                  : AppColors.background,
              onPressed: () {
                controller.onSaveAddressOnClick(call: call);
              },
            ),
          ),
        ),
      ],
    );
  }

  ///Show Gift cards from your Purchased and Gifted In ones
  /* Widget deliveryAddressHistory() {
    return Obx(
      () => controller.isDoneLoadingAddress.value &&
              controller.deliveryAddressList.isNotEmpty
          ? UiApi.listView(
              scrollController: controller.scrollController,
              isLoadingMore: controller.isLoadingMoreAddress,
              list: [
                ...controller.deliveryAddressList
                    .map((address) => UiApi.addressItemWidget(
                          address,
                          onTap: controller.onAddressSelected,
                        )),
                SizedBox(height: AppDimens.dimen40),
              ],
              padding: EdgeInsets.zero,
            )
          : controller.isDoneLoadingAddress.value &&
                  controller.deliveryAddressList.isEmpty
              ? UiApi.noDataWidget(
                  title: "Empty List",
                  message:
                      "You have no delivery address saved. Kindly add a delivery address",
                )
              : UiApi.loader(size: 2),
    );
    */ /*return UiApi.bottomSlider(
      panelController: controller.deliveryAddressController,
      minHeight: 0.0,
      title: 'Select Delivery Address',
      child: Obx(
            () => controller.isDoneLoadingAddress.value &&
            controller.deliveryAddressList.isNotEmpty
            ? UiApi.listView(
          scrollController: controller.scrollController,
          isLoadingMore: controller.isLoadingMoreAddress,
          list: [
            ...controller.deliveryAddressList
                .map((address) => UiApi.addressItemWidget(
              address,
              onTap: controller.onAddressSelected,
            )),
            SizedBox(height: AppDimens.dimen40),
          ],
          padding: EdgeInsets.symmetric(horizontal: AppDimens.dimen10),
        )
            : controller.isDoneLoadingAddress.value &&
            controller.deliveryAddressList.isEmpty
            ? UiApi.noDataWidget(
          title: "Empty List",
          message:
          "You have no delivery address saved. Kindly add a delivery address",
          button: FloatingActionButton(
            mini: true,
            onPressed: () {
              controller.onAddDeliveryAddress();
            },
            backgroundColor: AppColors.market3,
            child: Icon(
              Icons.add,
              size: AppDimens.dimen20,
            ),
          ),
        )
            : UiApi.circularProgressIndicator(),
      ),
      bottomWidget: Obx(
            () => UiApi.button(
          text: 'Select Address',
          onPressed: controller.onProceedOnAddressSelection,
          backgroundColor: controller.isAddressSelected.value
              ? AppColors.market3
              : AppColors.lineExt,
        ),
      ),
    );*/ /*
  }*/
}
