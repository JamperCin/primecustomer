import 'dart:io';

import 'package:primecustomer/data/constants/pref_constants.dart';
import 'package:primecustomer/data/http/web_service.dart';
import 'package:primecustomer/data/model/local/DisclosureModel.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/ui/base/prominent_disclosure.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../data/enum/image_picker_type.dart';
import '../res/ui_helpers/ui_api.dart';

class ImagePickerUtils {
  WebService webService;

  ImagePickerUtils({required this.webService});

  void imageDisclosure(Function(bool) onAccepted) {
    DisclosureModel model = DisclosureModel(
        appBarTitle: "Permission",
        title: "Camera and Picture Gallery Permission needed",
        message:
            "This feature allows users to optionally upload images by opening their camera or selecting from their gallery. "
            "The image is used as a profile picture by the user and primarily for identification purposes on the Prime platform. "
            "\n\nOther users on the platform can identify you using your profile image."
            "\n\nIf you don't feel comfortable with this, you can skip since it's not compulsory.",
        asset: "assets/images/ic_take_camera.png",
        onAccepted: (accepted) {
          prefUtils.setBool(PrefConstants.IMAGE_PERMISSION_ALLOWED, accepted);
          onAccepted(accepted);
        });

    NavApi.fireTarget(ProminentDisclosure(disclosureModel: model));
  }

  ///Show the image picker and
  /// - pick from your Gallery
  /// - Take Camera
  ///
  void pickImage(RxBool progress, Function(String) callBack) {
    bool imagePerm = prefUtils.getBool(PrefConstants.IMAGE_PERMISSION_ALLOWED);
    if (!imagePerm) {
      imageDisclosure((accepted) {
        if (accepted) {
          pickImage(progress, callBack);
        }
      });
      return;
    }
    UiApi.showImagePicker(onclick: (action) {
      _onPickerSelected(action, callBack, progress);
    });
  }

  void _onPickerSelected(
    ImagePickerAction value,
    Function(String) callBack,
    RxBool progress,
  ) {
    if (value == ImagePickerAction.CAMERA || value == ImagePickerAction.PHOTO) {
      var src = value == ImagePickerAction.CAMERA
          ? ImageSource.camera
          : ImageSource.gallery;
      final picker = ImagePicker();

      picker.pickImage(source: src).then((file) {
        if (file != null) {
          progress.value = true;
          File newFile = File(file.path);

          _uploadFile(
            newFile,
            progress,
            callBack,
          );
        }
      });
    } else {
      callBack("");
    }
  }

  void _uploadFile(File file, RxBool progress, Function(String) callBack) {
    webService.uploadFile(file, (response) {
      progress.value = false;
      String? url = response.data != null ? response.data?.url : "";
      callBack(url!);
    });
  }
}
