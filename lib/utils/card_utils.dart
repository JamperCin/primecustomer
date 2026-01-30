import 'package:primecustomer/data/constants/constants.dart';
import 'package:primecustomer/data/enum/PaymentStatus.dart';
import 'package:primecustomer/data/enum/PromotionType.dart';
import 'package:primecustomer/data/enum/wallet_type.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/remote/card_account.dart';
import 'package:primecustomer/data/model/remote/coordinates.dart';
import 'package:primecustomer/data/model/remote/e_fund_request_model.dart';
import 'package:primecustomer/data/model/remote/feedback_model.dart';
import 'package:primecustomer/data/model/remote/gifted_card.dart';
import 'package:primecustomer/data/model/remote/giver.dart';
import 'package:primecustomer/data/model/remote/merchant_details.dart';
import 'package:primecustomer/data/model/remote/person.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/remote/prime_card_model.dart';
import 'number_utils.dart';

class CardUtils {
  PrimeCardModel card;
  final String currency = "GHS";
  PromotionType promotionType = PromotionType.noPromo;
  int index = 0;
  RxList<PrimeCardModel> list = RxList();
  BaseObject? object;

  CardUtils(this.card) {
    promotionType = promoType(card);
  }

  void setList(RxList<PrimeCardModel> list) {
    this.list = list;
  }

  void setIndex(int index) {
    this.index = index;
  }

  CardUtils setObject(BaseObject object) {
    this.object = object;
    return this;
  }

  PrimeCardModel filterCard(List<PrimeCardModel> list, PrimeCardModel card) {
    PrimeCardModel? filteredCard;
    for (PrimeCardModel c in list) {
      if (c.id == card.id) {
        filteredCard = c;
        break;
      }
    }

    return filteredCard ??
        list.where((PrimeCardModel e) => e.id == card.id).first;
  }

  void setSelection(bool val) {
    card = card.copyWith(isAlreadySelected: val);
  }

  PromotionType promoType(PrimeCardModel primeCardModel) {
    switch (primeCardModel.promoType) {
      case "promotionDiscount":
        return PromotionType.promotionDiscount;
      case "giveBack":
        return PromotionType.giveBack;
      case "specialPromo":
        return PromotionType.specialPromo;
      default:
        return PromotionType.noPromo;
    }
  }

  ///=================== COORDINATES=====================

  Coordinates? getCoordinates() {
    return getClient().coordinates;
  }

  ///====================================================

  ///===============================MERCHANT =========================
  ///Get the details of the Merchant
  MerchantDetails getClient() {
    return card.client;
  }

  String getMerchantName({bool caps = true}) {
    return caps
        ? Utils.capitalizeLetter(
            val: getClient().name, capAllFirstLetters: true)
        : getClient().name;
  }

  String getMerchantLogo() {
    return getClient().logoUrl;
  }

  String getMerchantPhone() {
    return getClient().telephone;
  }

  bool isCoordinated() {
    if (getCoordinates() == null || getCoordinates()?.latitude == null) {
      return false;
    }
    double lat = NumberUtils.parseDouble((getCoordinates()?.latitude)!);
    return lat > 0.0;
  }

  String getLocation({String defaultVal = ""}) {
    String loc = getCoordinates()?.address ?? ''; //getClient().location;
    return loc.isEmpty ? defaultVal : loc;
  }

  String getClientContact() {
    return getClient().telephone;
  }

  String getCardBackGround() {
    String url = card.cardBackground;
    // if (url.isEmpty) {
    //   url = getClient().logoUrl;
    // }

    return url.isEmpty ? card.image : url;
  }

  static PaymentStatus getTransactionStatus({String status = ""}) {
    if (status.isEmpty) {
      return PaymentStatus.UNKNOWN;
    }

    switch (status.toUpperCase()) {
      case "PROCESSING":
        return PaymentStatus.PROCESSING;
      case "FAILED":
        return PaymentStatus.FAILED;
      case "UNPAID":
        return PaymentStatus.UNPAID;
      case "PAID":
        return PaymentStatus.PAID;
      case "INITIATED":
        return PaymentStatus.INITIATED;
      case "WAITING_CALLBACK":
        return PaymentStatus.WAITING_CALLBACK;
      default:
        return PaymentStatus.UNKNOWN;
    }
  }

  ///==================================================================

  String getHeroTag({String? alias}) {
    return "tag_"
            "${card.id}"
            "${alias ?? ""}"
            "${card.amount}"
            "${DateTimeUtils.formatDateString(card.createdAt, format: "mm:ss:SSS")}"
            "${DateTimeUtils.getCurrentDate(format: "ss:SSS")}"
        .replaceAll(" ", "")
        .replaceAll("\n", "");
  }

  ///Get the amount range supported by a merchant of a card
  String getAmountRange() {
    MerchantDetails cl = getClient();

    if (cl.maxPrice == 0 || cl.minPrice == 0) {
      return "";
    }
    if (cl.maxPrice == cl.minPrice) {
      return "${card.currency ?? currency} ${NumberUtils.moneyFormatDouble(cl.maxPrice)}";
    }

    return "${getCurrency()} ${NumberUtils.moneyFormatDouble(cl.minPrice)} - ${NumberUtils.moneyFormatDouble(cl.maxPrice)}";
  }

  String getCurrency() {
    return card.currency ?? currency;
  }

  String getCurrencyAmount(String amnt, {int dec = 0}) {
    return "${getCurrency()} ${NumberUtils.moneyFormat(amnt, decPlace: dec)}";
  }

  String getFormattedDueAmount({int dec = 0}) {
    return NumberUtils.moneyFormat(getDueAmount(), decPlace: dec);
  }

  String getCurrencyDueAmount({int dec = 0}) {
    return "${getCurrency()} ${getFormattedDueAmount(dec: dec)}";
  }

  double getCardDiscountAmount() {
    double discount =
        getCardActualAmount() - NumberUtils.parseDouble(getDueAmount());
    discount = discount < 0 ? 0.0 : discount;
    return discount;
  }

  String getFormattedCardDiscountAmount({int dec = 0}) {
    return NumberUtils.moneyFormatDouble(getCardDiscountAmount(),
        decPlace: dec);
  }

  String getFormattedCardDiscount({int dec = 0}) {
    return "${getCurrency()} ${NumberUtils.moneyFormatDouble(getCardDiscountAmount(), decPlace: dec)}";
  }

  double getCardActualAmount() {
    return NumberUtils.parseDouble(card.amount);
  }

  String getFormattedCardActualAmount({int dec = 0}) {
    return NumberUtils.moneyFormat(card.amount, decPlace: dec);
  }

  String getCurrencyCardActualAmount({int dec = 0}) {
    return "${getCurrency()} ${getFormattedCardActualAmount(dec: dec)}";
  }

  String getFormattedCardAccountBalance({int dec = 0}) {
    return "${getCurrency()} ${NumberUtils.moneyFormat(cardAccountBalance(), decPlace: dec)}";
  }

  String getFormattedAccountBalance({int dec = 0}) {
    if (object != null && object is CardAccount) {
      CardAccount account = object as CardAccount;
      return "${getCurrency()} ${NumberUtils.moneyFormat(account.currentBalance, decPlace: dec)}";
    }

    if (object != null && object is GiftedCard) {
      GiftedCard gift = object as GiftedCard;
      return "${getCurrency()} ${NumberUtils.moneyFormat(gift.account.currentBalance, decPlace: dec)}";
    }

    //todo if (object != null && object is EfundRequestModel) {
    //   EfundRequestModel eFund = object as EfundRequestModel;
    //   return "${getCurrency()} ${NumberUtils.moneyFormat(eFund.cardAccount.currentBalance, decPlace: dec)}";
    // }

    return "${getCurrency()} ${NumberUtils.moneyFormat("0.00", decPlace: dec)}";
  }

  String getDueAmount() {
    if (!card.isPromotion) {
      return card.amount;
    }
    switch (promotionType) {
      case PromotionType.promotionDiscount:
        return card.promoValue;
      case PromotionType.giveBack:
        return card.amount;
      case PromotionType.specialPromo:
        return card.amount;
      case PromotionType.noPromo:
        return card.amount;
    }
  }

  String getCardTitle({String defVal = ""}) {
    String title = "";
    switch (promotionType) {
      case PromotionType.promotionDiscount:
        title = card.promotionTitle.isEmpty ? card.title : card.promotionTitle;
        return title.isEmpty ? defVal : title.trim();
      case PromotionType.giveBack:
        title = card.promotionTitle.isEmpty
            ? getClient().name
            : card.promotionTitle;
        return title.isEmpty ? defVal : title.trim();
      case PromotionType.specialPromo:
        title = card.promotionTitle.isEmpty
            ? "${card.title}\n${card.promoValue}"
            : "${card.promotionTitle}\n${card.promoValue}";
        return title.isEmpty ? defVal : title.trim();
      case PromotionType.noPromo:
        title = card.title.isEmpty ? getClient().name : card.title;
        return title.isEmpty ? defVal : title.trim();
      }
  }

  String getCardDescription() {
    String des = card.description;
    if (des.isNotEmpty) {
      des = card.promoDescription.isNotEmpty
          ? (des + "\n" + card.promoDescription)
          : des;
    } else {
      des = card.promoDescription;
    }

    return des;
  }

  String getCardAccountCreatedAt() {
    String date = "";
    if (object is CardAccount) {
      date = (object as CardAccount).purchasedAt;
    } else if (object is EfundRequestModel) {
      date = (object as EfundRequestModel).createdAt;
    } else if (isGiftedCard()) {
      GiftedCard gift = object as GiftedCard;
      date = gift.scheduledDate.isNotEmpty
          ? gift.scheduledDate
          : gift.account.purchasedAt;
    }
    return date.isNotEmpty ? date : card.createdAt;
  }

  String accountDate({String? format}) {
    return DateTimeUtils.formatDateString(getCardAccountCreatedAt(),
        format: format ?? "dd");
  }

  ///Check if the card is a new card created by merchant
  bool isNewCard() {
    int daysDiff = DateTimeUtils.getDateTimeDifference(date: card.createdAt);
    return daysDiff <= Constants.NEW_CARD && daysDiff != 0;
  }

  bool isExhaustedCard({BaseObject? baseObject}) {
    object = object ?? baseObject;
    if (object != null) {
      String status = "";
      if (object is CardAccount) {
        CardAccount account = object as CardAccount;
        status = account.accountStatus.replaceAll("_", " ").toUpperCase();
      } else if (isGiftedCard()) {
        GiftedCard gift = object as GiftedCard;
        CardAccount account = gift.account;
        status = account.accountStatus.replaceAll("_", " ").toUpperCase();
      }
      //todo } else if (object is EfundRequestModel) {
      //   CardAccount account = (object as EfundRequestModel).cardAccount;
      //   status = account.accountStatus.replaceAll("_", " ").toUpperCase();
      // }
      switch (status) {
        case "UNUSED":
          return false;
        case "REDEEMED":
          return true;
        case "PARTIALY USED":
          return false;
        case "CASHED OUT":
          return true;
        default:
          return false;
      }
    } else {
      return false;
    }
  }

  String getAccountStatus() {
    if (object is CardAccount) {
      CardAccount account = object as CardAccount;
      return account.accountStatus.replaceAll("_", " ").toUpperCase();
    }

    //todo if (object is EfundRequestModel) {
    //   CardAccount account = (object as EfundRequestModel).cardAccount;
    //   return (account.accountStatus.isEmpty ? "UNKNOWN" : account.accountStatus)
    //       .replaceAll("_", " ")
    //       .toUpperCase();
    // }

    if (isGiftedCard()) {
      GiftedCard gift = object as GiftedCard;
      CardAccount account = gift.account;
      return account.accountStatus.replaceAll("_", " ").toUpperCase();
    }
    return "UNKNOWN";
  }

  Color accountStatusColor() {
    switch (getAccountStatus()) {
      case "UNUSED":
        return AppColors.primaryGreenColor;
      case "REDEEMED":
        return AppColors.redLight;
      case "PARTIALY USED":
        return AppColors.kYellowDeepColor;
      case "CASHED OUT":
        return AppColors.kSkyBlueColor;
      default:
        return AppColors.primaryGreenColor;
    }
  }

  static Color getRedemptionStatusColor(String status) {
    switch (status.toUpperCase()) {
      case "PROCESSING":
        return AppColors.kYellowDeepColor;
      case "INITIATED":
        return AppColors.kYellowDeepColor;
      case "WAITING_CALLBACK":
        return AppColors.kYellowDeepColor;
      case "FAILED":
        return AppColors.red;
      case "UNPAID":
        return AppColors.orange;
      case "PAID":
        return AppColors.primaryGreenColor;
      default:
        return AppColors.nearlyDarkBlue;
    }
  }

  static Color getEFundStatusColor(String status) {
    switch (status) {
      case "partial-Funded":
        return AppColors.kYellowDeepColor;
      case "not-Funded":
        return AppColors.orange;
      case "fully-Funded":
        return AppColors.primaryGreenColor;
      default:
        return AppColors.nearlyDarkBlue;
    }
  }

  bool isGiftedCard() {
    return object != null && object is GiftedCard;
  }

  String emojiFeedback() {
    if (getCardFeedback() != null) {
      String? emoji = getCardFeedback()?.emoji;
      if (emoji != null) {
        List<String> arr = emoji.split("-");
        if (arr.isNotEmpty) {
          emoji = arr[0];
        }
      }

      return emoji ?? "😊";
    }
    return "😊";
  }

  FeedbackModel? getCardFeedback() {
    return giftedCard().feedback;
  }

  String giftTypeText(WalletType? type) {
    if (type == null) {
      return "";
    }

    switch (type) {
      case WalletType.GIFTED_IN:
        return "From: ";
      case WalletType.GIFTED_OUT:
        return "To: ";
      case WalletType.PURCHASED:
        return "From: ";
      case WalletType.E_FUND:
       return "E-Fund: ";
    }
  }

  Giver giver() {
    return giftedCard().giver;
  }

  Giver recipient() {
    return giftedCard().recipient;
  }

  GiftedCard giftedCard() {
    if (object != null) {
      return object as GiftedCard;
    }
    return const GiftedCard();
  }

  CardAccount cardAccount() {
    if (object != null) {
      return object as CardAccount;
    }
    return const CardAccount();
  }

  ///Get the actual purchase code of a gift card
  ///An example is like [4683650285480147]
  String getPurchasedCode() {
    String code = "";
    if (isGiftedCard()) {
      code = giftedCard().account.purchaseCode;
    } else {
      code = cardAccount().purchaseCode;
    }
    return code;
  }

  ///Get a display of the purchased code with spaces between every 4 digit
  ///An example is like : [3455 7890 2009 3105]
  String getDisplayPurchasedCode() {
    String code = getPurchasedCode();
    String displayCode = "";
    try {
      for (int i = 1; i <= code.length; i++) {
        displayCode = displayCode + code.substring(i - 1, i);
        if (i % 4 == 0) {
          displayCode = displayCode + " ";
        }
      }
    } catch (e) {
      return displayCode;
    }
    return displayCode;
  }

  ///Get a masked purchased code
  ///An example is [************3509]
  String getMaskedPurchasedCode() {
    String code = getPurchasedCode();
    int length = code.length;
    String mask = "";
    if (length > 4) {
      for (int i = 0; i < length - 4; i++) {
        mask = mask + "*";
      }
      return mask + code.substring(length - 4, length);
    }
    return code;
  }

  Person giftPerson({WalletType? type}) {
    if (isGiftedCard()) {
      if (type != null && type == WalletType.GIFTED_IN) {
        Person person = giftedCard().giver.person ?? const Person();
        return person;
      }

      if (type != null && type == WalletType.GIFTED_OUT) {
        Person person = giftedCard().recipient.person ?? const Person();
        return person;
      }
    }
    return const Person();
  }

  String getRecipientPicture() {
    return recipient().person?.profilePicUrl ?? "";
  }

  String getGiverPicture() {
    return giver().person?.profilePicUrl ?? "";
  }

  String giftPersonName({WalletType? type}) {
    if (isGiftedCard()) {
      Person person = giftPerson(type: type);
      return "${person.firstName} ${person.surname}";
    }
    return "";
  }

  String giftPersonProfilePic({WalletType? type}) {
    if (isGiftedCard()) {
      Person person = giftPerson(type: type);
      return person.profilePicUrl;
    }
    return "";
  }

  String giftPersonPhone({WalletType? type}) {
    if (isGiftedCard()) {
      if (type != null && type == WalletType.GIFTED_IN) {
        return giver().phone;
      }

      if (type != null && type == WalletType.GIFTED_OUT) {
        return recipient().phone;
      }
    }
    return "";
  }

  String giftPersonPicture({WalletType? type}) {
    if (isGiftedCard()) {
      if (type != null && type == WalletType.GIFTED_IN) {
        Person person = giftedCard().giver.person ?? const Person();
        return person.profilePicUrl;
      }

      if (type != null && type == WalletType.GIFTED_OUT) {
        Person person = giftedCard().recipient.person ?? const Person();
        return person.profilePicUrl;
      }
    }
    return "";
  }

  String cardAccountBalance() {
    String amount = "";
    if (isGiftedCard()) {
      amount = giftedCard().account.currentBalance;
    } else {
      amount = cardAccount().currentBalance;
    }
    return amount;
  }

  ///===========================================================================
}
