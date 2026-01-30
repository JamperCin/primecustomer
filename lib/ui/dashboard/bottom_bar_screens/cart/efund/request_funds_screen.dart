import 'package:primecustomer/controller/view/e_fund_controller.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/model/contact.dart';
import 'package:get/get.dart';

class RequestFundsScreen extends BaseScreenStandard {
  EFundController controller = Get.put(EFundController());

  @override
  String appBarTitle() {
    return "Request Funds";
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
  }

  @override
  CardModel getModel() {
    return baseObject as CardModel;
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(list: listView());
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    // list.add(Center(child: UiApi.assetImage("assets/images/ic_efund.jpg")));

    list.add(SizedBox(height: AppDimens.dimen30));
    list.add(
      UiApi.titleView(
        title: "Contact Information",
        backgroundColor: AppColors.white,
        padding: EdgeInsets.only(bottom: AppDimens.dimen1),
      ),
    );

    list.add(Obx(
      () => controller.contacts.isNotEmpty
          ? UiApi.horizontalListView(list: contactsList())
          : SizedBox(),
    ));

    list.add(Column(children: [
      SizedBox(height: AppDimens.dimen10),
      UiApi.titleView(
        title: "Personalised Message",
        backgroundColor: AppColors.white,
        padding: EdgeInsets.only(bottom: AppDimens.dimen10),
        /*subTitle: SizedBox(
          height: AppDimens.dimen25,
          child: FloatingActionButton(
            heroTag: "_favorite",
            backgroundColor: AppColors.kGreyWhite.withOpacity(.8),
            child: Icon(Icons.favorite,
                color: AppColors.red, size: AppDimens.dimen10),
            onPressed: () {
              controller.selectMessage();
            },
          ),
        ),*/
      ),
      UiApi.textArea(controller.messageTxt),
      SizedBox(height: AppDimens.dimen20),
    ]));

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
                  Text(
                    controller.scheduledDate.value.isEmpty
                        ? "Schedule Date"
                        : controller.scheduledDate.value,
                    style: controller.scheduledDate.value.isEmpty
                        ? AppTextStyles.subDescRegular
                        : AppTextStyles.descStyleRegular
                            .copyWith(color: AppColors.primaryGreenColor),
                  ),
                  Icon(
                    Icons.date_range,
                    size: AppDimens.dimen20,
                    color: controller.scheduledTime.value.isEmpty
                        ? AppColors.primaryGreenColor
                        : AppColors.primaryGreenColor,
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
                    Text(
                      controller.scheduledTime.value.isEmpty
                          ? "Schedule Time"
                          : controller.scheduledTime.value,
                      style: controller.scheduledTime.value.isEmpty
                          ? AppTextStyles.subDescRegular
                          : AppTextStyles.descStyleRegular
                              .copyWith(color: AppColors.primaryGreenColor),
                    ),
                    Icon(
                      Icons.access_time,
                      size: AppDimens.dimen20,
                      color: controller.scheduledTime.value.isEmpty
                          ? AppColors.primaryGreenColor
                          : AppColors.primaryGreenColor,
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
          text: "Submit Request",
          onPressed: () {
            controller.confirmEfundRequest();
          },
        ),
      ),
    );

    list.add(SizedBox(height: AppDimens.dimen40));

    return list;
  }

  List<Widget> contactsList() {
    List<Widget> list = [];
    for (Contact c in controller.contacts) {
      list.add((UiApi.contactWidget(
        c,
        width: SizeConfig.screenWidth * .75,
        margin:
            EdgeInsets.only(left: AppDimens.dimen5, right: AppDimens.dimen5),
        onDelete: (p) {
          controller.onDeletePhone(p, goBack: true);
        },
      )));
    }
    return list;
  }
}
