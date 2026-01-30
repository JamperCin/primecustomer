import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutScreen extends BaseScreenStandard {
  String version = "3.0.0";

  AboutScreen() {
    checkVersion();
  }

  void checkVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    print("VER == $version");
  }

  @override
  String appBarTitle() {
    return "About Prime";
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(list: listView());
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(
      Center(
        child: UiApi.assetImage(
          "assets/images/ic_prime_new_logo.png",
          height: AppDimens.dimen120,
        ),
      ),
    );
    list.add(
      Center(
        child: Text("Prime E-Gift V. $version", style: AppTextStyles.title),
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen40));

    list.add(
      UiApi.richText(
        maxLines: 30,
        mod: [
          RichTextModel(
            text: "Prime",
            style: AppTextStyles.h4StyleBold,
          ),
          RichTextModel(
            text: " delivers",
            style: AppTextStyles.descStyleLight,
          ),
          RichTextModel(
            text: " branded payment solution",
            style: AppTextStyles.descStyleMedium.copyWith(
              color: AppColors.skyBlueColor,
            ),
          ),
          RichTextModel(
            text: " to help meet today’s most challenging business objectives.",
            style: AppTextStyles.descStyleLight,
          ),
          RichTextModel(
            text: " We collaborate with businesses to ",
            style: AppTextStyles.descStyleLight,
          ),
          RichTextModel(
            text:
                "innovate, translating market trends in branded payments to extend reach, build loyalty and increase revenue.\n\n",
            style: AppTextStyles.descStyleRegular,
          ),
          RichTextModel(
            text:
                "innovate, translating market trends in branded payments to extend reach, build loyalty and increase revenue.\n\n",
            style: AppTextStyles.descStyleRegular,
          ),
          RichTextModel(
            text:
                "We offer a full portfolio of comprehensive services to ensure the success of your business’ branded payment programs, including",
            style: AppTextStyles.descStyleLight,
          ),
          RichTextModel(
            text: " design, publishing, and marketing.\n\n",
            style: AppTextStyles.descStyleRegular,
          ),
          RichTextModel(
            text: "Prime E-Gift card",
            style: AppTextStyles.h4StyleBold,
          ),
          RichTextModel(
            text:
                " is a great way for merchants to offer their valued customers an alternative way to send gifts to their love ones and themselves, "
                "empowering shoppers to give and redeem gift cards, and obtain additional brand recognition. It is also a great way for customers to give gifts to family and fiends.",
            style: AppTextStyles.descStyleLight,
          ),
        ],
      ),
    );

    return list;
  }
}
