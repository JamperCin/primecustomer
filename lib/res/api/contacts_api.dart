import 'package:primecustomer/data/constants/pref_constants.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/prominent_disclosure.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:flutter_native_contact_picker/model/contact.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsApi {
  static ContactsApi? _instance;

  ContactsApi._internal();

  factory ContactsApi() {
    return _instance ??= ContactsApi._internal();
  }

  Future<void> requestForPermission() async {
    bool isAccepted = await Permission.contacts.status == PermissionStatus.granted ;
    if(!isAccepted){
      await Permission.contacts.request();
    }
    prefUtils.setBool(PrefConstants.CONTACT_PERMISSION_ALLOWED, true);
  }

  ///Pick contact from user's contacts list
  ///First of all check if user has accepted/allowed the permission to open contact
  Future<void> pickContact(Function(Contact) callBack) async {
    bool accept = prefUtils.getBool(PrefConstants.CONTACT_PERMISSION_ALLOWED);
    if (!accept) {
      ProminentDisclosureApi().showContactsDisclosure(onAccept: (accept) {
        if (accept) {
          requestForPermission();
        }
      });
      return;
    }

    // Create an instance of the picker
    final FlutterNativeContactPicker _contactPicker = FlutterNativeContactPicker();
    // Select a single contact
    Contact? contact = await _contactPicker.selectPhoneNumber();
    if(contact != null) callBack(contact);
  }
}
