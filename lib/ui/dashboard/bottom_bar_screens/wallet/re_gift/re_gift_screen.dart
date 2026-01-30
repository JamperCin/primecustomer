import 'package:primecustomer/controller/view/re_gift_controller.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/card_account.dart';
import 'package:primecustomer/data/model/remote/gifted_card.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../res/app/app_colors.dart';
import '../../../../../res/app/app_dimens.dart';
import '../../../../../res/app/app_text_styles.dart';

class ReGiftCardScreen extends BaseScreenStandard {
  final ReGiftController controller = Get.put(ReGiftController());

  @override
  String appBarTitle() {
    return "Re-Gift Card";
  }

  @override
  BaseObject getModel() {
    if (baseObject is CardAccount) {
      CardAccount account = baseObject as CardAccount;
      controller.cardUtils = CardUtils(account.card).setObject(baseObject);
      controller.accountId = account.accountId;
      return account;
    }

    if (baseObject is GiftedCard) {
      GiftedCard gift = baseObject as GiftedCard;
      controller.cardUtils = CardUtils(gift.account.card).setObject(baseObject);
      controller.accountId = gift.account.accountId;
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
  Widget body(BuildContext context) {
    return UiApi.listView(context: context, list: listView());
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    ///Add the top image and name Tag for contact
    /* list.add(Obx(
      () => AspectRatio(
        aspectRatio: controller.contact.value.isNotEmpty ? 2.7 : 4,
        child: Stack(
          children: [
            controller.contact.value.isNotEmpty
                ? Positioned(
                    top: AppDimens.dimen30,
                    right: AppDimens.dimen5,
                    left: AppDimens.dimen5,
                    child: Container(
                      decoration: UiApi.deco(radius: 10, opacity: .2),
                      width: SizeConfig.screenWidth,
                      padding: EdgeInsets.only(
                        top: AppDimens.dimen30,
                        bottom: AppDimens.dimen10,
                        left: AppDimens.dimen10,
                        right: AppDimens.dimen10,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              UiApi.circleEmpty(
                                  borderColor: AppColors.primaryGreenColor,
                                  backGroundColor: AppColors.primaryGreenColor,
                                  margin: EdgeInsets.zero,
                                  size: AppDimens.dimen30,
                                  opacity: 1,
                                  child: Text(
                                    controller.contact.value.substring(0, 1),
                                    style: AppTextStyles.descStyleMedium
                                        .copyWith(color: AppColors.white),
                                  )),
                              SizedBox(width: AppDimens.dimen10),
                              Flexible(
                                child: UiApi.richText(
                                  mod: [
                                    RichTextModel(
                                      text: controller.contact.value,
                                    )
                                  ],
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
            Align(
              alignment: Alignment.topCenter,
              child: UiApi.circleEmpty(
                borderColor: AppColors.teal,
                backGroundColor: AppColors.teal,
                margin: EdgeInsets.zero,
                size: AppDimens.dimen60,
                opacity: 1,
                child: UiApi.circleImageView(
                    asset: "assets/images/ic_avartar.png"),
              ),
            )
          ],
        ),
      ),
    ));*/

    ///Add Phone Number, Personalise message
    list.add(
      Column(
        children: [
          SizedBox(height: AppDimens.dimen10),
          UiApi.titleView(
            title: "Enter Recipient phone Number",
            backgroundColor: AppColors.white,
            padding: EdgeInsets.only(bottom: AppDimens.dimen10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: UiApi.textFormField(
                  enabled: false,
                  hintText: '+233',
                  controller: controller.countryCodeTxt,
                  onTap: () {
                    controller.onPickCountryCode();
                  },
                ),
                flex: 1,
              ),
              SizedBox(width: AppDimens.dimen10),
              Flexible(
                child: Obx(
                  () => UiApi.textFormField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      hintText: 'Phone Number',
                      controller: controller.phoneTxt,
                      focusColor: controller.isPhoneNumberValid.value
                          ? null
                          : AppColors.red,
                      onChanged: (value) {
                        controller.liveValidatePhoneNum();
                      }),
                ),
                flex: 3,
              ),
              SizedBox(width: AppDimens.dimen10),
              Flexible(
                flex: 0,
                child: InkWell(
                  onTap: () {
                    controller.pickContact();
                  },
                  child: Icon(
                    Icons.contact_phone_outlined,
                    size: AppDimens.dimen25,
                    color: AppColors.primaryGreenColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: AppDimens.dimen10),
          Obx(
            () => Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    controller.validPhoneString.value,
                    style: AppTextStyles.style(
                      style: AppTextStyles.smallestSubDescStyleRegular,
                      color: controller.isPhoneNumberValid.value
                          ? AppColors.primaryGreenColor
                          : AppColors.red,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(width: AppDimens.dimen35),
                ],
              ),
            ),
          ),
          SizedBox(height: AppDimens.dimen20),
          UiApi.titleView(
            title: "Personalised Message",
            backgroundColor: AppColors.white,
            padding: EdgeInsets.only(bottom: AppDimens.dimen10),
            subTitle: const SizedBox()
            /*FloatingActionButton(
                heroTag: "_favorite",
                backgroundColor: AppColors.kGreyWhite.withOpacity(.8),
                child: Icon(Icons.message_outlined,
                    color: AppColors.introColor2, size: AppDimens.dimen16),
                onPressed: () {
                  controller.selectMessage();
                },
              ),*/
            ,
          ),
          UiApi.textArea(controller.messageTxt),
          SizedBox(height: AppDimens.dimen20),
        ],
      ),
    );

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
                          ? AppColors.primaryGreenColor
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
                            ? AppColors.primaryGreenColor
                            : AppColors.primaryGreenColor,
                      ),
                    )
                  ],
                ),
              )),
        ),
      ],
    ));

    list.add(SizedBox(height: AppDimens.dimen40));
    list.add(
      Padding(
        padding: EdgeInsets.only(
          left: AppDimens.dimen24,
          right: AppDimens.dimen24,
          top: AppDimens.dimen24,
        ),
        child: UiApi.button(
          text: "Submit",
          onPressed: () {
            controller.confirmReGiftCard();
          },
        ),
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen40));
    return list;
  }
}
