import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/about_prime/about_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/profile/profile_page_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/settings/change_number/change_number_screen.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/settings/delete_account/delete_account_Screen.dart';

class SettingsController extends BaseController {
  void onInviteFriendsOnClick() {}

  void onProfileOnClick() {
    NavApi.fireTarget(ProfilePageScreen());
  }

  void onAboutPrimeOnClick() {
    NavApi.fireTarget(AboutScreen());
  }

  void onChangeNumber() {
    NavApi.fireTarget(ChangeNumberScreen());
  }

  void onDeleteAccountOnClick() {
    NavApi.fireTarget(DeleteAccountScreen());
  }
}
