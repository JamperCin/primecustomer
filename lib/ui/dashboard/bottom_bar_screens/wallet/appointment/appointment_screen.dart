import 'package:primecustomer/controller/view/appointment_controller.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/data/model/remote/card_account.dart';
import 'package:primecustomer/data/model/remote/gifted_card.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentScreen extends BaseScreenStandard {
  final AppointmentController controller = Get.put(AppointmentController());

  @override
  BaseObject getModel() {
    if (baseObject is CardAccount) {
      CardAccount account = baseObject as CardAccount;
      controller.cardUtils = CardUtils(account.card).setObject(baseObject);
      return account;
    }

    if (baseObject is GiftedCard) {
      GiftedCard gift = baseObject as GiftedCard;
      controller.cardUtils = CardUtils(gift.account.card).setObject(baseObject);
      return gift;
    }

    return baseObject;
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
    getModel();
  }

  @override
  String appBarTitle() {
    return "Book Appointment";
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(
      list: listView(),
      padding: EdgeInsets.only(
        top: AppDimens.dimen5,
        left: AppDimens.dimen24,
        right: AppDimens.dimen24,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(SizedBox(height: AppDimens.dimen20));
    list.add(Container(
      decoration: UiApi.deco(opacity: .4),
      padding: EdgeInsets.only(
        left: AppDimens.dimen5,
        right: AppDimens.dimen5,
        top: AppDimens.dimen10,
        bottom: AppDimens.dimen10,
      ),
      child: Row(
        children: [
          UiApi.circleImageView(
            url: controller.cardUtils?.getMerchantLogo() ?? "",
            radius: AppDimens.dimen30,
          ),
          SizedBox(width: AppDimens.dimen10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiApi.richText(mod: [
                  RichTextModel(
                    text: controller.cardUtils?.getMerchantName() ?? "",
                    style: AppTextStyles.titleStyleBold,
                  )
                ]),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: AppDimens.dimen16,
                      color: AppColors.deactivatedText,
                    ),
                    SizedBox(width: AppDimens.dimen5),
                    Flexible(
                      child: UiApi.richText(mod: [
                        RichTextModel(
                          text: controller.cardUtils?.getLocation() ?? "",
                          style: AppTextStyles.subDescRegular,
                        )
                      ]),
                    ),
                    SizedBox(width: AppDimens.dimen10),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));

    list.add(SizedBox(height: AppDimens.dimen50));

    list.add(
      UiApi.titleView(
        title: "Schedule Date and Time",
        backgroundColor: AppColors.white,
        padding: EdgeInsets.only(bottom: AppDimens.dimen10),
      ),
    );

    ///Schedule Date And Time
    list.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: UiApi.containerRoundCorners(
            borderColor: AppColors.introColor3,
            onTap: () {
              controller.onScheduleDate();
            },
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      controller.scheduledDate.value.isEmpty
                          ? "Schedule Date"
                          : controller.scheduledDate.value,
                      style: controller.scheduledDate.value.isEmpty
                          ? AppTextStyles.subDescRegular
                          : AppTextStyles.descStyleRegular
                              .copyWith(color: AppColors.primaryGreenColor),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: UiApi.assetImage(
                      "assets/images/ic_calendar.png",
                      height: AppDimens.dimen20,
                      assetColor: controller.scheduledTime.value.isEmpty
                          ? AppColors.black
                          : AppColors.primaryGreenColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: AppDimens.dimen10),
        Flexible(
          flex: 1,
          child: UiApi.containerRoundCorners(
              borderColor: AppColors.introColor3,
              onTap: () {
                controller.onScheduleTime();
              },
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        controller.scheduledTime.value.isEmpty
                            ? "Schedule Time"
                            : controller.scheduledTime.value,
                        style: controller.scheduledTime.value.isEmpty
                            ? AppTextStyles.subDescRegular
                            : AppTextStyles.descStyleRegular
                                .copyWith(color: AppColors.primaryGreenColor),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: UiApi.assetImage(
                        "assets/images/ic_clock.png",
                        height: AppDimens.dimen20,
                        assetColor: controller.scheduledTime.value.isEmpty
                            ? AppColors.black
                            : AppColors.primaryGreenColor,
                      ),
                    )
                  ],
                ),
              )),
        ),
      ],
    ));

    list.add(SizedBox(height: AppDimens.dimen50));

    ///Add Phone Number, Personalise message
    list.add(
      UiApi.titleView(
        title: "Schedule Date and Time",
        backgroundColor: AppColors.white,
        padding: EdgeInsets.only(bottom: AppDimens.dimen10),
      ),
    );

    list.add(
      UiApi.textArea(controller.messageTxt),
    );

    list.add(SizedBox(height: AppDimens.dimen70));
    list.add(
      UiApi.button(
        child: UiApi.buttonChild(
          asset: "assets/images/ic_market.svg",
          text: "Book Appointment",
          assetColor: AppColors.white,
          textColor: AppColors.white,
        ),
        backgroundColor: AppColors.market,
        onPressed: () {
          controller.onBookAppointmentOnClick();
        },
      ),
    );

    return list;
  }
}
