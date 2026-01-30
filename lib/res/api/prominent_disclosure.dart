import 'package:primecustomer/data/constants/pref_constants.dart';
import 'package:primecustomer/data/model/local/DisclosureModel.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/prominent_disclosure.dart';
import 'package:get/get.dart';

import '../../main.dart';

class ProminentDisclosureApi {
  static ProminentDisclosureApi? _instance;

  ProminentDisclosureApi._internal();

  factory ProminentDisclosureApi() {
    return _instance ?? ProminentDisclosureApi._internal();
  }

  void _showDisclosure(DisclosureModel model) {
    DialogsApi.popUpNormalDialog(
      Get.context!,
      title: model.title,
      asset: model.asset,
      child: UiApi.disclosureWidget(model),
    );
  }

  ///Show the contacts prominent disclosure dialog to consent to
  ///(agree or disagree) to allow app access his/her contacts list
  void showContactsDisclosure({Function(bool)? onAccept}) {
    bool accept = prefUtils.getBool(PrefConstants.CONTACT_PERMISSION_ALLOWED);
    if (accept) {
      if (onAccept != null) onAccept(accept);
      return;
    }

    DisclosureModel model = DisclosureModel(
        title: "Contact Permission Needed",
        message:
            "This app will require you to upload a contact when purchasing a gift card for someone. Prime needs this contact to "
            "create the ownership of the gift card by assigning the gift card to the phone number. "
            "\n\nDetails of the purchased gift card will be sent to the contact via SMS."
            "\n\nYou can enable this permission later when you need to use that feature since this is not a compulsory feature.",
        asset: "assets/images/ic_contacts.png",
        onAccepted: (accepted) {
          if (onAccept != null) {
            onAccept(accepted);
          }
        });

    _showDisclosure(model);
  }

  void printText() {
    print("Prominent disclosure");
  }

  void showLocationDisclosure({Function(bool)? onAccept}) {
    bool accept = prefUtils.getBool(PrefConstants.LOCATION_PERMISSION_ALLOWED);
    if (accept) {
      if (onAccept != null) onAccept(accept);
      return;
    }

    DisclosureModel model = DisclosureModel(
        title: "Location Permission needed",
        asset: "assets/images/ic_location.png",
        richText: [
          RichTextModel(text: "This permission will allow "),
          RichTextModel(
              text: "Prime E-Gift ", style: AppTextStyles.descStyleBold),
          RichTextModel(
              text:
                  " app to find your current location in order to find or suggest nearby merchants to you."),
          RichTextModel(
              text:
                  " Merchants closer to you will be automatically suggested "),
          RichTextModel(
              text: "to you when using the nearby merchants feature. "),
          RichTextModel(text: "\n\nIf you don't feel comfortable with this, "),
          RichTextModel(
              text:
                  "you can ignore since it's not compulsory to use this feature."),
        ],
        onAccepted: (accepted) {
          if (onAccept != null) {
            onAccept(accepted);
          }
        });

    _showDisclosure(model);
  }
}
