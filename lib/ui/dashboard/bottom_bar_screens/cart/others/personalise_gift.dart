import 'package:core_module/core/def/global_def.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/controller/view/personalise_controller.dart';
import 'package:primecustomer/data/enum/guest_staging.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../../main.dart';

class PersonaliseGift extends BaseScreenStandard {
  final PersonaliseController controller = Get.put(PersonaliseController());

  PersonaliseGift() {
    controller.clear();
  }

  @override
  String appBarTitle() {
    return "Personalise Your Gift Card";
  }

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    controller.setContext(context);
  }

  @override
  CardModel getModel() {
    return baseObject as CardModel;
  }

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        UiApi.listView(context: context, list: listView()),
        guestUserInfoWidget(context),
      ],
    );
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
                      decoration: UiApi.deco(borderRadius: 10, opacity: .2),
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
            subTitle: SizedBox(
              height: AppDimens.dimen25,
              /* todo Fetch from api,
                child: FloatingActionButton(
                heroTag: "_favorite",
                backgroundColor: AppColors.kGreyWhite.withOpacity(.8),
                child: Icon(Icons.favorite,
                    color: AppColors.red, size: AppDimens.dimen10),
                onPressed: () {
                  controller.selectMessage();
                },
              ),*/
            ),
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
                          ? "Date"
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
                      assetColor: controller.scheduledDate.value.isEmpty
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
                            ? "Time"
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

    // list.add(SizedBox(height: AppDimens.dimen20));
    list.add(primeWalletWidget());
    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(
      Padding(
        padding: EdgeInsets.only(
          left: AppDimens.dimen24,
          right: AppDimens.dimen24,
          top: AppDimens.dimen24,
        ),
        child: UiApi.button(
          text: "Make Payment",
          onPressed: () {
            controller.confirmPayment(getModel());
          },
        ),
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen40));
    return list;
  }

  Widget primeWalletWidget() {
    return isGuestUser.value
        ? const SizedBox()
        : Column(children: [
            SizedBox(height: AppDimens.dimen30),
            UiApi.infoText(
              "Make payment using your Prime Wallet or proceed to use other payment channels.",
            ),
            SizedBox(height: AppDimens.dimen10),
            UiApi.primeWallet(
                amount: CardController.cartTotalAmount.value,
                onTap: () {
                  controller.confirmPayment(getModel(), payFromWallet: true);
                }),
            SizedBox(height: AppDimens.dimen10),
            Text("OR", style: AppTextStyles.h5StyleSemiBold),
          ]);
  }

  Widget guestUserInfoWidget(BuildContext context) {
    return Obx(
      () => SlidingUpPanel(
        color: AppColors.background,
        minHeight: controller.minHeightGuestInfo.value,
        controller: controller.panelController,
        margin:
            EdgeInsets.only(right: AppDimens.dimen10, left: AppDimens.dimen10),
        padding: EdgeInsets.all(AppDimens.dimen16),
        // maxHeight: SizeConfig.screenHeight * 0.65,
        panel: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: AppDimens.dimen5,
                width: AppDimens.dimen70,
                decoration: UiApi.deco(
                  color: AppColors.general(0XFFd7d6da),
                  borderColor: AppColors.general(0XFFd7d6da),
                  opacity: 0,
                ),
              ),
              (guestStage.value != GuestStage.success) &&
                      (guestStage.value != GuestStage.hasAccountAlready)
                  ? Column(
                      children: [
                        SizedBox(height: AppDimens.dimen20),
                        Text(
                          controller.guestHeader.value,
                          style: AppTextStyles.descStyleBold,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppDimens.dimen20),
                        UiApi.assetImage(
                          "assets/images/prime_logo_new.png",
                          height: AppDimens.dimen80,
                          width: AppDimens.dimen80,
                        ),
                      ],
                    )
                  : const SizedBox(),
              SizedBox(height: AppDimens.dimen30),
              baseWidget(),
            ],
          ),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        backdropEnabled: true,
        backdropTapClosesPanel: true,
      ),
    );
  }

  Widget baseWidget() {
    switch (guestStage.value) {
      case GuestStage.verifyPhone:
        return verifyPhone();
      case GuestStage.init:
        return verifyPhone();
      case GuestStage.verifyOtp:
        return verifyOtp();
      case GuestStage.hasAccountAlready:
        return hasAccountAlready();
      case GuestStage.success:
        return successGuestSignUp();
      case GuestStage.loading:
        return UiApi.circularProgressBar(radius: AppDimens.dimen80);
      case GuestStage.payment:
        return const SizedBox();
    }
  }

  Widget verifyPhone() {
    return Column(
      children: [
        Text(
          "Enter Your Phone Number to receive a 4-digit PIN for verification",
          style: AppTextStyles.descStyleLight,
        ),
        SizedBox(height: AppDimens.dimen10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: UiApi.textFormField(
                enabled: false,
                hintText: '+233',
                controller: controller.guestCountryCodeTxt,
                onTap: () {
                  controller.onGuestPickCountryCode();
                },
              ),
              flex: 1,
            ),
            SizedBox(width: AppDimens.dimen10),
            Flexible(
              child: UiApi.textFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  hintText: 'Phone Number',
                  controller: controller.guestUserPhoneTxt,
                  focusColor: controller.isGuestPhoneNumberValid.value
                      ? null
                      : AppColors.red,
                  onChanged: (value) {
                    controller.liveValidateGuestPhoneNum();
                  }),
              flex: 3,
            ),
          ],
        ),
        SizedBox(height: AppDimens.dimen5),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            controller.validGuestPhoneString.value,
            style: AppTextStyles.style(
              style: AppTextStyles.smallerSubDescStyleRegular,
              color: controller.isGuestPhoneNumberValid.value
                  ? AppColors.primaryGreenColor
                  : AppColors.red,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(height: AppDimens.dimen40),
        UiApi.button(
          text: "Submit",
          backgroundColor: controller.isGuestPhoneNumberValid.value
              ? AppColors.primaryGreenColor
              : AppColors.textGrey,
          borderColor: controller.isGuestPhoneNumberValid.value
              ? AppColors.primaryGreenColor
              : AppColors.textGrey,
          onPressed: () {
            controller.submitGuestPhoneForVerification();
          },
        ),
      ],
    );
  }

  Widget verifyOtp() {
    return Column(
      children: [
        Text(
          "Enter the 4-digit code sent to your phone number.",
          style: AppTextStyles.descStyleSemiBold,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppDimens.dimen40),
        UiApi.pinTextField(controller.guestUserOtpCode,
            codeLength: 4, observable: false, call: (code) {
          dismissKeyBoard(mContext!);
          controller.submitOtpForVerification();
        }),
        SizedBox(height: AppDimens.dimen40),
        controller.timer.value.isEmpty
            ? UiApi.textButton(
                leadingText: "Didn't get the code?",
                trailingText: "Resend Code",
                onTap: () {
                  controller.guestUserOtpCode.value = "";
                  controller.submitGuestPhoneForVerification();
                },
              )
            : const SizedBox(),
        SizedBox(height: AppDimens.dimen20),
        controller.timer.value.isNotEmpty
            ? UiApi.textButton(
                leadingText: "You can request for a new code in",
                trailingTextColor: AppColors.primaryGreenColor,
                leadingStyle: AppTextStyles.subDescStyleLight,
                trailingText: controller.timer.value,
              )
            : const SizedBox(),
      ],
    );
  }

  Widget successGuestSignUp() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: AppDimens.dimen5),
        UiApi.assetImage("assets/images/ic_tick.png"),
        SizedBox(height: AppDimens.dimen20),
        Text(
          "Congratulations !!!",
          style: AppTextStyles.h3StyleBold,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppDimens.dimen40),
        UiApi.richText(
          maxLines: 6,
          textAlign: TextAlign.center,
          style: AppTextStyles.descStyleLight
              .copyWith(letterSpacing: .5, wordSpacing: 2.0, height: 1.5),
          mod: [
            RichTextModel(text: "An account has been created for "),
            RichTextModel(
              text: controller.formattedGuestPhoneNumber,
              style: AppTextStyles.descStyleBold,
            ),
            RichTextModel(text: ". \nNB:The "),
            RichTextModel(
              text:
                  "4-digit verification code sent via SMS to your phone for verification will be your PIN for subsequent logins.",
              style: AppTextStyles.descStyleBold,
            ),
            RichTextModel(text: "Feel free to reset your PIN using the "),
            RichTextModel(
              text: "reset PIN ",
              style: AppTextStyles.descStyleBold,
            ),
            RichTextModel(text: "feature."),
          ],
        ),
        SizedBox(height: AppDimens.dimen20),
        UiApi.circularProgressIndicator(radius: AppDimens.dimen16),
        SizedBox(height: AppDimens.dimen20),
      ],
    );
  }

  Widget hasAccountAlready() {
    List<Widget> list = [];
    list.add(Text(
      "There is an account already with phone number ${controller.formattedGuestPhoneNumber}",
      style: AppTextStyles.descStyleBold,
      textAlign: TextAlign.center,
    ));
    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(UiApi.pinEntryWidget(4, controller.pos));
    list.add(SizedBox(height: AppDimens.dimen5));
    list.add(Text(
      "Verify your Passcode/Pin to proceed with payment",
      style: AppTextStyles.subDescStyleLight,
    ));
    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(UiApi.pinNumberWidget(["1", "2", "3"], onTap: (val) {
      controller.onPinClicked(val);
    }));
    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(UiApi.pinNumberWidget(["4", "5", "6"], onTap: (val) {
      controller.onPinClicked(val);
    }));

    list.add(SizedBox(height: AppDimens.dimen20));
    list.add(UiApi.pinNumberWidget(["7", "8", "9"], onTap: (val) {
      controller.onPinClicked(val);
    }));

    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(UiApi.pinNumberWidget(["", "0", delete()], onTap: (val) {
      controller.onPinClicked(val);
    }));

    return Column(children: list);
  }

  Widget delete() {
    return UiApi.delPinWidget(onTap: () {
      controller.onDeleteOnClick();
    });
  }
}
