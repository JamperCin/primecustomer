import 'package:core_module/core_module.dart';
import 'package:primecustomer/core/data/local/pref_utils.dart';
import 'package:primecustomer/core/enums/guest_staging.dart';

PrefUtils prefUtils = PrefUtils();
RxInt notificationCounter = 0.obs;
//RxBool isGuestUser = false.obs;
String guestUserToken = "";
RxString profilePicURl = "".obs;
const icEnvPath = "assets/config/env.json";
Rx<GuestStage> guestStage = GuestStage.init.obs;

NavUtils navUtils = NavUtils();
ValidationUtils validationUtils = ValidationUtils();
