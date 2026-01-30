import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';

class FaqScreen extends BaseScreenStandard {
  @override
  String appBarTitle() {
    return "FAQs";
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(list: listView());
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(Column(
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              letterSpacing: .3,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "WHAT IS AN E-GIFT CARD?\n",
                style: AppTextStyles.getStyle(
                    AppTextStyles.descStyleBold, AppColors.primaryGreenColor),
              ),
              TextSpan(
                text:
                    "eGift cards or digital gift cards are similar to regular gift cards; however, they're 100% digital. "
                    "An eGift card is delivered to the recipient instantly via Prime app, text message or email with a unique code, "
                    "so there's no shipping cost and can never be lost or stolen. "
                    "eGift cards can be redeemed in-store at participating merchants by presenting them on a smartphone via QR Code.",
                style: AppTextStyles.descStyleLight,
              ),

              ///next one
              TextSpan(
                text: "\n\nWHAT IS PRIME?\n",
                style: AppTextStyles.getStyle(
                    AppTextStyles.descStyleBold, AppColors.primaryGreenColor),
              ),
              TextSpan(
                text:
                    "Prime is an eGift card platform for local businesses allowing shoppers to buy and send gift cards via Prime app, text message or email, "
                    "The best part is that it’s FREE for all of your customers to use with no hidden fees and it NEVER expires!",
                style: AppTextStyles.descStyleLight,
              ),

              ///Next One
              TextSpan(
                text: "\n\nHOW DOES PRIME WORK?\n",
                style: AppTextStyles.getStyle(
                    AppTextStyles.descStyleBold, AppColors.primaryGreenColor),
              ),
              TextSpan(
                text:
                    "Prime provides an eGift card solution to small businesses so consumers can purchase their gift cards online. "
                    "Once purchased, the Prime e-gift card is instantly sent to the recipient via Prime app, text message or email and can be redeemed in-store by the participating merchant using our free app. ",
                style: AppTextStyles.descStyleLight,
              ),

              ///Next One
              TextSpan(
                text: "\n\nWHAT CAN I DO WITH PRIME?\n",
                style: AppTextStyles.getStyle(
                    AppTextStyles.descStyleBold, AppColors.primaryGreenColor),
              ),
              TextSpan(
                text:
                    "With Prime, you'll be able to create, sell and market your own eGift cards, as well as track transactions in real-time! "
                    "You can also schedule custom promotions to announce your new cards, create promotions or discounts, and start fundraisers, "
                    "making Prime an all-in-one eGift card marketing platform. ",
                style: AppTextStyles.descStyleLight,
              ),

              ///Next One
              TextSpan(
                text: "\n\nWHAT IS YOUR REFUND POLICY?\n",
                style: AppTextStyles.getStyle(
                    AppTextStyles.descStyleBold, AppColors.primaryGreenColor),
              ),
              TextSpan(
                text:
                    "We guarantee customer satisfaction. If for any reason you or the recipient are not satisfied with the experience, we will issue a full refund online.",
                style: AppTextStyles.descStyleLight,
              ),

              ///Next One
              TextSpan(
                text: "\n\nDOES A PRIME CARD EVER EXPIRE?\n",
                style: AppTextStyles.getStyle(
                    AppTextStyles.descStyleBold, AppColors.primaryGreenColor),
              ),
              TextSpan(
                text: "No! The value of a Prime eGift card never expires.",
                style: AppTextStyles.descStyleLight,
              ),

              ///Next One
              TextSpan(
                text: "\n\nIS THIS AVAILABLE ONLY IN GHANA?\n",
                style: AppTextStyles.getStyle(
                    AppTextStyles.descStyleBold, AppColors.primaryGreenColor),
              ),
              TextSpan(
                text:
                    "Currently, Prime is available in Ghana, however if you are looking to have it in another country, contact us for custom integration.",
                style: AppTextStyles.descStyleLight,
              ),

              ///Next One
              TextSpan(
                text: "\n\nHOW DO YOU KEEP OUR INFORMATION SAFE & SECURE?\n",
                style: AppTextStyles.getStyle(
                    AppTextStyles.descStyleBold, AppColors.primaryGreenColor),
              ),
              TextSpan(
                text:
                    "Prime utilizes cutting-edge fraud protection provided by IT Consortium to monitor transactions and to keep your personal and financial information safe and secure.",
                style: AppTextStyles.descStyleLight,
              ),

              ///Next one
              TextSpan(
                text:
                    "\n\nCAN YOU SCHEDULE THE DELIVERY OF A PRIME E-GIFT CARD?\n",
                style: AppTextStyles.getStyle(
                    AppTextStyles.descStyleBold, AppColors.primaryGreenColor),
              ),
              TextSpan(
                text:
                    "We like that you're thinking ahead. Yes! The sender can choose to send their Prime at a future date or for immediate delivery, your choice.",
                style: AppTextStyles.descStyleLight,
              ),

              ///Next one
              TextSpan(
                text: "\n\nHOW DO I REDEEM A GIFTFLY?\n",
                style: AppTextStyles.getStyle(
                    AppTextStyles.descStyleBold, AppColors.primaryGreenColor),
              ),
              TextSpan(
                text:
                    "Customers present their Prime e-Gift Card to the store to redeem it and by entering the amount, a QR code will be generated and merchants can redeem them during checkout using the Merchant Prime pay App, or customer just scanning merchant unique QR Code",
                style: AppTextStyles.descStyleLight,
              ),

              ///Next one
              TextSpan(
                text:
                    "\n\nDO YOU NEED A SMARTPHONE TO SEND AND RECEIVE A PRIME E-GIFT CARD?\n",
                style: AppTextStyles.getStyle(
                    AppTextStyles.descStyleBold, AppColors.primaryGreenColor),
              ),
              TextSpan(
                text:
                    "NO! A Prime e-Gift Card can be sent from a smartphone to a yam phone via text or through an email, But you will need where a link will be provided to download the app and access your e-gift card. You will need a smartphone to get access to your e-gift card and make transactions with it.",
                style: AppTextStyles.descStyleLight,
              ),

              ///Next one
              TextSpan(
                text: "\n\nWHAT IF I HAVE MORE QUESTIONS?\n",
                style: AppTextStyles.getStyle(
                    AppTextStyles.descStyleBold, AppColors.primaryGreenColor),
              ),
              TextSpan(
                text:
                    "No problem. You can reach us anytime via phone or text: \n0247117448, 0245007680 \nemail: info@primeegiftcard.com, "
                    "\n\nWe respond to most support inquiries within 24 hours. "
                    "Please type the word “Urgent” in your subject line and we will prioritize your issue. "
                    "If this concerns an existing order, please provide an order number or the email address associated with your gift. Thank you!",
                style: AppTextStyles.descStyleLight,
              ),
            ],
          ),
        ),
        SizedBox(height: 100),
      ],
    ));

    return list;
  }
}
