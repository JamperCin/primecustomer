import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/model/remote/customer.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/profile/edit_profile_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/settings/delete_account/delete_account_Screen.dart';
import 'package:primecustomer/utils/pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/image_picker_utils.dart';

class ProfileController extends BaseController {
  ///Define the TextEditingControllers here
  TextEditingController firstNameTxt = TextEditingController();
  TextEditingController lastNameTxt = TextEditingController();
  TextEditingController phoneTxt = TextEditingController();
  TextEditingController emailTxt = TextEditingController();
  TextEditingController location = TextEditingController();

  //RxString profilePicURl = "".obs;
  RxBool isImageUploading = false.obs;
  ImagePickerUtils? imagePickerUtils;

  @override
  void setContext(BuildContext context) {
    super.setContext(context);
    imagePickerUtils = ImagePickerUtils(webService: webService!);
  }

  void prePopulateData() {
    Customer customer = prefUtils.getCustomer();

    firstNameTxt.text = customer.person?.firstName ?? "";
    lastNameTxt.text = customer.person?.surname ?? "";
    phoneTxt.text = customer.phoneNumber;
    phoneTxt.text = getPhone();
    emailTxt.text = customer.email;
    profilePicURl.value = customer.person?.profilePicUrl ?? "";
    isImageUploading.value = false;
  }

  void onEditProfilePnClick() {
    NavApi.fireTarget(EditProfileScreen());
  }

  void onProfileImageOnClick() {
    imagePickerUtils?.pickImage(isImageUploading, (url) {
      profilePicURl.value = url;
    });
  }

  void onUpDateProfileOnClick() {
    UiApi.showConfirmDialog(
      imageAsset: "assets/images/ic_report_issue.png",
      title: "Confirm Profile Update",
      message: "Are you sure you want to update your profile details?",
      buttonTitle: "Update",
      buttonColor: AppColors.primaryGreenColor,
      callBack: () {
        initUpdateProfileRequest();
      },
    );
  }

  ///Make an api call to the backend to signUp User
  void initUpdateProfileRequest() {
    HashMap<String, String> params = HashMap();
    params.putIfAbsent("first_name", () => getStringData(firstNameTxt));
    params.putIfAbsent("surname", () => getStringData(lastNameTxt));
    if (getStringData(emailTxt).isNotEmpty) {
      params.putIfAbsent("email", () => getStringData(emailTxt));
    }
    if (profilePicURl.value.isNotEmpty) {
      params.putIfAbsent("profile_pic_url", () => profilePicURl.value);
    }

    webService?.updateProfileDetails(params, (response) async {
      prefUtils.saveDetails(response);
      //Initialise SharedPreference
      prefUtils = await PrefUtils().getPref();
      // SnackBarApi.snackBarSuccess("Profile details updated successfully");
      DialogsApi.popUpSuccessDialog(mContext!,
          mess: "Profile details updated successfully", call: () {
        NavApi.fireTargetHome();
      });
    });
  }

  getFullName() {
    return "${getStringData(lastNameTxt)} ${getStringData(firstNameTxt)}";
  }

  getPhone() {
    return getLastTwoDigits(phone: getStringData(phoneTxt));
  }

  getEmailAddress() {
    return getStringData(emailTxt);
  }

  getLocationAddress() {
    return getStringData(location);
  }

  void onDeleteAccount() {
    NavApi.fireTarget(DeleteAccountScreen());
  }
}
