import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class BioApi {
  final LocalAuthentication _auth = LocalAuthentication();
  final RxBool _canCheckBiometrics = false.obs;
  final RxList<BiometricType> _availableBiometrics = <BiometricType>[].obs;
  final RxString _authorizedMessage = 'Not Authorized'.obs;
  final RxString _authImageAsset = 'assets/images/fingerprint.png'.obs;
  final RxString _biometricType = 'Touch ID'.obs;
  final RxString _localizedReason = 'Scan your fingerprint to authenticate'.obs;
  final RxBool _isAuthenticating = false.obs;
  final RxBool _isAuthenticatingSuccess = false.obs;

  BioApi();

  Future<void> getAvailableBiometrics() async {
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics =
          await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
    } on PlatformException catch (e) {
      //print(e);
    }
    _canCheckBiometrics.value = canCheckBiometrics;

    if (!canCheckBiometrics) {
      return;
    }

    List<BiometricType> availableBiometrics = [];

    try {
      availableBiometrics = await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      //print(e);
    }
    this._availableBiometrics.value = availableBiometrics;

    if (availableBiometrics.isNotEmpty) {
      switch (availableBiometrics.first) {
        case BiometricType.face:
          _authImageAsset.value = "assets/images/auth_face.png";
          _authorizedMessage.value = "Authenticate with Face ID";
          _localizedReason.value = "Scan your face to authenticate";
          _biometricType.value = "Face ID";
          break;
        case BiometricType.fingerprint:
          _authImageAsset.value = "assets/images/fingerprint.png";
          _authorizedMessage.value = "Authenticate with Touch ID";
          _localizedReason.value = "Scan your fingerprint to authenticate";
          _biometricType.value = "Touch ID";
          break;
        case BiometricType.iris:
          _authImageAsset.value = "assets/images/auth_face.png";
          _authorizedMessage.value = "Authenticate by scanning eye";
          _localizedReason.value = "Scan your eye to authenticate";
          _biometricType.value = "Eye ID";
          break;
        default:
          _authImageAsset.value = "assets/images/fingerprint.png";
          _authorizedMessage.value = "Authenticate with Touch ID";
          _localizedReason.value = "Scan your fingerprint to authenticate";
          _biometricType.value = "Touch ID";
          break;
      }
    }
    debugPrint(
        "AuthMss : ${_authorizedMessage.value} \nAsset : ${_authImageAsset.value} \nAvailableBio : ${_availableBiometrics.value}");
  }

  Future<void> _authenticate({Function(bool)? call}) async {
    bool authenticated = false;
    try {
      _isAuthenticating.value = true;
      _authorizedMessage.value = 'Authenticating';

      authenticated = await _auth.authenticate(
        localizedReason: _localizedReason.value,
      );

      _isAuthenticatingSuccess.value = authenticated;
      _isAuthenticating.value = false;
      _authorizedMessage.value = 'Authenticating';
    } on PlatformException catch (e) {
      Utils.printLog(e);
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    _authorizedMessage.value = message;
    _authImageAsset.value =
        authenticated ? "assets/images/success.png" : _authImageAsset.value;
    if (call != null) {
      call(_isAuthenticatingSuccess.value);
    }
  }

  void _cancelAuthentication() {
    _auth.stopAuthentication();
  }

  void _onBiometricsAuthClick({Function? call}) {
    _isAuthenticating.value
        ? _cancelAuthentication()
        : _authenticate(call: (success) {
            if (success) {
              getAvailableBiometrics();

              ///delay 1 seconds before performing any authentication
              Utils.startTimer(1, () {
                if (call != null) call();
              });
            }
          });
  }

  Widget bioWidget({Color? color, Function? call}) {
    return Obx(
      () => _canCheckBiometrics.value
          ? FloatingActionButton(
              backgroundColor: Colors.transparent,
              elevation: 0,
              heroTag: "_bio",
              shape: const CircleBorder(),
              onPressed: () {
                _onBiometricsAuthClick(call: call);
              },
              child: UiApi.assetImage(
                _authImageAsset.value,
                assetColor: color ?? AppColors.skyBlueColor,
                height: AppDimens.dimen30,
                width: AppDimens.dimen30,
              ),
            )
          : SizedBox(height: AppDimens.dimen30, width: AppDimens.dimen30),
    );
  }

  Widget bioTextWidget({
    Function? call,
    double? height,
    double? width,
    bool showText = true,
    Color? color,
  }) {
    return Obx(
      () => Column(
        children: [
          _canCheckBiometrics.value
              ? GestureDetector(
                  onTap: () {
                    _onBiometricsAuthClick(call: call);
                  },
                  child: Column(
                    children: [
                      UiApi.assetImage(
                        _authImageAsset.value,
                        assetColor: color ?? AppColors.skyBlueColor,
                        height: height ?? AppDimens.dimen70,
                        width: width ?? AppDimens.dimen70,
                      ),
                      showText
                          ? Column(
                              children: [
                                SizedBox(height: AppDimens.dimen20),
                                Text(
                                  "$_authorizedMessage",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.descStyleRegular,
                                ),
                                SizedBox(height: AppDimens.dimen10),
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
