import 'package:primecustomer/controller/view/profile_controller.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_stateful_dec.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class EditProfileScreen extends BaseScreenStatefulDecorated {
  ProfileController controller = Get.put(ProfileController());

  // Future<String> data() async {
  //   return "";
  // }

  @override
  void initState(SingleTickerProviderStateMixin vsync) {
    super.initState(vsync);
    controller.prePopulateData();
  }

  @override
  double decoPageTopPadding() {
    return AppDimens.dimen5;
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
  }

  @override
  Widget page(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                NavApi.fireBack();
              },
              child: Icon(
                Icons.arrow_back_ios_new_sharp,
                size: AppDimens.dimen20,
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: listView(),
          ))),
        ],
      ),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(SizedBox(height: AppDimens.dimen30));
    list.add(
      Obx(
        () => Center(
          child: controller.isImageUploading.value
              ? UiApi.circularProgressBar(radius: AppDimens.dimen50)
              : UiApi.getProfilePic(
                  radius: AppDimens.dimen55,
                  url: profilePicURl.value,
                  onTap: () {
                    controller.onProfileImageOnClick();
                  },
                ),
        ),
      ),
    );
    list.add(SizedBox(height: AppDimens.dimen10));
    list.add(Text(
      "Tap on image to edit profile picture",
      style: AppTextStyles.subDescRegular,
      textAlign: TextAlign.center,
    ));

    list.add(SizedBox(height: AppDimens.dimen50));
    list.add(Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Personal Information",
        style: AppTextStyles.titleStyleBold,
        textAlign: TextAlign.left,
      ),
    ));
    list.add(Column(
      children: [
        SizedBox(height: AppDimens.dimen5),
        Container(
          decoration: UiApi.deco(),
          child: Padding(
            padding: EdgeInsets.all(AppDimens.dimen16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppDimens.dimen5),
                Text(
                  'First name',
                  style: AppTextStyles.subDescRegular
                      .copyWith(color: AppColors.black),
                ),
                SizedBox(height: AppDimens.dimen5),
                UiApi.textFormField(
                  hintText: 'Enter your first name',
                  controller: controller.firstNameTxt,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.deactivatedText,
                    size: AppDimens.dimen18,
                  ),
                  textCapitalization: TextCapitalization.words,
                ),
                SizedBox(height: AppDimens.dimen15),
                Text(
                  'Last name',
                  style: AppTextStyles.subDescRegular
                      .copyWith(color: AppColors.black),
                ),
                SizedBox(height: AppDimens.dimen5),
                UiApi.textFormField(
                  hintText: 'Enter your last name',
                  controller: controller.lastNameTxt,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.deactivatedText,
                    size: AppDimens.dimen18,
                  ),
                ),
                SizedBox(height: AppDimens.dimen10),
                Text(
                  'Phone Number',
                  style: AppTextStyles.subDescRegular
                      .copyWith(color: AppColors.black),
                ),
                SizedBox(height: AppDimens.dimen5),
                UiApi.textFormField(
                  keyboardType: TextInputType.phone,
                  hintText: 'Enter your phone number',
                  controller: controller.phoneTxt,
                  enabled: false,
                  prefixIcon: Icon(
                    Icons.phone,
                    color: AppColors.deactivatedText,
                    size: AppDimens.dimen18,
                  ),
                ),
                SizedBox(height: AppDimens.dimen10),
                Text(
                  'Email Address',
                  style: AppTextStyles.subDescRegular
                      .copyWith(color: AppColors.black),
                ),
                SizedBox(height: AppDimens.dimen5),
                UiApi.textFormField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Enter email Address',
                  controller: controller.emailTxt,
                  prefixIcon: Icon(
                    Icons.mark_email_read_outlined,
                    color: AppColors.deactivatedText,
                    size: AppDimens.dimen18,
                  ),
                ),
                SizedBox(height: AppDimens.dimen10),
              ],
            ),
          ),
        ),
      ],
    ));
    list.add(SizedBox(
      height: AppDimens.dimen70,
    ));
    list.add(
      UiApi.decoratedButton(
          icon: Icon(Icons.upload,
              color: AppColors.white, size: AppDimens.dimen20),
          backgroundColor: AppColors.primaryGreenColor,
          iconPadding: EdgeInsets.only(left: AppDimens.dimen20),
          text: "Update Profile",
          textColor: AppColors.white,
          onTap: () {
            controller.onUpDateProfileOnClick();
          }),
    );

    list.add(SizedBox(
      height: AppDimens.dimen70,
    ));

    return list;
  }
}
