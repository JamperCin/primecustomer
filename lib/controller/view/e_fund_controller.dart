import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/data/model/local/success_model.dart';
import 'package:primecustomer/res/api/contacts_api.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/dashboard/bottom_bar_screens/cart/efund/request_funds_screen.dart';
import 'package:primecustomer/utils/date_time_utils.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/model/contact.dart';
import 'package:get/get.dart';

class EFundController extends BaseController {
  ///List of contacts
  RxList<Contact> contacts = RxList<Contact>();
  List<String> phoneList = [];

  CardController? cardController;
  CardModel? cardModel;

  RxString scheduledDate = "".obs;
  RxString scheduledTime = "".obs;

  TextEditingController messageTxt = TextEditingController();

  void onProceedToAddContact() {}

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    cardController = CardController(webService!);
  }

  void onAddContact() {
    if (contacts.length < 10) {
      ContactsApi().pickContact((phone) {
        if (!isContactAlreadySelected(phone)) {
          contacts.add(phone);
          addToPhoneList(phone);
        } else {
          SnackBarApi.snackBarInfo("Contact already selected.");
        }
      });
    } else {
      SnackBarApi.snackBarInfo("You can only add up to 10 contacts");
    }
  }

  void addToPhoneList(Contact phone, {bool delete = false}) {
    String tel = phone.selectedPhoneNumber ?? "";
    if (tel.isEmpty) {
      return;
    }

    if (delete) {
      phoneList.remove(NumberUtils.cleanPhoneNumber(tel));
      return;
    }

    phoneList.add(NumberUtils.cleanPhoneNumber(tel));
  }

  bool isContactAlreadySelected(phone) {
    return contacts.contains(phone);
  }

  void clearContacts() {
    contacts.clear();
  }

  void onDeletePhone(Contact p, {bool goBack = false}) {
    contacts.remove(p);
    addToPhoneList(p, delete: true);
    if (goBack && contacts.isEmpty) {
      NavApi.fireBack();
    }
  }

  void onNextOnClick(CardModel cardModel) {
    this.cardModel = cardModel;
    if (contacts.isEmpty) {
      SnackBarApi.snackBarInfo(
          "Please select at least one contact to fund your gift cards.");
      return;
    }
    NavApi.fireTarget(RequestFundsScreen(), model: cardModel);
  }

  void onScheduleDate() {
    DateTimeUtils.pickDate(mContext!, call: (val) {
      scheduledDate.value = val;
    });
  }

  void onScheduleTime() {
    DateTimeUtils.pickTime(mContext!, call: (val) {
      scheduledTime.value = val;
    });
  }

  void confirmEfundRequest() {
    UiApi.showConfirmDialog(
      title: "Confirm Fund Request",
      assetSize: SizeConfig.screenWidth * 0.3,
      titleStyle: AppTextStyles.titleStyleBold,
      messageWidget: Center(
        child: UiApi.richText(
          textAlign: TextAlign.center,
          maxLines: 3,
          mod: [
            RichTextModel(
                text: "Confirm fund request of gift card(s) \nworth "),
            RichTextModel(
              text: "${CardController.cartTotalAmount.value} ",
              style: AppTextStyles.titleStyleBold
                  .copyWith(color: AppColors.primaryGreenColor),
              monitize: true,
            ),
            RichTextModel(text: " to the selected contact(s)?"),
          ],
        ),
      ),
      callBack: () {
        initRequest();
      },
    );
  }

  ///Get a redirect URL form Global Pay to continue with payment
  void initRequest() {
    HashMap<String, Object> params = HashMap();
    params.putIfAbsent("cart_id", () => "${cardModel?.cart?.cartId ?? 0}");
    params.putIfAbsent("potential_funders", () => phoneList);

    if (messageTxt.text.isNotEmpty) {
      params.putIfAbsent("message", () => messageTxt.text.trim());
    }

    if (scheduledDate.isNotEmpty) {
      params.putIfAbsent("scheduled_date",
          () => DateTimeUtils.dateTime("$scheduledDate $scheduledTime"));
    }

    webService?.sendCardsForEFund(params, (response) {
      if (response.success) {
        NavApi.fireSuccess(SuccessModel.eFund(
          NumberUtils.getCurrencyAmount(
            "${cardModel?.cart?.totalAmount ?? 0.0}",
            dec: 2,
          ),
        ));
      } else {
        cardController?.handleError(
            mess: response.error, cartID: cardModel?.cart?.cartId ?? 0);
      }
    });
  }

  ///Lets load this from an api
  void selectMessage() {
    DialogsApi.showBottomSheet(
      padding: EdgeInsets.only(
          left: AppDimens.dimen10,
          right: AppDimens.dimen10,
          top: AppDimens.dimen20),
      containerSize: AppDimens.dimen500,
      mainChild: UiApi.listView(
        list: messageList(),
        padding: EdgeInsets.zero,
      ),
    );
  }

  List<Widget> messageList() {
    List<Widget> list = [];

    list.add(Center(
        child: Text("Select Message", style: AppTextStyles.descStyleBold)));
    list.add(SizedBox(height: AppDimens.dimen20));

    list.add(UiApi.messageItem());
    list.add(UiApi.messageItem());
    list.add(UiApi.messageItem());
    list.add(UiApi.messageItem());
    list.add(UiApi.messageItem());
    list.add(UiApi.messageItem());
    list.add(UiApi.messageItem());
    list.add(UiApi.messageItem());

    return list;
  }

  void resetFundRequest() {
    contacts.clear();
    messageTxt.text = "";
    scheduledDate.value = "";
    scheduledTime.value = "";
  }
}
