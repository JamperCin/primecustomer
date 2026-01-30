import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/controller/view/personalise_controller.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/data/model/local/success_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:primecustomer/utils/date_time_utils.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/material.dart';

class ReGiftController extends PersonaliseController {
  CardUtils? cardUtils;
  int accountId = 0;

  void confirmReGiftCard() {
    if (isValid()) {
      NumberUtils.formatPhone(phoneTxt.text, countryModel.codeName, (phone) {
        formattedPhoneNumber = phone;
        showConfirmDialog();
      });
    }
  }

  void showConfirmDialog() {
    UiApi.showConfirmDialog(
      title: "Confirm Re-Gifting Card",
      assetSize: SizeConfig.screenWidth * 0.2,
      titleStyle: AppTextStyles.titleStyleBold,
      messageWidget: Center(
        child: UiApi.richText(
          textAlign: TextAlign.center,
          maxLines: 3,
          mod: [
            RichTextModel(
                text: "Are you sure you want to re-gift a card \nworth "),
            RichTextModel(
              text: "${cardUtils?.getFormattedAccountBalance(dec: 2)}",
              style: AppTextStyles.descStyleBold,
            ),
            RichTextModel(text: " to Phone Number "),
            RichTextModel(
              text: formattedPhoneNumber,
              style: AppTextStyles.descStyleBold,
            ),
          ],
        ),
      ),
      callBack: () {
        initReGiftCardRequest();
      },
    );
  }

  void initReGiftCardRequest() {
    CardController(webService!).reGiftCard(
      accountId: accountId,
      telephone: NumberUtils.cleanPhoneNumber(formattedPhoneNumber),
      message: getStringData(messageTxt),
      dateTime: scheduledDate.value.isNotEmpty
          ? DateTimeUtils.dateTime("$scheduledDate $scheduledTime")
          : "",
      call: () {
        NavApi.fireSuccess(SuccessModel.reGift());
      },
    );
  }
}
