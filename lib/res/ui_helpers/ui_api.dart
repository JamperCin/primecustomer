import 'dart:async';

import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/widgets/checkbox_widget.dart';
import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/controller/view/near_by_merchant_model.dart';
import 'package:primecustomer/data/enum/PromotionType.dart';
import 'package:primecustomer/data/enum/drawer_inder.dart';
import 'package:primecustomer/data/enum/menu_index.dart';
import 'package:primecustomer/data/enum/wallet_type.dart';
import 'package:primecustomer/data/model/display/animated_pod_model.dart';
import 'package:primecustomer/data/model/display/dictionary_model.dart';
import 'package:primecustomer/data/model/display/drawer_model.dart';
import 'package:primecustomer/data/model/local/DisclosureModel.dart';
import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';
import 'package:primecustomer/data/model/remote/address_model.dart';
import 'package:primecustomer/data/model/remote/customer.dart';
import 'package:primecustomer/data/model/remote/eFund_card_model.dart';
import 'package:primecustomer/data/model/remote/e_fund_request_model.dart';
import 'package:primecustomer/data/model/remote/merchant_details.dart';
import 'package:primecustomer/data/model/remote/notification_model.dart';
import 'package:primecustomer/data/model/remote/payment_options.dart';
import 'package:primecustomer/data/model/remote/payments.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/data/model/remote/question.dart';
import 'package:primecustomer/data/model/remote/rating_model.dart';
import 'package:primecustomer/data/model/remote/redemption_logs.dart';
import 'package:primecustomer/res/api/geo_location_api.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/card_api.dart';
import 'package:primecustomer/res/ui_helpers/dialogs_api.dart';
import 'package:primecustomer/res/ui_helpers/snack_bar_api.dart';
import 'package:primecustomer/ui/auth/signup/guest_user_signup.dart';
import 'package:primecustomer/ui/base/base_image_viewer_screen.dart';
import 'package:primecustomer/ui/dashboard/security/AddSecurityQuestionScreen.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:primecustomer/utils/card_utils.dart';
import 'package:primecustomer/utils/date_time_utils.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_native_contact_picker/model/contact.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../data/enum/image_picker_type.dart';
import '../../data/model/remote/category_model.dart';
import '../../data/model/remote/shop_model.dart';
import '../../main.dart';
import '../app/app_colors.dart';
import '../app/app_text_styles.dart';
import '../config/assets_config.dart';
import 'dialog_emoji.dart';

class UiApi {
  /*///A Circular progress bar copied from material style
  /// An iOS-style activity indicator that spins clockwise.
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=AENVH-ZqKDQ}
  ///
  static Widget circularProgressBar({double? radius, Color? color}) {
    return SizedBox(
      child: CircularProgressIndicator(color: color),
      height: radius ?? AppDimens.dimen30,
    );
  }*/

  ///A Circular progress indicator copied from cupertino style
  /// An iOS-style activity indicator that spins clockwise.
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=AENVH-ZqKDQ}
  ///
  static Widget circularProgressIndicator({double? radius, Color? color}) {
    return CupertinoActivityIndicator(
      animating: true,
      color: color,
      radius: radius ?? AppDimens.dimen30,
    );
  }

  ///A Circular progress indicator copied from cupertino style
  /// An iOS-style activity indicator that spins clockwise.
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=AENVH-ZqKDQ}
  ///
  static Widget circularProgressBar(
      {double? radius, Color? color, double? width}) {
    return SizedBox(
      height: radius,
      width: radius,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: width ?? 1.5,
      ),
    );
  }

  ///This is an Extension of [circularProgressIndicator] with a square background
  ///A Circular progress indicator copied from cupertino style
  /// An iOS-style activity indicator that spins clockwise.
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=AENVH-ZqKDQ}
  ///
  static Widget circularProgressIndicatorExt({double? radius}) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: AppColors.black,
      ),
      padding: EdgeInsets.all(AppDimens.dimen25),
      child: circularProgressIndicator(
          radius: AppDimens.dimen20, color: AppColors.white),
    );
  }

  /// Creates a [FormField] that contains a [TextField].
  ///
  /// When a [controller] is specified, [initialValue] must be null (the
  /// default). If [controller] is null, then a [TextEditingController]
  /// will be constructed automatically and its `text` will be initialized
  /// to [initialValue] or the empty string.
  ///
  /// For documentation about the various parameters, see the [TextField] class
  /// and [new TextField], the constructor.
  static Widget textFormField({
    TextEditingController? controller,
    bool isPasswordField = false,
    String obscuringCharacter = "*",
    String? hintText,
    String? labelText,
    Widget? suffixIcon,
    Widget? prefixIcon,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    // RxBool? isValid,
    int? maxLines = 1,
    double borderRadius = 8,
    double? height,
    int? minLines,
    bool expands = false,
    int? maxLength,
    bool isTextArea = false,
    ValueChanged<String>? onChanged,
    VoidCallback? onTap,
    EdgeInsetsGeometry? contentPadding,
    Function(String)? onFieldSubmitted,
    TextStyle? style,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    TextAlign? textAlign,
    Color? focusColor,
    Color? unFocusColor,
    Color? borderColor,
    Color? disabledColor,
  }) {
    RxBool obscureText = isPasswordField.obs;
    // isValid = isValid ?? true.obs;
    return Obx(
      () => GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: height ?? (isTextArea ? null : AppDimens.dimen55),
          child: TextFormField(
            style: style ?? AppTextStyles.descStyleLight,
            controller: controller,
            textAlign: textAlign ?? TextAlign.start,
            decoration: InputDecoration(
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.all(AppDimens.dimen2),
                      child: prefixIcon,
                    )
                  : prefixIcon,
              suffixIcon: isPasswordField
                  ? GestureDetector(
                      onTap: () {
                        obscureText.value = !obscureText.value;
                      },
                      child: Padding(
                        padding: EdgeInsets.all(AppDimens.dimen12),
                        child: SvgPicture.asset(
                          obscureText.value
                              ? AssetsConfig.eye
                              : AssetsConfig.crossedEye,
                          height: AppDimens.dimen10,
                          width: AppDimens.dimen10,
                        ),
                      ),
                    )
                  : suffixIcon,
              hintText: hintText,
              labelText: labelText,
              hintStyle: hintStyle,
              labelStyle: labelStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: borderColor ?? AppColors.black,
                  width: 1,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: disabledColor ?? AppColors.black,
                  width: .5,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: unFocusColor ?? AppColors.black,
                  width: .5,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: focusColor ?? AppColors.introColor2,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              //  filled: true,
              //isDense: true,
              //contentPadding: contentPadding ?? EdgeInsets.all(AppDimens.dimen10),
            ),
            obscureText: obscureText.value,
            obscuringCharacter: obscuringCharacter,
            validator: validator,
            onSaved: onSaved,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            textInputAction: textInputAction,
            inputFormatters: inputFormatters,
            enabled: enabled,
            onChanged: onChanged,
            maxLength: maxLength,
            maxLines: maxLines,
            expands: expands,
            minLines: minLines,
            onFieldSubmitted: onFieldSubmitted,
          ),
        ),
      ),
    );
  }

  static Timer autoAnimate(List<AnimatedPodModel> podList, int pos) {
    return Utils.startTimer(1, () {
      if (pos < podList.length) {
        GlobalKey<AnimatorWidgetState> key = (podList[pos].key)!;
        key.currentState?.forward();
        pos++;
        autoAnimate(podList, pos);
      } else {
        pos = 0;
        autoAnimate(podList, pos);
      }
    }, duration: const Duration(milliseconds: 350));
  }

  static List<Widget> animatedPodList(List<AnimatedPodModel> list) {
    List<Widget> pod = [];
    for (AnimatedPodModel mod in list) {
      pod.add(mod.widget);
    }
    return pod;
  }

  static List<AnimatedPodModel> animatedPod(
      {Color? color, Function(GlobalKey<AnimatorWidgetState>)? call}) {
    List<AnimatedPodModel> list = [];

    GlobalKey<AnimatorWidgetState> key1 = GlobalKey<AnimatorWidgetState>();
    GlobalKey<AnimatorWidgetState> key2 = GlobalKey<AnimatorWidgetState>();
    GlobalKey<AnimatorWidgetState> key3 = GlobalKey<AnimatorWidgetState>();

    list.add(AnimatedPodModel(
        widget: _podPulse(key1, color: color, call: call), key: key1));
    list.add(AnimatedPodModel(
        widget: _podPulse(key2, color: color, call: call), key: key2));
    list.add(AnimatedPodModel(
        widget: _podPulse(key3, color: color, call: call), key: key3));

    return list;
  }

  static Widget _podPulse(GlobalKey<AnimatorWidgetState> key,
      {Color? color, Function(GlobalKey<AnimatorWidgetState>)? call}) {
    return FadeIn(
      key: key,
      preferences: AnimationPreferences(animationStatusListener: (lis) {
        if (lis == AnimationStatus.completed) {
          if (call != null) {
            call(key);
          }
        }
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: Container(
          width: AppDimens.dimen10,
          height: AppDimens.dimen10,
          margin: EdgeInsets.only(right: AppDimens.dimen5),
          decoration: deco(
            color: color ?? AppColors.white,
            opacity: 0.2,
          ),
        ),
      ),
    );
  }

  /// A Material Design "Text Button".
  ///
  /// Use text buttons on toolbars, in dialogs, or inline with other
  /// content but offset from that content with padding so that the
  /// button's presence is obvious. Text buttons do not have visible
  /// borders and must therefore rely on their position relative to
  /// other content for context.
  static Widget button({
    String text = "",
    Color backgroundColor = AppColors.introColor2,
    Color textColor = AppColors.white,
    Color? animateColor,
    Color? borderColor,
    TextStyle? textStyle,
    Widget? child,
    Widget? animatedWidget,
    required VoidCallback? onPressed,
    double? border,
    double? width,
    double? borderWidth,
    double? height,
    double opacity = 0.4,
    RxBool? animate,
  }) {
    animate = animate ?? false.obs;
    animatedWidget = animatedWidget ??
        circularProgressIndicator(
          radius: AppDimens.dimen14,
          color: AppColors.white,
        );

    return Obx(
      () {
        return SizedBox(
          width: width ?? SizeConfig.screenWidth * .75,
          height: height ?? AppDimens.dimen48,
          child: Container(
            decoration: deco(
              borderRadius: border ?? 50,
              borderWidth: borderWidth ?? 1,
              opacity: opacity,
              borderColor: (animate!.value
                      ? borderColor?.withOpacity(.4)
                      : borderColor) ??
                  (animate.value
                      ? backgroundColor.withOpacity(.4)
                      : backgroundColor),
            ),
            child: TextButton(
              onPressed: () {
                if (onPressed != null) {
                  onPressed();
                }
              },
              child: animate.value
                  ? animatedWidget!
                  : child ??
                      Text(
                        text,
                        style: textStyle ??
                            AppTextStyles.titleStyleSemiBold.copyWith(
                              color: textColor,
                            ),
                      ),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.grey,
                minimumSize:
                    Size(SizeConfig.screenWidth * .75, AppDimens.dimen40),
                backgroundColor: animate.value
                    ? backgroundColor.withOpacity(.4)
                    : backgroundColor,
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.dimen14, vertical: AppDimens.dimen5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(border ?? 50),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// A Material Design "Text Button" with decorated .
  ///
  /// Use text buttons on toolbars, in dialogs, or inline with other
  /// content but offset from that content with padding so that the
  /// button's presence is obvious. Text buttons do not have visible
  /// borders and must therefore rely on their position relative to
  /// other content for context.
  static Widget decoratedButton({
    String text = "",
    String asset = "assets/images/ic_google.svg",
    Color backgroundColor = AppColors.lineColor,
    Color borderColor = AppColors.lineColor,
    Color textColor = AppColors.black,
    GestureTapCallback? onTap,
    Widget? icon,
    IconData? trailIcon,
    Color? iconColor,
    double? height,
    double? width,
    double? iconHeight,
    double? spacer,
    TextStyle? style,
    EdgeInsets margin = const EdgeInsets.all(0),
    EdgeInsets? padding,
    EdgeInsets? iconPadding,
  }) {
    return InkWell(
      splashColor: AppColors.introColor2,
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Padding(
        padding: margin,
        child: Container(
          padding: padding ?? EdgeInsets.all(AppDimens.dimen5),
          width: width ?? SizeConfig.screenWidth * .75,
          height: height ?? AppDimens.dimen48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
              width: .5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: iconPadding ?? EdgeInsets.zero,
                child: icon ??
                    assetImage(
                      asset,
                      height: iconHeight ?? AppDimens.dimen35,
                      width: iconHeight ?? AppDimens.dimen35,
                      assetColor: iconColor,
                    ),
              ),
              //SizedBox(width: spacer ?? AppDimens.dimen20),
              Flexible(
                child: Center(
                  child: Text(
                    text,
                    style:
                        style ?? AppTextStyles.body1.copyWith(color: textColor),
                  ),
                ),
              ),
              trailIcon != null
                  ? Icon(trailIcon, color: iconColor ?? AppColors.black)
                  : const SizedBox(),
              SizedBox(width: AppDimens.dimen5),
            ],
          ),
        ),
      ),
    );
  }

  static Widget textButton({
    String leadingText = "",
    String trailingText = "",
    TextStyle? leadingStyle,
    TextStyle? trailingStyle,
    Color leadingTextColor = Colors.grey,
    Color trailingTextColor = AppColors.black,
    GestureTapCallback? onTap,
  }) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(backgroundColor: Colors.transparent),
      child: RichText(
        text: TextSpan(children: [
          if (leadingText.isNotEmpty)
            TextSpan(
              text: leadingText,
              style: leadingStyle ??
                  AppTextStyles.subDescRegular.copyWith(
                    color: leadingTextColor,
                  ),
            ),
          // if(leadingText.isNotEmpty)
          const TextSpan(text: "  "),
          TextSpan(
            text: trailingText,
            style: trailingStyle ??
                AppTextStyles.descStyleBold.copyWith(
                  color: trailingTextColor,
                ),
          ),
        ]),
      ),
    );
  }

  ///Create a circle image with a default radius of 60
  static Widget circleImageView({
    String url = "",
    double? radius,
    String asset = "assets/images/profile_circle.svg",
    GestureTapCallback? onTap,
    bool setOverlay = false,
  }) {
    radius = radius ?? AppDimens.dimen50;

    if (url.isEmpty) {
      return GestureDetector(
        child: assetImage(asset, height: radius * 2),
        onTap: onTap,
      );
    }
    return GestureDetector(
      onTap: onTap,
      child: setOverlay
          ? Stack(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.grey.withOpacity(.3),
                  backgroundImage: NetworkImage(url),
                  radius: radius,
                ),
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(.3),
                  radius: radius,
                ),
              ],
            )
          : CircleAvatar(
              backgroundColor: AppColors.grey.withOpacity(.3),
              backgroundImage: NetworkImage(url),
              radius: radius,
            ),
    );
  }

  static void showImagePicker(
      {bool del = true, Function(ImagePickerAction)? onclick}) {
    var widget = Container(
      padding: EdgeInsets.only(top: AppDimens.dimen20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              FloatingActionButton(
                backgroundColor: Colors.orange[300],
                child: Icon(
                  Icons.camera_alt,
                  size: AppDimens.dimen25,
                  color: AppColors.white,
                ),
                onPressed: () {
                  onclick!(ImagePickerAction.CAMERA);
                  Get.back();
                },
              ),
              SizedBox(
                height: AppDimens.dimen10,
              ),
              Text(
                "Camera",
                style: AppTextStyles.subDescStyleLight,
              ),
            ],
          ),
          Column(
            children: [
              FloatingActionButton(
                backgroundColor: Colors.indigo[300],
                child: Icon(
                  Icons.image,
                  size: AppDimens.dimen25,
                  color: AppColors.white,
                ),
                onPressed: () {
                  onclick!(ImagePickerAction.PHOTO);
                  Get.back();
                },
              ),
              SizedBox(
                height: AppDimens.dimen10,
              ),
              Text(
                "Photo",
                style: AppTextStyles.subDescStyleLight,
              ),
            ],
          ),
          del
              ? Column(
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.red[300],
                      child: Icon(
                        Icons.delete_forever,
                        size: AppDimens.dimen25,
                        color: AppColors.white,
                      ),
                      onPressed: () {
                        onclick!(ImagePickerAction.DELETE);
                        Get.back();
                      },
                    ),
                    SizedBox(
                      height: AppDimens.dimen10,
                    ),
                    Text(
                      "Delete Image",
                      style: AppTextStyles.subDescStyleLight,
                    ),
                  ],
                )
              : const SizedBox(width: 1),
        ],
      ),
    );

    DialogsApi.showBottomSheet(
      containerSize: AppDimens.dimen150,
      mainChild: widget,
      showButton: false,
    );
  }

  ///Show a loader widegt in your UI
  ///@param [size] The number of widgets of loaders to be displayed
  ///@param [child] A generic widget to be used as a loader.
  ///This can be one of the following classes of widgets [ProfileShimmer], [TextShimmer], [ProfilePageShimmer]
  ///[VideoShimmer], [YoutubeShimmer], [ListTileShimmer], [PlayStoreShimmer]
  static Widget loader({int size = 3, Widget? child}) {
    List<Widget> list = [];
    while (list.length != size) {
      list.add(child ?? const ProfileShimmer());
    }
    return SingleChildScrollView(
      child: Column(
        children: list,
      ),
    );
  }

  static Widget loaderMore({String text = "Loading more ..."}) {
    return Container(
      decoration: deco(
        opacity: 0.1,
        borderRadius: 0,
        color: AppColors.background,
        borderColor: AppColors.background,
      ),
      padding: EdgeInsets.all(AppDimens.dimen5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          circularProgressBar(radius: AppDimens.dimen20),
          SizedBox(width: AppDimens.dimen24),
          Text(
            text,
            style: AppTextStyles.subDescStyleMedium,
          ),
        ],
      ),
    );
  }

  static void showConfirmDialog({
    String imageAsset = "assets/images/ic_phone_verify.svg",
    String? imageUrl,
    String title = "Confirm",
    String buttonTitle = "Confirm",
    String message = "Proceed",
    Function? callBack,
    Color color = AppColors.background,
    Color? assetColor,
    Color? buttonColor,
    bool shouldDismissDialog = true,
    double? containerSize,
    double? assetSize,
    Widget? icon,
    Widget? assetIcon,
    Widget? messageWidget,
    TextStyle? titleStyle,
    TextStyle? messageStyle,
  }) {
    DialogsApi.showBottomSheet(
        isDismissable: shouldDismissDialog,
        isDraggable: shouldDismissDialog,
        backgroundColor: color,
        containerSize: containerSize ?? AppDimens.dimen380,
        mainChild: ListView(
          children: [
            assetIcon ??
                (imageUrl == null
                    ? assetImage(
                        imageAsset,
                        assetColor: assetColor,
                        height: assetSize,
                        width: assetSize,
                      )
                    : imageLoader(
                        url: imageUrl,
                        height: assetSize ?? SizeConfig.screenWidth * 0.4,
                        width: SizeConfig.screenWidth * 0.3,
                        //borderRadius: 10,
                        fit: BoxFit.fill,
                        //imageBackgroundColor: AppColors.background,
                      )),
            SizedBox(height: AppDimens.dimen10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: titleStyle ?? AppTextStyles.descStyleRegular,
            ),
            SizedBox(height: AppDimens.dimen10),
            messageWidget ??
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: messageStyle ?? AppTextStyles.smallSubDescStyleLight,
                ),
            SizedBox(height: AppDimens.dimen25),
            icon != null
                ? decoratedButton(
                    text: buttonTitle,
                    icon: icon,
                    backgroundColor: buttonColor ?? AppColors.introColor2,
                    onTap: () {
                      Get.back();
                      if (callBack != null) callBack();
                    },
                  )
                : button(
                    text: buttonTitle,
                    backgroundColor: buttonColor ?? AppColors.introColor2,
                    onPressed: () {
                      Get.back();
                      if (callBack != null) callBack();
                    },
                  ),
          ],
        ));
  }

  static Widget iconOnClick({
    String title = "Message",
    IconData icon = Icons.message_rounded,
    GestureTapCallback? onTap,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: AppDimens.dimen18,
            color: color ?? AppColors.skyBlueColor,
          ),
          Text(
            title,
            style: AppTextStyles.smallSubDescStyleRegular.copyWith(
              color: AppColors.iconColors,
            ),
          )
        ],
      ),
    );
  }

  static Widget assetImage(
    String image, {
    double? height,
    double? width,
    Color? assetColor,
    BoxFit? fit,
  }) {
    return GetUtils.isImage(image)
        ? Image.asset(
            image,
            height: height ?? AppDimens.dimen150,
            width: width ?? AppDimens.dimen150,
            color: assetColor,
            fit: fit,
          )
        : SvgPicture.asset(
            image,
            height: height ?? AppDimens.dimen150,
            width: width ?? AppDimens.dimen150,
            color: assetColor,
            fit: fit ?? BoxFit.contain,
          );
  }

  static Widget checkBox(
    Function(bool) onChange, {
    TextStyle? style,
    Widget? textWidget,
    String text = "",
    Function? onTextClick,
    bool? checkValue,
    bool enable = true,
  }) {
    RxBool isChecked = false.obs;
    isChecked.value = checkValue ?? false;
    return Obx(
      () => Row(
        children: [
          Flexible(
            flex: 0,
            child: CheckboxWidget(
              activeColor: AppColors.primaryGreenColor,
              checkValue: isChecked.value,
              onChange: (value) {
                if (enable) {
                  isChecked.value = value;
                  onChange(value);
                }
              },
            ),
          ),
          text.isNotEmpty
              ? Flexible(
                  flex: 1,
                  child: text.isNotEmpty || textWidget != null
                      ? GestureDetector(
                          onTap: () {
                            onTextClick!();
                          },
                          child: textWidget ?? Text(text, style: style))
                      : const SizedBox(),
                )
              : Flexible(
                  flex: 1,
                  child: textWidget != null
                      ? GestureDetector(
                          onTap: () {
                            onTextClick!();
                          },
                          child: textWidget,
                        )
                      : const SizedBox(),
                ),
        ],
      ),
    );
  }

  static Widget checkBoxExt(
    Function(bool) onChange, {
    TextStyle? style,
    Widget? textWidget,
    String text = "",
    Function? onTextClick,
    bool? checkValue,
  }) {
    RxBool isChecked = false.obs;
    isChecked.value = checkValue ?? false;
    return Obx(
      () => Row(
        children: [
          Flexible(
            flex: 0,
            child: Checkbox(
              activeColor: AppColors.primaryGreenColor,
              value: isChecked.value,
              onChanged: (value) {
                isChecked.value = value!;
                onChange(value);
              },
            ),
          ),
          Flexible(
            flex: 1,
            child: text.isNotEmpty || textWidget != null
                ? GestureDetector(
                    onTap: () {
                      onTextClick!();
                    },
                    child: textWidget ?? Text(text, style: style))
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  /// UnderlineDecoration, BoxLooseDecoration or BoxTightDecoration
  static Widget pinTextField(
    RxString pin, {
    int codeLength = 6,
    Function(String)? call,
    bool observable = true,
  }) {
    return observable
        ? Obx(
            () => PinFieldAutoFill(
              decoration: UnderlineDecoration(
                textStyle:
                    TextStyle(fontSize: AppDimens.dimen24, color: Colors.black),
                colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
              ),
              currentCode: pin.value,
              codeLength: codeLength,
              onCodeSubmitted: (code) {
                pin.value = code;
                if (code.length == (codeLength)) {
                  if (call != null) call(code);
                }
              },
              onCodeChanged: (code) {
                pin.value = code!;
                if (code.length == (codeLength)) {
                  if (call != null) call(code);
                }
              },
            ),
          )
        : PinFieldAutoFill(
            decoration: UnderlineDecoration(
              textStyle:
                  TextStyle(fontSize: AppDimens.dimen24, color: Colors.black),
              colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
            ),
            currentCode: pin.value,
            codeLength: codeLength,
            onCodeSubmitted: (code) {
              pin.value = code;
              if (code.length == (codeLength)) {
                if (call != null) call(code);
              }
            },
            onCodeChanged: (code) {
              pin.value = code!;
              if (code.length == (codeLength)) {
                if (call != null) call(code);
              }
            },
          );
  }

  static Widget bottomNavItem({
    String? text,
    String iconAsset = "assets/images/ic_promo.svg",
    IconData? icon,
    bool isBadge = false,
    RxInt? count,
    double? badgeTextSize,
    double? badgeTextPadding,
    GestureTapCallback? onTap,
    double? iconSize,
    Color iconColor = Colors.white,
    GlobalKey<AnimatorWidgetState>? animKey,
  }) {
    count = count ?? 0.obs;
    iconSize = iconSize ?? AppDimens.dimen24;
    iconSize = SizeConfig.isTablet ? (iconSize - 3) : iconSize;
    // animKey = animKey ?? GlobalKey<AnimatorWidgetState>();

    ///return item
    return InkWell(
      splashColor: AppColors.white,
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: EdgeInsets.all(AppDimens.dimen1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            isBadge
                ? badges.Badge(
                    badgeContent: Padding(
                      padding:
                          EdgeInsets.all(badgeTextPadding ?? AppDimens.dimen5),
                      child: Text(
                        '$count',
                        style: AppTextStyles.smallerSubDescStyleBold.copyWith(
                          color: AppColors.white,
                          fontSize: badgeTextSize,
                        ),
                      ),
                    ),
                    child: icon == null
                        ? assetImage(
                            iconAsset,
                            height: iconSize,
                            width: iconSize,
                            assetColor: iconColor,
                          )
                        : Icon(
                            icon,
                            size: iconSize,
                            color: iconColor,
                          ),
                  )
                : icon == null
                    ? assetImage(
                        iconAsset,
                        height: iconSize,
                        width: iconSize,
                        assetColor: iconColor,
                      )
                    : Icon(
                        icon,
                        size: iconSize,
                        color: iconColor,
                      ),
            SizedBox(height: AppDimens.dimen2),
            text != null
                ? Text(
                    text,
                    style: AppTextStyles.subDescStyleMedium.copyWith(
                      color: iconColor,
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  static Widget pinEntryWidget(int size, RxInt fill) {
    List<Widget> row = [];
    for (int i = 1; i <= size; i++) {
      row.add(
        Obx(
          () => Container(
            margin: EdgeInsets.all(AppDimens.dimen5),
            height: AppDimens.dimen12,
            width: AppDimens.dimen12,
            decoration: BoxDecoration(
              color:
                  i <= fill.value ? AppColors.introColor2 : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.introColor2,
                width: .5,
              ),
            ),
          ),
        ),
      );
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: row);
  }

  static Widget circleEmpty({
    double? size,
    double opacity = 0.0,
    double borderWidth = 0.5,
    Color? borderColor,
    Color? backGroundColor,
    Color? colorOpacity,
    Widget child = const Icon(Icons.notifications),
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    GestureTapCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.all(5),
        margin: margin ?? const EdgeInsets.all(5),
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: backGroundColor ?? Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor ?? AppColors.black,
            width: borderWidth,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: colorOpacity ?? AppColors.grey.withOpacity(opacity),
              offset: const Offset(1.1, 1.1),
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }

  static Widget scrollingMenuItem(
    DictionaryModel mod,
    Rx<DictionaryModel> selectedDict, {
    GestureTapCallback? onTap,
    Color? activeColor,
    Color? disabledColor,
    Color? activeTextColor,
    Color? disabledTextColor,
  }) {
    bool isSelected = selectedDict.value.key == mod.key;
    return containerRoundCorners(
        onTap: onTap,
        width: AppDimens.dimen120,
        borderColor: isSelected
            ? (activeColor ?? AppColors.market)
            : (disabledColor ?? AppColors.market2),
        backgroundColor: isSelected
            ? (activeColor ?? AppColors.market)
            : (disabledColor ?? AppColors.market2),
        margin: EdgeInsets.symmetric(horizontal: AppDimens.dimen8),
        child: Text(
          mod.value,
          style: AppTextStyles.descStyleSemiBold.copyWith(
            color: isSelected
                ? (activeTextColor ?? AppColors.white)
                : (disabledTextColor ?? AppColors.market3),
          ),
        ));
  }

  static Widget containerRoundCorners({
    double? size,
    Color? borderColor,
    double? borderRadius,
    double? width,
    double? height,
    Color? backgroundColor,
    Widget child = const SizedBox(),
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    GestureTapCallback? onTap,
    DecorationImage? bgImg,
    Gradient? gradient,
    BorderRadiusGeometry? border,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.all(AppDimens.dimen10),
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.rectangle,
          image: bgImg,
          border: Border.all(
            color: borderColor ?? AppColors.white,
            width: .5,
          ),
          borderRadius: border ?? BorderRadius.circular(borderRadius ?? 10),
          gradient: gradient,
        ),
        child: Center(child: child),
      ),
    );
  }

  static Widget container({Widget? child, Color? color}) {
    return Container(
      margin: EdgeInsets.only(
        left: AppDimens.dimen5,
        bottom: AppDimens.dimen5,
      ),
      padding: EdgeInsets.all(AppDimens.dimen4),
      child: child,
      decoration: BoxDecoration(
        color: color ?? Colors.black.withOpacity(.5),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  static Widget getProfilePic({
    double? radius,
    String? url,
    GestureTapCallback? onTap,
    //Function? doneLoading,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.grey.withOpacity(0.6),
              offset: const Offset(2.0, 4.0),
              blurRadius: 8,
            ),
          ],
        ),
        child: circleImageView(
          url: url ?? profilePicURl.value,
          radius: radius ?? AppDimens.dimen30,
        ),
      ),
    );
  }

  static Widget appBarStyledWidget({
    // AnimationController? animationController,
    //Animation<double>? topBarAnimation,
    double topBarOpacity = 20,
    Widget title = const Text("Prime E-Gift", textAlign: TextAlign.center),
    Widget action =
        const Icon(Icons.notifications, color: AppColors.primaryGreenColor),
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(topBarOpacity),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppDimens.dimen32),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppColors.grey.withOpacity(0.4 * topBarOpacity),
              offset: const Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: Column(
        children: <Widget>[
          // SizedBox(
          //   height: MediaQuery.of(context).padding.top,
          // ),
          Padding(
            padding: EdgeInsets.only(
                left: AppDimens.dimen16,
                right: AppDimens.dimen16,
                top: AppDimens.dimen16 - AppDimens.dimen8 * topBarOpacity,
                bottom: AppDimens.dimen12 - AppDimens.dimen8 * topBarOpacity),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(AppDimens.dimen8),
                    child: title,
                  ),
                ),
                Align(
                  child: Padding(
                      padding: EdgeInsets.only(right: AppDimens.dimen5),
                      child: action),
                  alignment: Alignment.centerRight,
                )
              ],
            ),
          )
        ],
      ),
    );
    /*Transform.translate(
      offset: Offset(0, -AppDimens.dimen14),
      child: Column(
        children: <Widget>[
          AnimatedBuilder(
            animation: animationController!,
            builder: (context, child) {
              return FadeTransition(
                opacity: topBarAnimation!,
                child: Transform(
                  transform: Matrix4.translationValues(
                      0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(topBarOpacity),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(AppDimens.dimen32),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color:
                                AppColors.grey.withOpacity(0.4 * topBarOpacity),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).padding.top,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: AppDimens.dimen16,
                              right: AppDimens.dimen16,
                              top: AppDimens.dimen16 -
                                  AppDimens.dimen8 * topBarOpacity,
                              bottom: AppDimens.dimen12 -
                                  AppDimens.dimen8 * topBarOpacity),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(AppDimens.dimen8),
                                  child: title,
                                ),
                              ),
                              Align(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        right: AppDimens.dimen5),
                                    child: action),
                                alignment: Alignment.centerRight,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );*/
  }

  static Widget chatBarWidget({
    TextEditingController? ctr,
    Color backgroundColor = Colors.white,
    String hintText = "Type here...",
    Function(String)? onFieldSubmitted,
  }) {
    return Padding(
      padding: EdgeInsets.all(AppDimens.dimen10),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: AppDimens.dimen45,
              padding: EdgeInsets.only(
                  left: AppDimens.dimen10, right: AppDimens.dimen10),
              decoration: deco(borderRadius: 20),
              child: Center(
                child: TextFormField(
                  textInputAction: TextInputAction.go,
                  controller: ctr,
                  onFieldSubmitted: (val) {
                    if (onFieldSubmitted != null) {
                      onFieldSubmitted(val);
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(AppDimens.dimen2),
                    isDense: true,
                    //  labelText: hintText,
                    hintText: hintText,
                    hintStyle: AppTextStyles.descStyleLight
                        .copyWith(color: AppColors.deactivatedText),
                    fillColor: backgroundColor,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: backgroundColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: backgroundColor),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: backgroundColor),
                    ),
                  ),
                  style: AppTextStyles.descStyleRegular,
                ),
              ),
            ),
          ),
          SizedBox(width: AppDimens.dimen20),
          Flexible(
            flex: 0,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: AppColors.primaryGreenColor,
              onPressed: () {},
              child: const Icon(Icons.send),
            ),
          )
        ],
      ),
    );
  }

  static Widget searchBarWidget({
    String? hintText,
    String? text,
    Color backgroundColor = Colors.white,
    double borderRadius = 0,
    Function(String)? onSearchChanged,
    Function(String)? onFieldSubmitted,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    GestureTapCallback? onTap,
    TextEditingController? ctr,
    IconData? icon,
    Widget? trailWidget,
    TextStyle? textStyle,
    TextStyle? hintTextStyle,
    double? height,
    Color? borderColor,
    bool enabled = true,
    double opacity = 0.4,
    Widget? leadingWidget,
  }) {
    var decoration = UnderlineInputBorder(
      borderSide: BorderSide(color: backgroundColor),
    );
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding ?? EdgeInsets.all(AppDimens.dimen8),
        decoration: deco(
          borderRadius: borderRadius,
          color: backgroundColor,
          opacity: opacity,
          borderColor: borderColor,
        ),
        child: Row(
          children: [
            Icon(
              icon ?? Icons.search,
              color: AppColors.deactivatedText,
              size: AppDimens.dimen15,
            ),
            SizedBox(width: AppDimens.dimen10),
            Flexible(
              child: TextFormField(
                textInputAction: TextInputAction.go,
                controller: ctr,
                enabled: enabled,
                onChanged: (val) {
                  if (onSearchChanged != null) {
                    onSearchChanged(val);
                  }
                },
                onFieldSubmitted: (val) {
                  if (onFieldSubmitted != null) {
                    onFieldSubmitted(val);
                  }
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(AppDimens.dimen2),
                  isDense: true,
                  hintText: hintText ?? "Search category...",
                  hintStyle: hintTextStyle ??
                      AppTextStyles.descStyleLight
                          .copyWith(color: AppColors.iconColor),
                  fillColor: backgroundColor,
                  disabledBorder: decoration,
                  enabledBorder: decoration,
                  focusedBorder: decoration,
                  border: decoration,
                  focusColor: backgroundColor,
                  hoverColor: backgroundColor,
                ),
                style: textStyle ?? AppTextStyles.descStyleRegular,
              ),
            ),
            trailWidget ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  static Widget appBarNotification(
    RxInt counter, {
    Color? iconColor,
    double? iconSize,
    String? asset,
    IconData? icon,
    GestureTapCallback? onTap,
  }) {
    return Obx(
      () => InkWell(
        onTap: onTap,
        child: badges.Badge(
          badgeContent: Text(
            "${counter.value}",
            style: AppTextStyles.smallSubDescStyleBold.copyWith(
              color: AppColors.white,
            ),
          ),
          badgeAnimation: const badges.BadgeAnimation.slide(),
          child: asset == null
              ? Icon(
                  icon ?? Icons.notifications,
                  color: iconColor ?? AppColors.primaryGreenColor,
                  size: iconSize ?? AppDimens.dimen28,
                )
              : assetImage(
                  asset ?? "assets/images/ic_basket.svg",
                  height: AppDimens.dimen20,
                  width: AppDimens.dimen20,
                  assetColor: iconColor ?? AppColors.market,
                ),
        ),
      ),
    );
  }

  static Widget appBarLocationWidget({
    String text = "Lapaz Beezroot Street 34, Accra Ghana", //todo remove this
    EdgeInsetsGeometry margin = const EdgeInsets.all(5),
    required GestureTapCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: margin,
        child: Container(
          padding: EdgeInsets.all(AppDimens.dimen5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.transparent,
            border: Border.all(
              color: AppColors.black,
              width: .5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.location_on,
                color: AppColors.primaryGreenColor,
                size: AppDimens.dimen18,
              ),
              SizedBox(width: AppDimens.dimen5),
              Flexible(
                child: RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(children: [
                    TextSpan(
                      text: text,
                      style: AppTextStyles.subDescStyleLight
                          .copyWith(color: AppColors.black),
                    ),
                  ]),
                ),
              ),
              SizedBox(width: AppDimens.dimen5),
              Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColors.primaryGreenColor,
                size: AppDimens.dimen20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget titleIconWidget(
      {String? asset,
      IconData? icon,
      String title = '',
      TextStyle? titleStyle,
      String subTitle = '',
      GestureTapCallback? onTap,
      EdgeInsetsGeometry? padding}) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              size: AppDimens.dimen20,
            ),
          if (icon == null)
            assetImage(asset ?? AssetsConfig.nearByIcon,
                width: AppDimens.dimen20, height: AppDimens.dimen20),
          SizedBox(width: AppDimens.dimen10),
          Expanded(
              child: Text(title, style: titleStyle ?? AppTextStyles.title)),
          SizedBox(width: AppDimens.dimen10),
          if (onTap != null)
            InkWell(
              child: Row(
                children: [
                  Text(subTitle, style: AppTextStyles.descStyleRegular),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: AppDimens.dimen14,
                    color: AppColors.primaryGreenColor,
                  )
                ],
              ),
              onTap: onTap,
            ),
        ],
      ),
    );
  }

  static Widget titleView({
    String title = "",
    Widget subTitle = const SizedBox(),
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
  }) {
    return Container(
      color: backgroundColor ?? AppColors.background,
      margin: padding ??
          EdgeInsets.only(left: AppDimens.dimen20, right: AppDimens.dimen10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: textStyle ??
                  AppTextStyles.titleStyleSemiBold.copyWith(
                    color: AppColors.black,
                  ),
            ),
          ),
          subTitle,
        ],
      ),
    );
  }

  static Widget subTitleView(
      {String text = "",
      Function? onSubTextOnClick,
      int podLength = 0,
      RxInt? currentIndex,
      TextStyle? style,
      EdgeInsetsGeometry padding = EdgeInsets.zero}) {
    return InkWell(
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.all(Radius.circular(AppDimens.dimen5)),
      onTap: () {
        if (onSubTextOnClick != null) {
          onSubTextOnClick();
        }
      },
      child: podLength > 0
          ? pod(podLength, currentIndex ?? 0.obs)
          : Padding(
              padding: padding,
              child: Row(
                children: <Widget>[
                  Text(
                    text,
                    textAlign: TextAlign.left,
                    style: style ??
                        AppTextStyles.subDescRegular
                            .copyWith(color: AppColors.primaryGreenColor),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: style == null
                        ? AppColors.primaryGreenColor
                        : style.color,
                    size: AppDimens.dimen14,
                  ),
                ],
              ),
            ),
    );
  }

  static Widget pod(
    int podLength,
    RxInt currentIndex, {
    Function(int)? onTap,
    double? podSize,
    bool rectPod = false,
    Color? activeColor,
  }) {
    if (currentIndex.value > podLength) {
      currentIndex.value = 0;
    }
    List<Widget> list = [];
    for (int i = 0; i < podLength; i++) {
      list.add(Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: InkWell(
            onTap: () {
              if (onTap != null) {
                onTap(i);
              }
            },
            child: rectPod
                ? Container(
                    width: currentIndex.value == i
                        ? AppDimens.dimen24
                        : AppDimens.dimen16,
                    height: currentIndex.value == i
                        ? AppDimens.dimen5
                        : AppDimens.dimen4,
                    margin: EdgeInsets.only(right: AppDimens.dimen5),
                    decoration: deco(
                      color: currentIndex.value == i
                          ? activeColor ?? AppColors.introColor2
                          : AppColors.introColor3,
                      opacity: 0.2,
                    ),
                  )
                : currentIndex.value >= 0
                    ? Container(
                        width: currentIndex.value == i
                            ? podSize ?? AppDimens.dimen32
                            : AppDimens.dimen24,
                        height: currentIndex.value == i
                            ? AppDimens.dimen10
                            : AppDimens.dimen5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex.value == i
                              ? activeColor ?? AppColors.introColor2
                              : AppColors.introColor3,
                        ),
                      )
                    : Container(
                        width: AppDimens.dimen24,
                        height: AppDimens.dimen5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.introColor3,
                        ),
                      ),
          ),
        ),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list,
    );
  }

  static Widget homeSearchBar({
    required Function(String) onSearchChanged,
    GestureTapCallback? onFilterClick,
    GestureTapCallback? onTap,
    EdgeInsetsGeometry? padding,
    Color? filterBgColor,
    Color? filterIconColor,
    String? hintText,
    Gradient? gradient,
    String? text,
    bool enabled = true,
    TextEditingController? controller,
  }) {
    return FadeInUp(
      child: Padding(
        padding: padding ??
            EdgeInsets.only(
              left: AppDimens.dimen16,
              right: AppDimens.dimen16,
            ),
        child: Row(
          children: [
            Flexible(
              child: searchBarWidget(
                opacity: .2,
                onTap: onTap,
                onSearchChanged: onSearchChanged,
                borderRadius: 10,
                hintText: hintText,
                ctr: controller,
                enabled: enabled,
              ),
            ),
            SizedBox(width: AppDimens.dimen5),
            onFilterClick != null
                ? containerRoundCorners(
                    backgroundColor: filterBgColor ?? AppColors.introColor2,
                    child: assetImage(
                      "assets/images/ic_filter.svg",
                      height: AppDimens.dimen20,
                      width: AppDimens.dimen20,
                      assetColor: filterIconColor ?? AppColors.white,
                    ),
                    gradient: gradient,
                    onTap: onFilterClick,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  static Widget rectangularMenuItem({
    required CategoryModel cat,
    Function(CategoryModel)? onMenuOnClick,
  }) {
    return InkWell(
      onTap: () {
        if (onMenuOnClick != null) {
          onMenuOnClick(cat);
        }
      },
      child: Container(
        width: AppDimens.dimen140,
        decoration: deco(
          borderRadius: 5,
          borderColor: cat.isSelected
              ? AppColors.primaryGreenColor
              : AppColors.backgroundExt,
          color: AppColors.white,
          opacity: 0,
        ),
        padding: EdgeInsets.symmetric(horizontal: AppDimens.dimen8),
        margin: EdgeInsets.only(
          left: AppDimens.dimen5,
          right: AppDimens.dimen5,
          bottom: AppDimens.dimen3,
          top: AppDimens.dimen8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageLoader(
              url: cat.logo.isNotEmpty ? cat.logo : cat.image,
              heroTag: cat.name,
              height: AppDimens.dimen28,
              width: AppDimens.dimen28,
              placeHolder: UiApi.assetImage(
                "assets/images/ic_rect.png",
                height: AppDimens.dimen28,
                width: AppDimens.dimen28,
              ),
            ),
            SizedBox(width: AppDimens.dimen5),
            Expanded(
                child: Text(cat.name, style: AppTextStyles.subDescRegular)),
          ],
        ),
      ),
    );
  }

  static Widget menuItemWidget({
    String imagePath = "",
    String menuTitle = "",
    Function? onMenuOnClick,
    double borderRadius = 15,
    double opacity = 0.4,
    double? height,
    double? width,
    double? iconSize,
    double? iconPadding,
    double topPad = 1,
    double bottomPad = 1,
    double? padding,
    double? containerPadding,
    Color? borderColor,
    Color? circularColor,
    TextStyle? textStyle,
    bool circularIcon = false,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? border,
  }) {
    return FadeInUp(
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: EdgeInsets.all(containerPadding ?? AppDimens.dimen3),
        decoration: deco(
          border: border,
          borderRadius: borderRadius,
          opacity: opacity,
          borderColor: borderColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            splashColor: AppColors.lineColor.withOpacity(0.2),
            onTap: () {
              if (onMenuOnClick != null) {
                onMenuOnClick();
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: topPad),
                circularIcon
                    ? circleEmpty(
                        borderColor:
                            circularColor ?? AppColors.primaryGreenColor,
                        padding:
                            EdgeInsets.all(iconPadding ?? AppDimens.dimen8),
                        child: imageLoader(
                          url: imagePath,
                          heroTag: menuTitle,
                          height: iconSize ?? AppDimens.dimen28,
                          width: iconSize ?? AppDimens.dimen28,
                          placeHolder: UiApi.assetImage(
                            "assets/images/ic_rect.png",
                            height: iconSize ?? AppDimens.dimen28,
                            width: iconSize ?? AppDimens.dimen28,
                          ),
                        ),
                      )
                    : imageLoader(
                        url: imagePath,
                        heroTag: menuTitle,
                        height: iconSize ?? AppDimens.dimen35,
                        width: iconSize ?? AppDimens.dimen35,
                        placeHolder: UiApi.assetImage(
                          "assets/images/ic_rect.png",
                          height: iconSize ?? AppDimens.dimen35,
                          width: iconSize ?? AppDimens.dimen35,
                        ),
                      ),
                SizedBox(height: AppDimens.dimen3),
                Flexible(
                  child: Center(
                    child: Text(
                      menuTitle,
                      textAlign: TextAlign.center,
                      style: textStyle ?? AppTextStyles.smallSubDescStyleMedium,
                    ),
                  ),
                ),
                SizedBox(height: bottomPad),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget logoItemWidget({
    String imagePath = "",
    String menuTitle = "",
    Function? onMenuOnClick,
    double borderRadius = 15,
    double opacity = 0.2,
    double? height,
    double? width,
    double? iconSize,
    double? iconPadding,
    double topPad = 1,
    double bottomPad = 1,
    double? padding,
    double? containerPadding,
    Color? borderColor,
    Color? circularColor,
    TextStyle? textStyle,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? border,
  }) {
    return FadeInUp(
      child: Container(
        height: height,
        width: width ?? AppDimens.dimen90,
        margin: margin ?? EdgeInsets.all(AppDimens.dimen5),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.dimen3,
          vertical: AppDimens.dimen3,
        ),
        decoration: deco(
          border: border ??
              BorderRadius.vertical(
                top: Radius.circular(AppDimens.dimen60),
                bottom: Radius.circular(AppDimens.dimen60),
              ),
          borderRadius: borderRadius,
          opacity: opacity,
          borderColor: borderColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(AppDimens.dimen60)),
            splashColor: AppColors.lineColor.withOpacity(0.2),
            onTap: () {
              if (onMenuOnClick != null) {
                onMenuOnClick();
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                circleImageView(
                  url: imagePath,
                  radius: iconSize ?? AppDimens.dimen32,
                ),
                SizedBox(height: AppDimens.dimen5),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppDimens.dimen5,
                    right: AppDimens.dimen5,
                    bottom: AppDimens.dimen5,
                  ),
                  child: richText(
                    mod: [
                      RichTextModel(
                        text: menuTitle, //: TextAlign.center,
                        style: textStyle ??
                            AppTextStyles.descStyleMedium.copyWith(
                              fontSize: AppDimens.size(1.6),
                            ),
                      )
                    ],
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: AppDimens.dimen5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget menuListWidget({
    required RxList<CategoryModel> menuList,
    Function(CategoryModel)? onMenuOnClick,
    bool shouldGrid = false,
    bool rectangularShape = false,
    Widget? loader,
    EdgeInsetsGeometry? padding,
  }) {
    return FadeInUp(
      child: AspectRatio(
        // height: AppDimens.dimen150,
        aspectRatio: shouldGrid
            ? SizeConfig.getAspectRatio(v: 3.2)
            : SizeConfig.getAspectRatio(v: rectangularShape ? 7 : 2.47),

        child: Padding(
          padding: padding ??
              EdgeInsets.only(left: AppDimens.dimen3, right: AppDimens.dimen3),
          child: Obx(
            () => menuList.isNotEmpty
                ? shouldGrid
                    ? GridView(
                        padding: EdgeInsets.only(
                          left: AppDimens.dimen10,
                          right: AppDimens.dimen10,
                          top: AppDimens.dimen10,
                          bottom: AppDimens.dimen10,
                        ),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children:
                            List<Widget>.generate(menuList.length, (int index) {
                          return menuItemWidget(
                            imagePath: menuList[index].logo,
                            menuTitle: menuList[index].name,
                            onMenuOnClick: () {
                              if (onMenuOnClick != null) {
                                onMenuOnClick(menuList[index]);
                              }
                            },
                          );
                        }),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: AppDimens.subDesc,
                          crossAxisSpacing: AppDimens.subDesc,
                          childAspectRatio: 1,
                        ),
                      )
                    : ListView.builder(
                        itemCount: menuList.length,
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return rectangularShape
                              ? rectangularMenuItem(
                                  cat: menuList[index],
                                  onMenuOnClick: onMenuOnClick,
                                )
                              : menuItemWidget(
                                  imagePath: menuList[index].logo.isNotEmpty
                                      ? menuList[index].logo
                                      : menuList[index].image,
                                  menuTitle: menuList[index].name,
                                  topPad: AppDimens.dimen5,
                                  bottomPad: AppDimens.dimen20,
                                  iconSize: AppDimens.dimen38,
                                  padding: AppDimens.dimen8,
                                  textStyle: AppTextStyles.descStyleRegular
                                      .copyWith(fontSize: AppDimens.size(1.6)),
                                  border: BorderRadius.vertical(
                                    top: Radius.circular(AppDimens.dimen55),
                                    bottom: Radius.circular(AppDimens.dimen55),
                                  ),
                                  margin: EdgeInsets.only(
                                    right: AppDimens.dimen6,
                                    top: AppDimens.dimen5,
                                    bottom: AppDimens.dimen5,
                                    left: AppDimens.dimen6,
                                  ),
                                  width: AppDimens.dimen92,
                                  circularIcon: true,
                                  onMenuOnClick: () {
                                    if (onMenuOnClick != null) {
                                      onMenuOnClick(menuList[index]);
                                    }
                                  },
                                );
                        })
                : rectangularShape
                    ? circularProgressIndicator(radius: AppDimens.dimen16)
                    : loader ??
                        const ListTileShimmer(
                          hasBottomBox: true,
                          hasCustomColors: true,
                          isDisabledAvatar: true,
                        ),
          ),
        ),
      ),
    );
  }

  static Widget shopLogoListWidget({
    required RxList<ShopModel> storeList,
    Function(ShopModel)? onStoreOnClick,
    bool shouldGrid = false,
  }) {
    return FadeInUp(
      child: AspectRatio(
        aspectRatio: shouldGrid
            ? SizeConfig.getAspectRatio(v: 3.2)
            : SizeConfig.getAspectRatio(v: 2.5),
        child: Padding(
          padding:
              EdgeInsets.only(left: AppDimens.dimen3, right: AppDimens.dimen3),
          child: Obx(
            () => storeList.isNotEmpty
                ? shouldGrid
                    ? GridView(
                        padding: EdgeInsets.only(
                          left: AppDimens.dimen10,
                          right: AppDimens.dimen10,
                          top: AppDimens.dimen10,
                          bottom: AppDimens.dimen10,
                        ),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: List<Widget>.generate(storeList.length,
                            (int index) {
                          return logoItemWidget(
                            imagePath: storeList[index].logo,
                            menuTitle: Utils.capitalizeLetter(
                                val: storeList[index].name,
                                capAllFirstLetters: true),
                            borderColor: AppColors.white,
                            onMenuOnClick: () {
                              if (onStoreOnClick != null) {
                                onStoreOnClick(storeList[index]);
                              }
                            },
                          );
                        }),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: AppDimens.subDesc,
                          crossAxisSpacing: AppDimens.subDesc,
                          childAspectRatio: 1,
                        ),
                      )
                    : ListView.builder(
                        itemCount: storeList.length,
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return logoItemWidget(
                            imagePath: storeList[index].logo,
                            menuTitle: Utils.capitalizeLetter(
                              val: storeList[index].name,
                              capAllFirstLetters: true,
                            ),
                            onMenuOnClick: () {
                              if (onStoreOnClick != null) {
                                onStoreOnClick(storeList[index]);
                              }
                            },
                          );
                        })
                : const ListTileShimmer(
                    hasBottomBox: true,
                    hasCustomColors: true,
                    isDisabledAvatar: true,
                  ),
          ),
        ),
      ),
    );
  }

  static Widget elevatedImageLoader({
    double? height,
    double? width,
    double borderRadius = 10,
    String? heroTag,
    String? url,
    BoxFit? fit,
    Widget? placeHolder,
    double opacity = 0.4,
    bool isCircular = false,
    bool setOverlay = false,
    double? amount,
    String? showMerchantName,
  }) {
    return Container(
      decoration: deco(opacity: opacity, borderRadius: borderRadius),
      height: height,
      width: width,
      child: imageLoader(
        height: height,
        width: width,
        border: borderRadius,
        heroTag: heroTag,
        url: url,
        fit: fit,
        placeHolder: placeHolder,
        setOverlay: setOverlay,
      ),
    );
  }

  static Widget carouselSlider({
    double? viewportFraction,
    double? aspectRatio,
    double? height,
    RxInt? currentPod,
    bool? enlargeCenterPage,
    List<Widget>? list,
  }) {
    currentPod = currentPod ?? 0.obs;
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          enableInfiniteScroll: true,
          reverse: true,
          height: height,
          enlargeCenterPage: enlargeCenterPage,
          autoPlayCurve: Curves.easeIn,
          scrollPhysics: const BouncingScrollPhysics(),
          aspectRatio: SizeConfig.getAspectRatio(v: aspectRatio ?? 1.47),
          viewportFraction: viewportFraction ?? 1,
          onPageChanged: (index, val) {
            currentPod!.value = index;
          }),
      items: list,
    );
  }

  static Widget imageLoader({
    double? height,
    double? width,
    double? border,
    BorderRadiusGeometry? borderRadius,
    String? heroTag,
    String? url,
    BoxFit? fit,
    Widget? placeHolder,
    bool setOverlay = false,
    Function? doneLoading,
  }) {
    double progressSize = height == null ? AppDimens.dimen18 : (height / 4);
    try {
      url = url?.trim();

      if ((url ?? '').isEmpty) {
        return placeHolder ??
            UiApi.circularProgressIndicator(radius: progressSize);
      }

      var image = CachedNetworkImage(
        imageUrl: url ?? "",
        height: height ?? SizeConfig.screenWidth,
        width: width ?? SizeConfig.screenWidth,
        fit: fit ?? BoxFit.fill,
        placeholder: (context, url) =>
            placeHolder ??
            UiApi.circularProgressIndicator(radius: progressSize),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          size: progressSize,
          color: AppColors.redLight,
        ),
      );

      return Stack(
        children: [
          ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(border ?? 10),
            child: heroTag != null
                ? Hero(
                    tag: heroTag,
                    transitionOnUserGestures: true,
                    child: image,
                  )
                : image,
          ),
          setOverlay
              ? Container(
                  height: height ?? SizeConfig.screenWidth,
                  width: width ?? SizeConfig.screenWidth,
                  color: AppColors.blackOpacity,
                )
              : const SizedBox(),
        ],
      );
    } catch (e) {
      debugPrint("Exception Loading image  $e");
      return placeHolder ??
          UiApi.circularProgressIndicator(radius: progressSize);
    }
  }

  static Decoration deco({
    BorderRadiusGeometry? border,
    double borderRadius = 10,
    double opacity = 0.4,
    double borderWidth = 1,
    Color? color,
    Color? borderColor,
    Color? colorOpacity,
    double blurRadius = 5,
    BoxBorder? borderSide,
    bool applyBorder = true,
    Gradient? gradient,
  }) {
    return BoxDecoration(
      color: color ?? AppColors.white,
      borderRadius: applyBorder
          ? (border ?? BorderRadius.all(Radius.circular(borderRadius)))
          : null,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: colorOpacity ?? AppColors.grey.withOpacity(opacity),
          offset: const Offset(1.1, 1.1),
          blurRadius: blurRadius,
        ),
      ],
      border: borderSide ??
          Border.all(
            color: borderColor ?? AppColors.white,
            width: borderWidth,
          ),
      gradient: gradient,
    );
  }

  static Widget moreWidget({
    Color? color,
    String title = "",
    TextStyle? textStyle,
    RxBool? isCollapsed,
    Widget child = const Text(""),
  }) {
    isCollapsed = isCollapsed ?? false.obs;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: AppDimens.dimen16, right: AppDimens.dimen16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(title,
                        style: textStyle ?? AppTextStyles.titleStyleBold)),
                InkWell(
                  onTap: () {
                    isCollapsed?.value = !isCollapsed.value;
                  },
                  child: Icon(
                      isCollapsed!.value
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      size: AppDimens.dimen30,
                      color: AppColors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: AppDimens.dimen3),
          isCollapsed.value ? const SizedBox() : child,
          SizedBox(height: AppDimens.dimen20),
        ],
      ),
    );
  }

  static noDataWidget({
    String? asset,
    String? url,
    Color? assetColor,
    String? title,
    String? message,
    double? assetSize,
    Widget? button,
    Widget? child,
    EdgeInsetsGeometry? padding,
  }) {
    return Padding(
      padding: EdgeInsets.all(AppDimens.dimen16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            child ??
                (url == null
                    ? assetImage(asset ?? "assets/images/ic_cart_file.png",
                        height: assetSize ?? AppDimens.dimen170,
                        width: assetSize ?? AppDimens.dimen170,
                        assetColor: assetColor)
                    : imageLoader(
                        url: url,
                        height: assetSize ?? AppDimens.dimen170,
                        width: assetSize ?? AppDimens.dimen170)),
            SizedBox(height: AppDimens.dimen30),
            Text(
              title ?? "Empty Cart",
              style: AppTextStyles.titleStyleBold
                  .copyWith(fontSize: AppDimens.dimen18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimens.dimen20),
            Text(
              message ??
                  "You currently don't have any card added to your cart. Kindly go back to your home screen to start adding cards to your cart.",
              style: AppTextStyles.descStyleLight,
              textAlign: TextAlign.center,
            ),
            button ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

  static Widget billWidget(String title, String amount,
      {bool showBorder = true,
      bool bolder = false,
      IconData? icon,
      String? asset}) {
    return Card(
      elevation: 0,
      color: AppColors.white,
      shape: Border(
        bottom: BorderSide(
            color: AppColors.kOffWhiteColor, width: showBorder ? 1 : 0),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: AppDimens.dimen16,
          right: AppDimens.dimen10,
          left: AppDimens.dimen10,
          top: AppDimens.dimen16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Row(
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    size: AppDimens.dimen16,
                    color: AppColors.iconColor,
                  ),
                if (asset != null)
                  assetImage(
                    asset,
                    height: AppDimens.dimen16,
                    width: AppDimens.dimen16,
                  ),
                if (icon != null || asset != null)
                  SizedBox(width: AppDimens.dimen5),
                Text(title,
                    style: bolder
                        ? AppTextStyles.descStyleBold
                        : AppTextStyles.descStyleRegular),
              ],
            )),
            Flexible(
                child: Text(NumberUtils.getCurrencyAmount(amount, dec: 2),
                    style: AppTextStyles.h5StyleSemiBold)),
          ],
        ),
      ),
    );
  }

  static Widget paymentRadioButtonWidget({
    required List<PaymentOptions> list,
    required Rx<PaymentOptions> defaultValue,
    Function(PaymentOptions)? onTap,
  }) {
    return Container(
      decoration: deco(opacity: 0.4),
      padding: EdgeInsets.all(AppDimens.dimen10),
      margin: EdgeInsets.only(top: AppDimens.dimen10),
      child: Column(
        children: [
          ...list.map((pay) => payOptionItemWidget(pay, defaultValue, onTap,
              showBorder: pay != list.last))
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }

  static Widget payOptionItemWidget(PaymentOptions pay,
      Rx<PaymentOptions> defaultValue, Function(PaymentOptions)? onTap,
      {bool showBorder = true}) {
    List<String> assets = Utils.getOptionAsset(pay.code).split("#");
    return InkWell(
      onTap: () {
        defaultValue.value = pay;
        if (onTap != null) onTap(defaultValue.value);
      },
      child: Card(
        elevation: 0,
        shape: Border(
          bottom: BorderSide(
            color: AppColors.kOffWhiteColor,
            width: showBorder ? 1 : 0,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  assetImage(
                    assets.first,
                    height: AppDimens.dimen50,
                    width: AppDimens.dimen50,
                  ),
                  // assets.length > 1
                  //     ? assetImage(
                  //         assets.last,
                  //         height: AppDimens.dimen30,
                  //         width: AppDimens.dimen30,
                  //       )
                  //     : const SizedBox.shrink(),
                  SizedBox(width: AppDimens.dimen10),
                  Flexible(
                      child: Text(pay.name ?? "",
                          style: AppTextStyles.descStyleRegular)),
                  SizedBox(width: AppDimens.dimen10),
                ],
              ),
            ),
            Radio(
              value: pay,
              groupValue: defaultValue.value,
              visualDensity: VisualDensity.compact,
              onChanged: (d) {
                defaultValue.value = d as PaymentOptions;
                if (onTap != null) onTap(defaultValue.value);
              },
            ),
          ],
        ),
      ),
    );
  }

  static Widget bottomSlider({
    Widget child = const SizedBox.shrink(),
    Widget? bottomWidget,
    Widget? actionButton,
    double? minHeight,
    double? maxHeight,
    String title = '',
    PanelController? panelController,
    bool backdropEnabled = true,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? titlePadding,
  }) {
    return SlidingUpPanel(
      color: AppColors.background,
      minHeight: minHeight ?? AppDimens.dimen200,
      controller: panelController,
      margin: EdgeInsets.symmetric(horizontal: AppDimens.dimen10),
      maxHeight: maxHeight ?? SizeConfig.screenHeight * 0.8,
      panel: Column(
        children: [
          SizedBox(height: AppDimens.dimen20),
          Container(
            height: AppDimens.dimen5,
            width: AppDimens.dimen70,
            decoration: UiApi.deco(
              color: AppColors.general(0XFFd7d6da),
              borderColor: AppColors.general(0XFFd7d6da),
              opacity: 0,
            ),
          ),
          if (title.isNotEmpty) SizedBox(height: AppDimens.dimen10),
          if (title.isNotEmpty || actionButton != null)
            Padding(
              padding: titlePadding ?? EdgeInsets.only(left: AppDimens.dimen16),
              child: Row(
                mainAxisAlignment: actionButton == null
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: AppTextStyles.titleStyleBold),
                  if (actionButton != null) actionButton
                ],
              ),
            ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: AppDimens.dimen10),
              padding:
                  padding ?? EdgeInsets.symmetric(horizontal: AppDimens.dimen5),
              child: child,
            ),
          ),
          bottomWidget != null
              ? Column(
                  children: [
                    SizedBox(height: AppDimens.dimen20),
                    bottomWidget,
                    SizedBox(height: AppDimens.dimen20),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      backdropEnabled: backdropEnabled,
      backdropTapClosesPanel: true,
    );
  }

  static Widget radioWidget({
    required List<DictionaryModel> dict,
    required Rx<DictionaryModel> defaultValue,
    bool dirIsVertical = false,
    bool caps = true,
    TextStyle? style,
    Function(DictionaryModel)? onTap,
  }) {
    List<Widget> list = [];

    for (DictionaryModel dic in dict) {
      var v = Flexible(
          flex: dic.flex ?? 1,
          child: InkWell(
            onTap: () {
              defaultValue.value = dic;
              if (onTap != null) onTap(defaultValue.value);
            },
            child: Row(
              children: [
                Radio(
                  value: dic,
                  groupValue: defaultValue.value,
                  visualDensity: VisualDensity.compact,
                  onChanged: (d) {
                    defaultValue.value = d as DictionaryModel;
                    if (onTap != null) onTap(defaultValue.value);
                  },
                ),
                Expanded(
                  child: Text(
                    caps ? dic.key.toUpperCase() : dic.key,
                    style: style ?? AppTextStyles.subDescRegular,
                  ),
                ),
              ],
            ),
          ));
      list.add(v);
      if (dirIsVertical) {
        list.add(SizedBox(height: AppDimens.dimen16));
      }
    }
    return dirIsVertical
        ? Column(
            children: list,
            mainAxisSize: MainAxisSize.min,
          )
        : Row(children: list);
  }

  static Widget cardWidget({
    Widget? child,
    double? elevation,
    double? radius,
    double? borderWidth,
    ShapeBorder? shape,
    Color? color,
    Color? borderColor,
    BorderSide? borderSide,
    EdgeInsetsGeometry? margin,
  }) {
    return Card(
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 10),
            ),
            side: borderSide ??
                BorderSide(
                  width: borderWidth ?? 1,
                  color: borderColor ?? Colors.green,
                ),
          ),
      child: child,
      margin: margin,
      elevation: elevation ?? 5,
      color: color ?? AppColors.white,
    );
  }

  static Widget optionsWidget(
    List<DictionaryModel> list, {
    Function(DictionaryModel)? call,
    bool selectMultiple = false,
    Color? borderColor,
  }) {
    return AspectRatio(
      aspectRatio: 7,
      child: ListView.builder(
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(
            top: AppDimens.dimen10,
            // bottom: AppDimens.dimen10,
          ),
          primary: false,
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            ///Get the object
            DictionaryModel dict = list[index];
            dict.selected = dict.selected ?? false.obs;

            return Obx(
              () => Padding(
                padding: EdgeInsets.only(
                  // right: AppDimens.dimen5,
                  left: AppDimens.dimen10,
                ),
                child: InkWell(
                    onTap: () {
                      ///If one value is selected at a time
                      if (!selectMultiple) {
                        for (DictionaryModel d in list) {
                          d.selected?.value = false;
                        }
                      }

                      dict.selected?.value = !((dict.selected?.value)!);
                      if (call != null) call(dict);
                    },
                    child: Container(
                      width: SizeConfig.screenWidth * .3,
                      decoration: deco(
                        color: (dict.selected?.value)!
                            ? AppColors.primaryGreenColor
                            : AppColors.textInputBorderColor,
                        borderColor: borderColor ?? AppColors.background,
                        colorOpacity: AppColors.background.withOpacity(0.5),
                      ),
                      child: Center(
                        child: Text(
                          dict.key,
                          style: AppTextStyles.subDescStyleMedium.copyWith(
                            color: (dict.selected?.value)!
                                ? AppColors.white
                                : AppColors.introColor2,
                          ),
                        ),
                      ),
                    )),
              ),
            );
          }),
    );
  }

  static Widget createAmountWidget({
    required RxList<PrimeCardModel> cards,
    Function(CardUtils)? onAddToCart,
  }) {
    List<Widget> row = [];
    List<Widget> column = [];

    int index = -1;
    int temp = -1;
    int rowLength = AppDimens.dimen3.toInt();
    for (PrimeCardModel card in cards) {
      index++;
      CardUtils cardUtils = CardUtils(card);
      cardUtils.setIndex(index);
      cardUtils.setList(cards);

      row.add(_amountWidget(cardUtils, call: onAddToCart, showDiscount: false));

      if (index == temp + rowLength) {
        column.add(Row(
          children: row,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ));
        temp = index;
        row = <Widget>[];
      }
    }

    int leftToFull = rowLength - row.length;

    if (leftToFull % rowLength != 0) {
      for (int i = 0; i < leftToFull; i++) {
        row.add(
          Flexible(
            flex: 1,
            child: SizedBox(width: SizeConfig.screenWidth * .5),
          ),
        );
      }
    }

    column.add(
      Row(
        children: row,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );

    return Padding(
      padding:
          EdgeInsets.only(left: AppDimens.dimen14, right: AppDimens.dimen14),
      child: SingleChildScrollView(
        child: Column(
          children: column,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }

  static Widget _amountWidget(
    CardUtils cardUtils, {
    Function(CardUtils)? call,
    bool showDiscount = false,
  }) {
    return Flexible(
      flex: 1,
      child: InkWell(
          onTap: () {
            cardUtils.setSelection(!cardUtils.card.isAlreadySelected);
            cardUtils.list.removeAt(cardUtils.index);
            cardUtils.list.insert(cardUtils.index, cardUtils.card);
            if (call != null) call(cardUtils);
          },
          child: cardWidget(
            elevation: 5,
            radius: 15,
            color: cardUtils.card.isAlreadySelected
                ? AppColors.primaryGreenColor
                : AppColors.white,
            child: Container(
              width: SizeConfig.screenWidth * .5,
              //height: AppDimens.dimen28,
              margin: EdgeInsets.only(
                top: AppDimens.dimen10,
                bottom: AppDimens.dimen10,
                right: AppDimens.dimen6,
                left: AppDimens.dimen6,
              ),
              child: Center(
                child: cardUtils.promotionType ==
                            PromotionType.promotionDiscount &&
                        showDiscount
                    ? Column(
                        children: [
                          Text(
                            cardUtils.getFormattedDueAmount(dec: 0),
                            style: AppTextStyles.h5StyleBold.copyWith(
                              color: cardUtils.card.isAlreadySelected
                                  ? AppColors.white
                                  : AppColors.black,
                              // fontSize: AppDimens.dimen13,
                            ),
                          ),
                          RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      cardUtils.getFormattedCardActualAmount(),
                                  style: AppTextStyles.smallSubDescStyleRegular
                                      .copyWith(
                                    fontSize: AppDimens.dimen9,
                                    decoration: TextDecoration.lineThrough,
                                    decorationStyle: TextDecorationStyle.solid,
                                    decorationThickness: 1,
                                    color: cardUtils.card.isAlreadySelected
                                        ? AppColors.white
                                        : AppColors.primaryGreenColor,
                                  ),
                                ),
                                const TextSpan(text: ""),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Text(
                        cardUtils.getFormattedDueAmount(dec: 0),
                        style: AppTextStyles.h5StyleBold.copyWith(
                          color: cardUtils.card.isAlreadySelected
                              ? AppColors.white
                              : AppColors.black,
                          //fontSize: AppDimens.dimen13,
                        ),
                      ),
              ),
            ),
          )),
    );
  }

  static Widget reviewWidget(
    List<RatingModel> list, {
    GestureTapCallback? viewAll,
    bool showAllBtn = false,
  }) {
    List<Widget>? column = [];
    int i = 0;
    for (RatingModel ob in list) {
      i++;

      column.add(reviewItem(mod: ob, border: true));
      if (i > 10 && showAllBtn) {
        column.add(Padding(
          padding: EdgeInsets.only(
            top: AppDimens.dimen20,
            right: AppDimens.dimen24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              subTitleView(
                text: "View All...",
                style: AppTextStyles.descStyleMedium
                    .copyWith(color: AppColors.orange),
                onSubTextOnClick: viewAll,
              ),
            ],
          ),
        ));
        break;
      }
    }
    return Column(
      children: column,
    );
  }

  static Widget reviewItem({required RatingModel mod, bool border = false}) {
    return Card(
      elevation: 0,
      color: AppColors.white,
      shape: Border(
        bottom: BorderSide(color: AppColors.lineColor, width: border ? 2 : 0),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: AppDimens.dimen16,
          right: AppDimens.dimen10,
          left: AppDimens.dimen10,
          top: AppDimens.dimen16,
        ),
        child: Row(
          children: [
            circleImageView(
              url: mod.anonymous ? "" : mod.rater.profilePicUrl,
              radius: AppDimens.dimen20,
            ),
            SizedBox(width: AppDimens.dimen10),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                              mod.anonymous
                                  ? "Prime User"
                                  : Utils.capitalizeLetter(
                                      capAllFirstLetters: true,
                                      val: mod.rater.firstName,
                                    ),
                              style: AppTextStyles.descStyleSemiBold)),
                      Flexible(
                        child: ratingBar(rating: mod.rating),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimens.dimen5),
                  Text(mod.reviewMessage,
                      style: AppTextStyles.subDescStyleLight),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget infoText(
    String text, {
    TextStyle? style,
    Widget? trailing,
    Widget? child,
    Function? onTap,
    Color? color,
  }) {
    // style = style == null ? AppTextStyles.smallSubDescStyleLight : style;
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap();
      },
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  color: color ?? AppColors.orange,
                  size: AppDimens.dimen18,
                ),
                SizedBox(width: AppDimens.dimen5),
                Flexible(
                  child: child ??
                      Text(text, style: style ?? AppTextStyles.subDescRegular),
                ),
                SizedBox(width: AppDimens.dimen5),
              ],
            ),
          ),
          trailing ?? const SizedBox(),
        ],
      ),
    );
  }

  static Widget primeWallet({GestureTapCallback? onTap, double amount = 0.0}) {
    // amount = prefUtils.isDemoUser() ? 1.0 : amount;
    // print("DEM ${prefUtils.isDemoUser()}");
    return buttonExt(
      onTap: onTap,
      enabled: prefUtils.isWalletBalanceEnough(amount: amount),
      assetColor: prefUtils.isWalletBalanceEnough(amount: amount)
          ? AppColors.primaryGreenColor
          : AppColors.deactivatedText,
      error:
          "You don't have enough funds in your Prime Wallet to perform this transaction.",
      title: "Wallet balance",
      subTitle: NumberUtils.getCurrencyAmount(
        prefUtils.getWalletBalance(),
        dec: 2,
      ),
    );
  }

  static Widget primeWalletExt({double? height}) {
    ///Initialise SharedPreference

    return Stack(
      children: [
        assetImage(
          "assets/images/ic_debit_card.png",
          width: SizeConfig.screenWidth * 0.8,
          height: height ?? SizeConfig.screenWidth * 0.4,
          fit: BoxFit.fill,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppDimens.dimen30),
              Text(
                'Prime Wallet Account',
                style: AppTextStyles.titleStyleRegular.copyWith(
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: AppDimens.dimen20),
              Text(
                NumberUtils.getCurrencyAmount(
                  prefUtils.getWalletBalance(),
                  dec: 2,
                ),
                style: AppTextStyles.h4StyleBold.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget buttonExt({
    GestureTapCallback? onTap,
    GestureTapCallback? onLongTap,
    double amount = 0.0,
    bool enabled = true,
    String error = "",
    String title = "",
    String subTitle = "",
    String asset = "assets/images/ic_prime_logo_white.png",
    Color? assetColor,
    Color? borderColor,
    TextStyle? subTitleStyle,
    Decoration? decoration,
    double? assetSize,
    double? elevation,
    EdgeInsets? padding,
    Widget? bottomChild,
  }) {
    return InkWell(
      onLongPress: () {
        if (!enabled) {
          SnackBarApi.snackBarInfo(error);
          return;
        }

        if (onLongTap != null) onLongTap();
      },
      onTap: () {
        if (!enabled) {
          SnackBarApi.snackBarInfo(error);
          return;
        }

        if (onTap != null) onTap();
      },
      child: Container(
        padding: padding ??
            EdgeInsets.only(
              left: AppDimens.dimen5,
              right: AppDimens.dimen5,
              top: AppDimens.dimen3,
              bottom: AppDimens.dimen2,
            ),
        decoration: decoration ??
            deco(
                borderRadius: 10,
                opacity: elevation ?? 0.4,
                color: enabled ? AppColors.white : AppColors.kOffGrey,
                borderColor: enabled
                    ? (borderColor ?? AppColors.primaryGreenColor)
                    : AppColors.kOffGrey),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    assetImage(
                      asset,
                      assetColor: assetColor,
                      height: assetSize ?? AppDimens.dimen40,
                      width: assetSize ?? AppDimens.dimen40,
                    ),
                    SizedBox(width: AppDimens.dimen10),
                    Text(
                      title,
                      style: AppTextStyles.subDescRegular.copyWith(
                        color: enabled
                            ? AppColors.black
                            : AppColors.deactivatedText,
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Text(
                    subTitle,
                    style: subTitleStyle ??
                        AppTextStyles.h5StyleSemiBold.copyWith(
                          color: enabled
                              ? AppColors.black
                              : AppColors.deactivatedText,
                        ),
                  ),
                )
              ],
            ),
            SizedBox(height: bottomChild != null ? AppDimens.dimen2 : 0),
            bottomChild ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

  static Widget pinNumberWidget(List<dynamic> list, {Function(String)? onTap}) {
    List<Widget> widgetList = [];
    for (dynamic str in list) {
      if (str is String) {
        widgetList.add(Flexible(
          flex: 1,
          child: SizedBox(
              width: SizeConfig.screenWidth,
              child: numberWidget(str, onTap: onTap)),
        ));
      }
      if (str is Widget) {
        widgetList.add(
          Flexible(
              flex: 1,
              child: SizedBox(width: SizeConfig.screenWidth, child: str)),
        );
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widgetList,
    );
  }

  static Widget numberWidget(String text, {Function(String)? onTap}) {
    return FloatingActionButton(
      onPressed: () {
        if (onTap != null) onTap(text);
      },
      backgroundColor: Colors.transparent,
      heroTag: "_hero_$text",
      shape: const CircleBorder(),
      elevation: 0,
      child: Text(
        text,
        style:
            AppTextStyles.h2StyleMedium.copyWith(color: AppColors.introColor2),
      ),
    );
  }

  static Widget delPinWidget({GestureTapCallback? onTap}) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: const CircleBorder(),
      heroTag: "_del",
      child: Icon(
        Icons.backspace,
        size: AppDimens.dimen25,
        color: AppColors.introColor2,
      ),
    );
  }

  static Widget horizontalListView({
    required List<Widget> list,
    EdgeInsetsGeometry? padding,
    double aspectRatio = 4,
  }) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        padding: padding ??
            EdgeInsets.only(
              top: AppDimens.dimen10,
              bottom: AppDimens.dimen10,
            ),
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => list[index],
      ),
    );
  }

  static Widget listView({
    BuildContext? context,
    required List<Widget> list,
    EdgeInsetsGeometry? padding,
    Widget separator = const SizedBox(),
    Widget? loadingWidget,
    RxBool? isLoadingMore,
    ScrollController? scrollController,
  }) {
    RxBool isLoading = isLoadingMore ?? false.obs;

    list.add(SizedBox(height: AppDimens.dimen5));
    list.add(Obx(() => isLoading.value
        ? (loadingWidget ?? UiApi.loaderMore())
        : const SizedBox()));
    list.add(SizedBox(height: AppDimens.dimen50));

    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      controller: scrollController,
      padding: padding ??
          EdgeInsets.only(
            top: AppDimens.dimen16,
            left: SizeConfig.isTablet ? AppDimens.dimen30 : AppDimens.dimen24,
            right: SizeConfig.isTablet ? AppDimens.dimen30 : AppDimens.dimen24,
            bottom: context != null
                ? MediaQuery.of(context).padding.bottom
                : AppDimens.dimen50,
          ),
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) => list[index],
      separatorBuilder: (BuildContext context, int index) {
        return separator;
      },
    );
  }

  static Widget textArea(
    TextEditingController controller, {
    String? hint,
    Function(String)? onChanged,
  }) {
    return UiApi.textFormField(
      isTextArea: true,
      maxLines: SizeConfig.isTablet
          ? AppDimens.dimen4.toInt()
          : AppDimens.dimen5.toInt(),
      maxLength: 500,
      style: AppTextStyles.descStyleRegular,
      controller: controller,
      keyboardType: TextInputType.multiline,
      onChanged: onChanged,
      textCapitalization: TextCapitalization.sentences,
      hintText: hint ?? "Type your message here...",
    );
  }

  static Widget richText(
      {required List<RichTextModel> mod,
      int? maxLines,
      TextAlign? textAlign,
      TextStyle? style}) {
    List<TextSpan> span = [];

    for (RichTextModel m in mod) {
      span.add(
        TextSpan(
          text: m.monitize
              ? NumberUtils.getCurrencyAmount(m.text, dec: 2)
              : m.text,
          style: m.style ?? style ?? AppTextStyles.descStyleRegular,
        ),
      );
    }

    return RichText(
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: span),
      textAlign: textAlign ?? TextAlign.start,
    );
  }

  static Widget messageItem({Function? onTap}) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
        NavApi.fireBack();
      },
      child: Container(
        width: SizeConfig.screenWidth,
        decoration: deco(borderRadius: 5, opacity: 0.2),
        padding: EdgeInsets.all(AppDimens.dimen5),
        margin: EdgeInsets.only(
          top: AppDimens.dimen5,
          left: AppDimens.dimen2,
          right: AppDimens.dimen2,
        ),
        child: Row(
          children: [
            circleImageView(
              radius: AppDimens.dimen20,
              url:
                  "https://sweetlovemessages.net/wp-content/uploads/2021/08/Thank-You-Card-Messages-1-825x510-1.jpg",
            ),
            SizedBox(width: AppDimens.dimen10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Thank You",
                    style: AppTextStyles.descStyleBold,
                  ),
                  SizedBox(height: AppDimens.dimen5),
                  Text(
                    "You are appreciated for all you do. Thank you so much.” “The work you do is important and so appreciated.” “Sending a little heartfelt appreciation your way today!”",
                    style: AppTextStyles.subDescStyleLight,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget floatText(String text,
      {Color? color, TextStyle? style, String heroTag = "_hero"}) {
    return FloatingActionButton(
      mini: true,
      heroTag: "$text$heroTag",
      backgroundColor: color ?? AppColors.primaryGreenColor,
      child: Text(
        text,
        style:
            style ?? AppTextStyles.h5StyleBold.copyWith(color: AppColors.white),
      ),
      onPressed: () {},
    );
  }

  static Widget contactWidget(
    Contact c, {
    Function(Contact)? onDelete,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      decoration: deco(borderRadius: 2),
      width: width,
      height: height,
      margin: margin ?? EdgeInsets.only(top: AppDimens.dimen8),
      padding: EdgeInsets.all(AppDimens.dimen6),
      child: Row(
        children: [
          (c.fullName ?? "").isEmpty
              ? circleImageView(radius: AppDimens.dimen16)
              : floatText((c.fullName ?? "").substring(0, 1),
                  heroTag: c.selectedPhoneNumber ?? ""),
          SizedBox(width: AppDimens.dimen16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                richText(mod: [
                  RichTextModel(
                    text: c.fullName ?? "",
                    style: AppTextStyles.descStyleBold,
                  )
                ]),
                SizedBox(height: AppDimens.dimen6),
                Text(
                  c.selectedPhoneNumber ?? "",
                  style: AppTextStyles.subDescStyleLight,
                ),
              ],
            ),
          ),
          SizedBox(width: AppDimens.dimen16),
          InkWell(
            onTap: () {
              if (onDelete != null) {
                onDelete(c);
              }
            },
            child: assetImage(
              "assets/images/ic_trash_bin.svg",
              height: AppDimens.dimen28,
            ),
          )
        ],
      ),
    );
  }

  static Widget eFundItem(
    EfundRequestModel mod, {
    Function(BaseObject, CardUtils, bool)? onTap,
  }) {
    bool isYou = prefUtils.isYou(phone: mod.requester.eFundPhone);
    String requesterName =
        "${mod.requester.person?.firstName} ${mod.requester.person?.surname}";
    requesterName = (requesterName.isEmpty || mod.requester.person == null)
        ? "Not Prime User"
        : requesterName;

    // //List of Cards
    // List<Widget> cardsList = [];
    // for (EfundCardModel card in mod.items) {
    //   cardsList.add(Padding(
    //     padding: EdgeInsets.only(right: AppDimens.dimen5),
    //     child: Ca.elevatedCard(
    //       card: card.card,
    //       height: AppDimens.dimen50,
    //       width: AppDimens.dimen100,
    //       borderRadius: 5,
    //     ),
    //   ));
    // }

    //List of potential Funders
    List<Widget> potentialFundersList = [];
    for (Customer cust in mod.potentialFunders) {
      potentialFundersList.add(Center(
        child: Padding(
          padding: EdgeInsets.only(right: AppDimens.dimen10),
          child: Text(
            cust.eFundPhone,
            style: AppTextStyles.smallSubDescStyleRegular
                .copyWith(color: AppColors.primaryGreenColor),
          ),
        ),
      ));
      /* potentialFundersList.add(Container(
        decoration: UiApi.deco(
            opacity: 0.1,
            borderColor: AppColors.primaryGreenColor,
            borderRadius: 20),
        margin: EdgeInsets.all(AppDimens.dimen3),
        padding: EdgeInsets.all(AppDimens.dimen3),
        child: Center(
          child: Text(
            cust.eFundPhone,
            style: AppTextStyles.subDescStyleLight
                .copyWith(color: AppColors.primaryGreenColor),
          ),
        ),
      ));*/
    }

    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(mod, CardUtils(const PrimeCardModel()), false);
        }
      },
      child: Container(
        decoration: UiApi.deco(
          opacity: 0,
          applyBorder: false,
          borderSide: const Border(
            bottom: BorderSide(color: AppColors.dimWhite, width: 1),
          ),
        ),
        padding: EdgeInsets.all(AppDimens.dimen8),
        child: Row(
          children: [
            Flexible(
              flex: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateTimeUtils.formatDateString(mod.createdAt, format: "dd"),
                    style: AppTextStyles.h5StyleMedium
                        .copyWith(color: AppColors.lightDark),
                  ),
                  SizedBox(height: AppDimens.dimen3),
                  Text(
                    DateTimeUtils.formatDateString(mod.createdAt,
                        format: "MMM yy"),
                    style: AppTextStyles.subDescStyleLight
                        .copyWith(fontSize: AppDimens.dimen10)
                        .copyWith(color: AppColors.lightDark),
                  ),
                  SizedBox(height: AppDimens.dimen2),
                  Text(
                    DateTimeUtils.formatDateString(mod.createdAt,
                        format: "hh:mm aa"),
                    style: AppTextStyles.smallestSubDescStyleRegular
                        .copyWith(color: AppColors.lightDark),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppDimens.dimen8),
            Flexible(
              flex: 0,
              child: Container(
                width: .6,
                height: AppDimens.dimen55,
                color: AppColors.kSmokeWhite,
              ),
            ),
            SizedBox(width: AppDimens.dimen8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UiApi.richText(
                        mod: [
                          RichTextModel(
                            text: "Amount:  ",
                            style: AppTextStyles.smallerSubDescStyleLight,
                          ),
                          RichTextModel(
                            text: NumberUtils.getCurrencyAmount(
                              mod.totalAmount,
                              dec: 2,
                            ),
                            style: AppTextStyles.smallSubDescStyleBold,
                          )
                        ],
                      ),
                      Icon(
                        Icons.open_in_browser_rounded,
                        size: AppDimens.dimen16,
                      )
                    ],
                  ),
                  SizedBox(height: AppDimens.dimen2),
                  UiApi.richText(
                    mod: [
                      RichTextModel(
                        text: "Status:  ",
                        style: AppTextStyles.smallerSubDescStyleLight,
                      ),
                      RichTextModel(
                        text: mod.status.toUpperCase().replaceAll("_", " "),
                        style: AppTextStyles.smallerSubDescStyleSemiBold
                            .copyWith(
                                color:
                                    CardUtils.getEFundStatusColor(mod.status)),
                      )
                    ],
                  ),
                  SizedBox(height: AppDimens.dimen2),
                  UiApi.richText(
                    maxLines: 2,
                    mod: [
                      RichTextModel(
                        text: "Message:  ",
                        style: AppTextStyles.smallerSubDescStyleLight,
                      ),
                      RichTextModel(
                        text: mod.message,
                        style: AppTextStyles.smallSubDescStyleRegular,
                      )
                    ],
                  ),
                  SizedBox(height: AppDimens.dimen3),
                  isYou
                      ? Row(
                          children: [
                            Text(
                              "To:  ",
                              style: AppTextStyles.smallSubDescStyleLight,
                            ),
                            Expanded(
                              child: SizedBox(
                                child: ListView(
                                  children: potentialFundersList,
                                  scrollDirection: Axis.horizontal,
                                ),
                                height: AppDimens.dimen16,
                                width: SizeConfig.screenWidth,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Text(
                              "From:  ",
                              style: AppTextStyles.smallerSubDescStyleLight,
                            ),
                            Icon(Icons.person, size: AppDimens.dimen14),
                            SizedBox(width: AppDimens.dimen8),
                            UiApi.richText(mod: [
                              RichTextModel(
                                text: requesterName,
                                style: AppTextStyles.subDescStyleBold,
                              )
                            ])
                          ],
                        ),
                  SizedBox(height: AppDimens.dimen3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget potentialCustomers(List<Customer> list) {
    return SizedBox(
      height: AppDimens.dimen80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (ctx, ind) {
            return eFundContactWidget(list[ind]);
          }),
    );
  }

  static Widget eFundContactWidget(
    Customer c, {
    Function(Customer)? onTap,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    Decoration? decor,
  }) {
    String name = "${c.person?.firstName} ${c.person?.firstName}";
    name = (name.isEmpty || c.person == null) ? "Not Prime User" : name;
    return Container(
      decoration: decor ?? deco(borderRadius: 2),
      width: width ?? SizeConfig.screenWidth * .7,
      height: height,
      margin: margin ??
          EdgeInsets.only(
            right: AppDimens.dimen8,
            top: AppDimens.dimen8,
            bottom: AppDimens.dimen8,
            left: AppDimens.dimen2,
          ),
      padding: EdgeInsets.all(AppDimens.dimen8),
      child: Row(
        children: [
          circleImageView(
              radius: AppDimens.dimen16, url: c.person?.profilePicUrl ?? ""),
          SizedBox(width: AppDimens.dimen16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                richText(mod: [
                  RichTextModel(text: name, style: AppTextStyles.descStyleBold)
                ]),
                SizedBox(height: AppDimens.dimen6),
                Text(
                  c.eFundPhone,
                  style: AppTextStyles.subDescStyleLight,
                ),
              ],
            ),
          ),
          //SizedBox(width: AppDimens.dimen16)
        ],
      ),
    );
  }

  static Widget buttonChild({
    String asset = "assets/images/ic_market.svg",
    String text = "",
    Widget? icon,
    TextStyle? style,
    double? assetSize,
    Color? assetColor,
    Color? textColor,
    bool assetHasLayer = true,
    MainAxisAlignment? mainAxis,
  }) {
    return Row(
      mainAxisAlignment: mainAxis ?? MainAxisAlignment.spaceBetween,
      children: [
        icon ??
            (assetHasLayer
                ? circleEmpty(
                    borderColor: Colors.white.withOpacity(.3),
                    backGroundColor: Colors.white.withOpacity(.3),
                    margin: EdgeInsets.zero,
                    child: assetImage(
                      asset,
                      height: assetSize ?? AppDimens.dimen20,
                      width: assetSize ?? AppDimens.dimen20,
                      assetColor: assetColor,
                    ),
                  )
                : assetImage(
                    asset,
                    height: assetSize ?? AppDimens.dimen20,
                    width: assetSize ?? AppDimens.dimen20,
                    assetColor: assetColor,
                  )),
        //  SizedBox(width: AppDimens.dimen10),
        Flexible(
          child: richText(
            mod: [
              RichTextModel(
                text: text,
                style: style ??
                    AppTextStyles.titleStyleBold.copyWith(
                      color: textColor ?? AppColors.white,
                    ),
              )
            ],
          ),
        ),
        const SizedBox(),
      ],
    );
  }

  static void emojiPicker(Function(Category? category, Emoji emoji) call) {
    var emoji = EmojiPicker(
      onEmojiSelected: (category, emoji) {
        Get.back();
        call(category, emoji);
      },
      onBackspacePressed: () {
        //print("he ll");
      },
      config: Config(
        skinToneConfig: const SkinToneConfig(
          dialogBackgroundColor: Color(0xFFF2F2F2),
        ),
        categoryViewConfig: const CategoryViewConfig(
          tabIndicatorAnimDuration: kTabScrollDuration,
          categoryIcons: CategoryIcons(),
          initCategory: Category.RECENT,
          indicatorColor: AppColors.primaryGreenColor,
          iconColor: Colors.grey,
          iconColorSelected: AppColors.primaryGreenColor,
          backspaceColor: AppColors.primaryGreenColor,
        ),
        emojiViewConfig: EmojiViewConfig(
          columns: 7,
          emojiSizeMax: AppDimens.dimen25,
          verticalSpacing: 0,
          horizontalSpacing: 0,
          recentsLimit: 28,
          buttonMode: ButtonMode.MATERIAL,
        ),
      ),
    );

    DialogsApi.showBottomSheet(
      containerSize: AppDimens.dimen350,
      mainChild: emoji,
      showButton: false,
      margin: EdgeInsets.only(
        left: AppDimens.dimen5,
        right: AppDimens.dimen5,
      ),
    );
    //DialogsApi.showBottomSheet(child: emoji);
  }

  static void popUpContainer({
    required BuildContext context,
    double borderRadius = 30,
    Color? backgroundColor,
    Widget? child,
  }) {
    showDialog(
        context: context,
        builder: (ctx) {
          return BounceInRight(
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              backgroundColor: backgroundColor ?? AppColors.black,
              child: Padding(
                padding: EdgeInsets.all(AppDimens.dimen10),
                child: child,
              ),
            ),
          );
        });
  }

  static void pop(BuildContext context, String emoji,
      {Function? done, IconData? icon, Color iconColor = Colors.red}) {
    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (_) => BounceOutUp(
              preferences: AnimationPreferences(
                  duration: const Duration(seconds: 3),
                  animationStatusListener: (anim) {
                    if (anim == AnimationStatus.completed) {
                      NavApi.fireBack();
                      if (done != null) {
                        done();
                      }
                    }
                  }),
              child: DialogEmoji(
                child: FloatingActionButton(
                    mini: true,
                    backgroundColor: AppColors.deactivatedText,
                    onPressed: () {},
                    child: Center(
                      child: icon == null
                          ? Text(emoji, style: AppTextStyles.h3StyleBold)
                          : Icon(
                              icon,
                              size: AppDimens.dimen20,
                              color: iconColor,
                            ),
                    ),),
              ),
            ));
  }

  static leftChatWidget() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: SizeConfig.screenWidth * 0.7,
        padding: EdgeInsets.all(AppDimens.dimen10),
        decoration: deco(
          border: const BorderRadius.only(bottomRight: Radius.circular(30)),
          color: AppColors.background,
          borderColor: AppColors.background,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hello this a testing messsage from the left side",
                style: AppTextStyles.smallSubDescStyleRegular,
              ),
            ),
            SizedBox(height: AppDimens.dimen3),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "5th Feb, 04:45 pm",
                style: AppTextStyles.smallestSubDescStyleRegular.copyWith(
                  color: AppColors.deactivatedText,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static rightChatWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: SizeConfig.screenWidth * 0.7,
        padding: EdgeInsets.all(AppDimens.dimen10),
        decoration: deco(
          border: const BorderRadius.only(bottomLeft: Radius.circular(30)),
          color: AppColors.background,
          borderColor: AppColors.background,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hello this a testing messsage from the left side",
                style: AppTextStyles.smallSubDescStyleRegular,
              ),
            ),
            SizedBox(height: AppDimens.dimen3),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "5th Feb, 04:45 pm",
                style: AppTextStyles.smallestSubDescStyleRegular.copyWith(
                  color: AppColors.deactivatedText,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget decText({
    String text = "",
    IconData? icon,
    TextStyle? style,
    int maxLines = 4,
    Widget? child,
    EdgeInsetsGeometry? padding,
  }) {
    return text.isNotEmpty || child != null
        ? Align(
            child: Padding(
              padding: padding ??
                  EdgeInsets.only(
                    left: AppDimens.dimen25,
                    right: AppDimens.dimen25,
                  ),
              child: Row(
                children: [
                  Icon(icon ?? Icons.add_link, size: AppDimens.dimen20),
                  SizedBox(width: AppDimens.dimen10),
                  child ??
                      Flexible(
                        child: richText(
                          maxLines: maxLines,
                          mod: [
                            RichTextModel(
                                text: text,
                                style: style ?? AppTextStyles.titleStyleBold),
                          ],
                        ),
                      ),
                ],
              ),
            ),
            alignment: Alignment.centerLeft,
          )
        : const SizedBox();
  }

  static Widget redemptionLogWidget(
    RxBool isDoneLoading,
    RxList<RedemptionLogs> list, {
    EdgeInsetsGeometry? padding,
  }) {
    return Obx(() => isDoneLoading.value
        ? Padding(
            padding: padding ??
                EdgeInsets.only(
                    left: AppDimens.dimen24, right: AppDimens.dimen24),
            child: list.isNotEmpty
                ? Column(
                    children: _redemptionLogItem(list),
                    crossAxisAlignment: CrossAxisAlignment.start,
                  )
                : UiApi.noDataWidget(
                    title: "No Redemption History",
                    asset: "assets/images/ic_success_pin.png",
                    message:
                        "You have no redemption(s) performed with this gift card account.",
                  ),
          )
        : UiApi.loader(size: 3));
  }

  static List<Widget> _redemptionLogItem(List<RedemptionLogs> list) {
    List<Widget> logs = [];

    for (RedemptionLogs log in list) {
      logs.add(Container(
        decoration: UiApi.deco(borderRadius: 5),
        padding: EdgeInsets.only(
          left: AppDimens.dimen10,
          right: AppDimens.dimen10,
          top: AppDimens.dimen5,
          bottom: AppDimens.dimen5,
        ),
        margin: EdgeInsets.only(bottom: AppDimens.dimen5),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateTimeUtils.formatDateString(log.transactionDate,
                            format: "dd"),
                        style: AppTextStyles.h5StyleMedium
                            .copyWith(color: AppColors.lightDark),
                      ),
                      SizedBox(height: AppDimens.dimen5),
                      Text(
                        DateTimeUtils.formatDateString(log.transactionDate,
                            format: "MMM yy"),
                        style: AppTextStyles.subDescStyleLight
                            .copyWith(fontSize: AppDimens.dimen10)
                            .copyWith(color: AppColors.lightDark),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: AppDimens.dimen10),
                Flexible(
                  flex: 0,
                  child: Container(
                    width: .6,
                    height: AppDimens.dimen50,
                    color: AppColors.kSmokeWhite,
                  ),
                ),
                SizedBox(width: AppDimens.dimen10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiApi.richText(
                        mod: [
                          RichTextModel(
                            text: Utils.capitalizeLetter(
                                val: log.branch.isEmpty
                                    ? log.merchant
                                    : log.branch,
                                capAllFirstLetters: true),
                            style: AppTextStyles.descStyleBold,
                          )
                        ],
                      ),
                      SizedBox(height: AppDimens.dimen3),
                      UiApi.richText(
                        mod: [
                          RichTextModel(
                            text: "Amount:  ",
                            style: AppTextStyles.smallerSubDescStyleLight,
                          ),
                          RichTextModel(
                            text: NumberUtils.getCurrencyAmount(log.amount,
                                dec: 2, currency: log.currency),
                            style: AppTextStyles.smallSubDescStyleRegular,
                          )
                        ],
                      ),
                      SizedBox(height: AppDimens.dimen2),
                      UiApi.richText(
                        mod: [
                          RichTextModel(
                            text: "Balance After:  ",
                            style: AppTextStyles.smallerSubDescStyleLight,
                          ),
                          RichTextModel(
                            text: NumberUtils.getCurrencyAmount(
                                log.balanceAfter,
                                dec: 2,
                                currency: log.currency),
                            style: AppTextStyles.smallSubDescStyleRegular,
                          )
                        ],
                      ),
                      SizedBox(height: AppDimens.dimen2),
                      UiApi.richText(
                        mod: [
                          RichTextModel(
                            text: "Status:  ",
                            style: AppTextStyles.smallerSubDescStyleLight,
                          ),
                          RichTextModel(
                            text: log.status.toUpperCase(),
                            style: AppTextStyles.smallerSubDescStyleRegular
                                .copyWith(
                                    color: CardUtils.getRedemptionStatusColor(
                              log.status,
                            )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.arrow_right, size: AppDimens.dimen20),
                      SizedBox(height: AppDimens.dimen10),
                      Text(
                        DateTimeUtils.formatDateString(log.transactionDate,
                            format: "hh:mm aa"),
                        style: AppTextStyles.smallestSubDescStyleRegular
                            .copyWith(color: AppColors.lightDark),
                      ),
                      // UiApi.richText(
                      //   mod: [
                      //     RichTextModel(
                      //       text: log.transactionType,
                      //       style: AppTextStyles.smallSubDescStyleBold,
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            // const Divider(color: AppColors.dimWhiteExt)
          ],
        ),
      ));
    }

    return logs;
  }

  static Widget filterItem(DictionaryModel dic,
      {Function(DictionaryModel)? onTap}) {
    return Flexible(
      flex: 1,
      child: InkWell(
          onTap: () {
            dic.selected?.value = !(dic.selected?.value ?? false);
            if (onTap != null) {
              onTap(dic);
            }
          },
          child: Obx(
            () => cardWidget(
              elevation: 5,
              radius: 10,
              color: dic.selected?.value ?? false
                  ? AppColors.primaryGreenColor
                  : AppColors.white,
              child: Container(
                width: SizeConfig.screenWidth * .5,
                //height: AppDimens.dimen28,
                margin: EdgeInsets.only(
                  top: AppDimens.dimen10,
                  bottom: AppDimens.dimen10,
                  right: AppDimens.dimen3,
                  left: AppDimens.dimen3,
                ),
                child: Center(
                    child: richText(mod: [
                  RichTextModel(
                    text: dic.key,
                    style: AppTextStyles.subDescRegular.copyWith(
                      color: (dic.selected?.value ?? false)
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
                ])),
              ),
            ),
          )),
    );
  }

  static Widget filterWidget(
    List<DictionaryModel> dic, {
    Function(DictionaryModel)? onTap,
    GestureTapCallback? onFilter,
    TextEditingController? searchCtrl,
  }) {
    List<Widget> col = [];
    List<Widget> row = [];

    col.add(const Divider(color: AppColors.iconColor));
    col.add(SizedBox(height: AppDimens.dimen20));

    col.add(Padding(
      padding: EdgeInsets.only(
        left: AppDimens.dimen16,
        right: AppDimens.dimen16,
      ),
      child: textFormField(
        height: AppDimens.dimen50,
        style: AppTextStyles.descStyleSemiBold,
        textCapitalization: TextCapitalization.words,
        controller: searchCtrl,
        unFocusColor: AppColors.primaryGreenColor,
      ),
    ));
    col.add(SizedBox(height: AppDimens.dimen5));
    col.add(
      Text(
        "Search by merchant's name, location, amount, etc",
        style: AppTextStyles.subDescRegular,
      ),
    );
    col.add(SizedBox(height: AppDimens.dimen20));

    int tempIndex = -1;
    int index = -1;
    int rowLength = AppDimens.dimen3.toInt();
    for (DictionaryModel d in dic) {
      index++;
      row.add(filterItem(d, onTap: onTap));

      if (index == tempIndex + rowLength) {
        col.add(Row(
          children: row,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ));
        tempIndex = index;
        row = <Widget>[];
      }
    }

    int leftToFull = rowLength - row.length;

    if (leftToFull % rowLength != 0) {
      for (int i = 0; i < leftToFull; i++) {
        row.add(
          Flexible(
            flex: 1,
            child: SizedBox(width: SizeConfig.screenWidth * .5),
          ),
        );
      }
    }

    col.add(
      Row(
        children: row,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );

    col.add(SizedBox(height: AppDimens.dimen40));
    col.add(UiApi.decoratedButton(
      text: "Apply Filter",
      asset: "assets/images/ic_filter.svg",
      textColor: AppColors.white,
      iconHeight: AppDimens.dimen20,
      iconPadding: EdgeInsets.only(left: AppDimens.dimen10),
      backgroundColor: AppColors.introColor2,
      onTap: onFilter,
    ));

    return Column(children: col);
  }

  static Widget divider(
      {double? height, double? width, Color? color, EdgeInsets? padding}) {
    return Container(
      decoration:
          deco(color: color ?? AppColors.grey.withOpacity(0.3), opacity: 0),
      height: height ?? 1,
      width: width ?? 0.6,
      margin: padding,
    );
  }

  static Widget navItemWidget(DrawerModel drawer, DrawerIndex selectedIndex,
      {Function(DrawerIndex)? onTap}) {
    if (drawer.index == DrawerIndex.SPACER) {
      return SizedBox(height: AppDimens.dimen70);
    }

    if (drawer.header != null) {
      return Container(
        padding: EdgeInsets.only(
          left: AppDimens.dimen20,
          right: AppDimens.dimen10,
          bottom: AppDimens.dimen5,
          top: AppDimens.dimen5,
        ),
        margin: EdgeInsets.only(
          left: AppDimens.dimen3,
          right: AppDimens.dimen3,
          bottom: AppDimens.dimen10,
        ),
        decoration: deco(
          color: AppColors.greyBg,
          borderColor: AppColors.greyBg,
          opacity: 0,
          borderRadius: 5,
        ),
        child: Text(drawer.header ?? '', style: AppTextStyles.descStyleMedium),
      );
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap(drawer.index);
          }
        },
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(
            left: AppDimens.dimen10,
            right: AppDimens.dimen10,
            bottom: AppDimens.dimen25,
            //  top: AppDimens.dimen5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  drawer.asset != null
                      ? Container(
                          decoration: deco(
                            opacity: .1,
                            color: AppColors.background,
                            borderColor: AppColors.background,
                          ),
                          padding: EdgeInsets.all(AppDimens.dimen5),
                          child: assetImage(
                            drawer.asset ?? "",
                            height: AppDimens.dimen18,
                            width: AppDimens.dimen18,
                            assetColor: selectedIndex != DrawerIndex.SIGN_OUT &&
                                    selectedIndex == drawer.index
                                ? AppColors.primaryGreenColor
                                : drawer.color,
                          ),
                        )
                      : Container(
                          decoration: deco(
                            opacity: .1,
                            color: AppColors.background,
                            borderColor: AppColors.background,
                          ),
                          padding: EdgeInsets.all(AppDimens.dimen5),
                          child: Icon(
                            drawer.icon,
                            size: AppDimens.dimen18,
                            color: selectedIndex != DrawerIndex.SIGN_OUT &&
                                    selectedIndex == drawer.index
                                ? AppColors.primaryGreenColor
                                : drawer.color,
                          ),
                        ),
                  SizedBox(width: AppDimens.dimen10),
                  Text(
                    drawer.label,
                    style: selectedIndex == drawer.index
                        ? AppTextStyles.titleStyleBold
                        : AppTextStyles.titleStyleRegular,
                  )
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: AppDimens.dimen12,
                color: selectedIndex == drawer.index
                    ? AppColors.black
                    : AppColors.deactivatedText.withOpacity(0.3),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget moreMenuItemWidget(DrawerModel drawer,
      {Function(MenuIndex)? onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap(drawer.menuIndex);
          }
        },
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(
            left: AppDimens.dimen10,
            right: AppDimens.dimen10,
            bottom: AppDimens.dimen25,
            //  top: AppDimens.dimen5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  drawer.asset != null
                      ? Container(
                          decoration: deco(
                            opacity: .1,
                            color: AppColors.background,
                            borderColor: AppColors.background,
                          ),
                          padding: EdgeInsets.all(AppDimens.dimen5),
                          child: assetImage(
                            drawer.asset ?? "",
                            height: AppDimens.dimen18,
                            width: AppDimens.dimen18,
                            assetColor:
                                drawer.color ?? AppColors.primaryGreenColor,
                          ),
                        )
                      : Container(
                          decoration: deco(
                            opacity: .1,
                            color: AppColors.background,
                            borderColor: AppColors.background,
                          ),
                          padding: EdgeInsets.all(AppDimens.dimen5),
                          child: Icon(
                            drawer.icon,
                            size: AppDimens.dimen18,
                            color: drawer.color ?? AppColors.primaryGreenColor,
                          ),
                        ),
                  SizedBox(width: AppDimens.dimen10),
                  Text(
                    drawer.label,
                    style: AppTextStyles.titleStyleRegular,
                  )
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: AppDimens.dimen12,
                color: AppColors.black,
              )
            ],
          ),
        ),
      ),
    );
  }

  static navTopWidget({Function? onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        child: InkWell(
          child: Padding(
            padding: EdgeInsets.only(
              top: AppDimens.dimen50,
              left: AppDimens.dimen10,
              right: AppDimens.dimen5,
              bottom: AppDimens.dimen10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getProfilePic(),
                SizedBox(width: AppDimens.dimen5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      richText(mod: [
                        RichTextModel(
                            text: prefUtils.getFullName(),
                            style: AppTextStyles.descStyleSemiBold)
                      ]),
                      SizedBox(height: AppDimens.dimen5),
                      // Text(
                      //   prefUtils.getString(PrefConstants.PHONE_NUMBER),
                      //   style: AppTextStyles.subDescRegular,
                      // ),
                      Row(
                        children: [
                          Text(
                            "Joined",
                            style: AppTextStyles.subDescStyleLight,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: AppDimens.dimen5),
                          UiApi.divider(
                              width: 1,
                              height: AppDimens.dimen16,
                              color: AppColors.primaryGreenColor),
                          SizedBox(width: AppDimens.dimen5),
                          Text(
                            DateTimeUtils.formatDateString(
                                prefUtils.getCustomer().joinedSince,
                                format: "dd MMM yyyy"),
                            style: AppTextStyles.subDescStyleSemiBold,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: AppDimens.dimen12,
                  color: AppColors.deactivatedText,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget rowIconText({
    IconData icon = Icons.message,
    Color? color,
    double? size,
    String text = "",
    String subText = "",
    TextStyle? style,
    TextStyle? subTextStyle,
    GestureTapCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: color ?? AppColors.iconColor,
            size: size ?? AppDimens.dimen16,
          ),
          SizedBox(width: AppDimens.dimen5),
          Text(
            text,
            style: style ?? AppTextStyles.subDescStyleLight,
          ),
          SizedBox(width: AppDimens.dimen20),
          Expanded(
            child: richText(textAlign: TextAlign.right, mod: [
              RichTextModel(
                text: subText,
                style: subTextStyle ?? AppTextStyles.descStyleRegular,
              )
            ]),
          ),
        ],
      ),
    );
  }

  static Widget rowIconButton({
    IconData icon = Icons.message,
    Color? iconColor,
    double? size,
    double? inMargin,
    String text = "",
    TextStyle? style,
    GestureTapCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(AppDimens.dimen4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor ?? AppColors.iconColor,
              size: size ?? AppDimens.dimen20,
            ),
            SizedBox(width: inMargin ?? AppDimens.dimen10),
            Flexible(
              child: Text(
                text,
                style: style ?? AppTextStyles.subDescStyleLight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget rowText({
    String title = "",
    String subTitle = "",
    TextStyle? titleStyle,
    TextStyle? subTitleStyle,
    int maxLines = 2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text(
            title,
            style: titleStyle ?? AppTextStyles.subDescStyleLight,
          ),
        ),
        Flexible(
          flex: 2,
          child: richText(
            maxLines: maxLines,
            textAlign: TextAlign.end,
            mod: [
              RichTextModel(
                text: subTitle,
                style: subTitleStyle ?? AppTextStyles.subDescRegular,
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget payItemWidget(Payments pay,
      {Function(Payments)? onTap, bool wiggle = false}) {
    CardUtils cardUtils = CardUtils(
      pay.cart.cards.isNotEmpty ? pay.cart.cards[0] : const PrimeCardModel(),
    );

    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(pay);
        }
      },
      child: wiggle
          ? BounceIn(
              child: Container(
                decoration:
                    UiApi.deco(borderRadius: 5, color: AppColors.background),
                padding: EdgeInsets.only(
                  left: AppDimens.dimen10,
                  right: AppDimens.dimen10,
                  top: AppDimens.dimen5,
                  bottom: AppDimens.dimen5,
                ),
                margin: EdgeInsets.only(bottom: AppDimens.dimen5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateTimeUtils.formatDateString(pay.createdAt,
                                    format: "dd"),
                                style: AppTextStyles.h5StyleMedium
                                    .copyWith(color: AppColors.lightDark),
                              ),
                              SizedBox(height: AppDimens.dimen5),
                              Text(
                                DateTimeUtils.formatDateString(pay.createdAt,
                                    format: "MMM yy"),
                                style: AppTextStyles.subDescStyleLight
                                    .copyWith(fontSize: AppDimens.dimen10)
                                    .copyWith(color: AppColors.lightDark),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: AppDimens.dimen10),
                        Flexible(
                          flex: 0,
                          child: Container(
                            width: .6,
                            height: AppDimens.dimen50,
                            color: AppColors.kSmokeWhite,
                          ),
                        ),
                        SizedBox(width: AppDimens.dimen10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UiApi.richText(
                                mod: [
                                  RichTextModel(
                                    text: Utils.capitalizeLetter(
                                        val: cardUtils.getMerchantName(),
                                        capAllFirstLetters: true),
                                    style: AppTextStyles.descStyleSemiBold,
                                  )
                                ],
                              ),
                              SizedBox(height: AppDimens.dimen3),
                              UiApi.richText(
                                mod: [
                                  RichTextModel(
                                    text: "Amount:  ",
                                    style:
                                        AppTextStyles.smallerSubDescStyleLight,
                                  ),
                                  RichTextModel(
                                    text: NumberUtils.getCurrencyAmount(
                                      pay.amount,
                                      dec: 2,
                                    ),
                                    style:
                                        AppTextStyles.smallSubDescStyleRegular,
                                  )
                                ],
                              ),
                              SizedBox(height: AppDimens.dimen2),
                              UiApi.richText(
                                mod: [
                                  RichTextModel(
                                    text: "Reference:  ",
                                    style:
                                        AppTextStyles.smallerSubDescStyleLight,
                                  ),
                                  RichTextModel(
                                    text: pay.ref,
                                    style:
                                        AppTextStyles.smallSubDescStyleRegular,
                                  )
                                ],
                              ),
                              SizedBox(height: AppDimens.dimen2),
                              UiApi.richText(
                                mod: [
                                  RichTextModel(
                                    text: "Status:  ",
                                    style:
                                        AppTextStyles.smallerSubDescStyleLight,
                                  ),
                                  RichTextModel(
                                    text: pay.status
                                        .toUpperCase()
                                        .replaceAll("_", " "),
                                    style: AppTextStyles
                                        .smallerSubDescStyleSemiBold
                                        .copyWith(
                                            color: CardUtils
                                                .getRedemptionStatusColor(
                                                    pay.status)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.arrow_right, size: AppDimens.dimen20),
                              SizedBox(height: AppDimens.dimen10),
                              Text(
                                DateTimeUtils.formatDateString(pay.createdAt,
                                    format: "hh:mm aa"),
                                style: AppTextStyles.smallestSubDescStyleRegular
                                    .copyWith(color: AppColors.lightDark),
                              ),
                              // UiApi.richText(
                              //   mod: [
                              //     RichTextModel(
                              //       text: log.transactionType,
                              //       style: AppTextStyles.smallSubDescStyleBold,
                              //     )
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // const Divider(color: AppColors.dimWhiteExt)
                  ],
                ),
              ),
            )
          : Container(
              decoration: UiApi.deco(borderRadius: 5),
              padding: EdgeInsets.only(
                left: AppDimens.dimen10,
                right: AppDimens.dimen10,
                top: AppDimens.dimen5,
                bottom: AppDimens.dimen5,
              ),
              margin: EdgeInsets.only(bottom: AppDimens.dimen5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              DateTimeUtils.formatDateString(pay.createdAt,
                                  format: "dd"),
                              style: AppTextStyles.h5StyleMedium
                                  .copyWith(color: AppColors.lightDark),
                            ),
                            SizedBox(height: AppDimens.dimen5),
                            Text(
                              DateTimeUtils.formatDateString(pay.createdAt,
                                  format: "MMM yy"),
                              style: AppTextStyles.subDescStyleLight
                                  .copyWith(fontSize: AppDimens.dimen10)
                                  .copyWith(color: AppColors.lightDark),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: AppDimens.dimen10),
                      Flexible(
                        flex: 0,
                        child: Container(
                          width: .6,
                          height: AppDimens.dimen50,
                          color: AppColors.kSmokeWhite,
                        ),
                      ),
                      SizedBox(width: AppDimens.dimen10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UiApi.richText(
                              mod: [
                                RichTextModel(
                                  text: Utils.capitalizeLetter(
                                      val: cardUtils.getMerchantName(),
                                      capAllFirstLetters: true),
                                  style: AppTextStyles.descStyleSemiBold,
                                )
                              ],
                            ),
                            SizedBox(height: AppDimens.dimen3),
                            UiApi.richText(
                              mod: [
                                RichTextModel(
                                  text: "Amount:  ",
                                  style: AppTextStyles.smallerSubDescStyleLight,
                                ),
                                RichTextModel(
                                  text: NumberUtils.getCurrencyAmount(
                                    pay.amount,
                                    dec: 2,
                                  ),
                                  style: AppTextStyles.smallSubDescStyleRegular,
                                )
                              ],
                            ),
                            SizedBox(height: AppDimens.dimen2),
                            UiApi.richText(
                              mod: [
                                RichTextModel(
                                  text: "Reference:  ",
                                  style: AppTextStyles.smallerSubDescStyleLight,
                                ),
                                RichTextModel(
                                  text: pay.ref,
                                  style: AppTextStyles.smallSubDescStyleRegular,
                                )
                              ],
                            ),
                            SizedBox(height: AppDimens.dimen2),
                            UiApi.richText(
                              mod: [
                                RichTextModel(
                                  text: "Status:  ",
                                  style: AppTextStyles.smallerSubDescStyleLight,
                                ),
                                RichTextModel(
                                  text: pay.status
                                      .toUpperCase()
                                      .replaceAll("_", " "),
                                  style: AppTextStyles
                                      .smallerSubDescStyleSemiBold
                                      .copyWith(
                                          color: CardUtils
                                              .getRedemptionStatusColor(
                                                  pay.status)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.arrow_right, size: AppDimens.dimen20),
                            SizedBox(height: AppDimens.dimen10),
                            Text(
                              DateTimeUtils.formatDateString(pay.createdAt,
                                  format: "hh:mm aa"),
                              style: AppTextStyles.smallestSubDescStyleRegular
                                  .copyWith(color: AppColors.lightDark),
                            ),
                            // UiApi.richText(
                            //   mod: [
                            //     RichTextModel(
                            //       text: log.transactionType,
                            //       style: AppTextStyles.smallSubDescStyleBold,
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // const Divider(color: AppColors.dimWhiteExt)
                ],
              ),
            ),
    );
  }

  static Widget redeemItemWidget(Payments pay, {Function(Payments)? onTap}) {
    CardUtils cardUtils = CardUtils(pay.card);

    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(pay);
        }
      },
      child: Container(
        decoration: UiApi.deco(borderRadius: 5),
        padding: EdgeInsets.only(
          left: AppDimens.dimen10,
          right: AppDimens.dimen10,
          top: AppDimens.dimen5,
          bottom: AppDimens.dimen5,
        ),
        margin: EdgeInsets.only(bottom: AppDimens.dimen5),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateTimeUtils.formatDateString(pay.createdAt,
                            format: "dd"),
                        style: AppTextStyles.h5StyleMedium
                            .copyWith(color: AppColors.lightDark),
                      ),
                      SizedBox(height: AppDimens.dimen5),
                      Text(
                        DateTimeUtils.formatDateString(pay.createdAt,
                            format: "MMM yy"),
                        style: AppTextStyles.subDescStyleLight
                            .copyWith(fontSize: AppDimens.dimen10)
                            .copyWith(color: AppColors.lightDark),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: AppDimens.dimen10),
                Flexible(
                  flex: 0,
                  child: Container(
                    width: .6,
                    height: AppDimens.dimen50,
                    color: AppColors.kSmokeWhite,
                  ),
                ),
                SizedBox(width: AppDimens.dimen10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiApi.richText(
                        mod: [
                          RichTextModel(
                            text: Utils.capitalizeLetter(
                                val: cardUtils.getMerchantName(),
                                capAllFirstLetters: true),
                            style: AppTextStyles.descStyleSemiBold,
                          )
                        ],
                      ),
                      SizedBox(height: AppDimens.dimen3),
                      UiApi.richText(
                        mod: [
                          RichTextModel(
                            text: "Amount:  ",
                            style: AppTextStyles.smallerSubDescStyleLight,
                          ),
                          RichTextModel(
                            text: NumberUtils.getCurrencyAmount(
                              pay.amount,
                              dec: 2,
                            ),
                            style: AppTextStyles.smallSubDescStyleRegular,
                          )
                        ],
                      ),
                      SizedBox(height: AppDimens.dimen2),
                      UiApi.richText(
                        mod: [
                          RichTextModel(
                            text: "Reference:  ",
                            style: AppTextStyles.smallerSubDescStyleLight,
                          ),
                          RichTextModel(
                            text: pay.ref,
                            style: AppTextStyles.smallSubDescStyleRegular,
                          )
                        ],
                      ),
                      SizedBox(height: AppDimens.dimen2),
                      UiApi.richText(
                        mod: [
                          RichTextModel(
                            text: "Status:  ",
                            style: AppTextStyles.smallerSubDescStyleLight,
                          ),
                          RichTextModel(
                            text: pay.status.toUpperCase().replaceAll("_", " "),
                            style: AppTextStyles.smallerSubDescStyleSemiBold
                                .copyWith(
                                    color: CardUtils.getRedemptionStatusColor(
                                        pay.status)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.arrow_right, size: AppDimens.dimen20),
                      SizedBox(height: AppDimens.dimen10),
                      Text(
                        DateTimeUtils.formatDateString(pay.createdAt,
                            format: "hh:mm aa"),
                        style: AppTextStyles.smallestSubDescStyleRegular
                            .copyWith(color: AppColors.lightDark),
                      ),
                      // UiApi.richText(
                      //   mod: [
                      //     RichTextModel(
                      //       text: log.transactionType,
                      //       style: AppTextStyles.smallSubDescStyleBold,
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            // const Divider(color: AppColors.dimWhiteExt)
          ],
        ),
      ),
    );
    /*Container(
      decoration: UiApi.deco(
          borderRadius: 5, opacity: 0.1, borderColor: AppColors.lineColor),
      margin: EdgeInsets.only(bottom: AppDimens.dimen10),
      padding: EdgeInsets.all(AppDimens.dimen10),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                DateTimeUtils.formatDateString(pay.createdAt, format: "dd"),
                style: AppTextStyles.h3StyleMedium
                    .copyWith(color: AppColors.deactivatedText),
              ),
            ],
          )
        ],
      ),
    );*/
  }

  static Widget notificationItem(NotificationModel mod,
      {Function(NotificationModel)? onTap}) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(mod);
        }
      },
      child: Container(
        decoration: deco(borderRadius: 5),
        margin: EdgeInsets.only(bottom: AppDimens.dimen10),
        padding: EdgeInsets.all(AppDimens.dimen8),
        child: Row(
          children: [
            mod.sender.isNotEmpty
                ? getProfilePic(url: mod.sender, radius: AppDimens.dimen16)
                : Icon(
                    Icons.notifications_active_sharp,
                    color: AppColors.primaryGreenColor,
                    size: AppDimens.dimen20,
                  ),
            SizedBox(width: AppDimens.dimen10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  richText(
                    maxLines: 2,
                    mod: [
                      RichTextModel(
                        text: mod.title,
                        style: AppTextStyles.subDescStyleMedium,
                      )
                    ],
                  ),
                  SizedBox(height: AppDimens.dimen5),
                  richText(
                    maxLines: 3,
                    mod: [
                      RichTextModel(
                        text: mod.body,
                        style: AppTextStyles.smallSubDescStyleLight,
                      )
                    ],
                  ),
                  SizedBox(height: AppDimens.dimen5),
                  Row(
                    children: [
                      Text(
                        mod.emoji,
                        style: AppTextStyles.titleStyleRegular,
                      ),
                      Text(
                        DateTimeUtils.timeUntil(mod.createdAt),
                        style: AppTextStyles.smallSubDescStyleLight,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget walletBodyWidget(
    RxList<BaseObject> cardAccountList,
    RxBool isDoneLoading, {
    RxBool? isLoadingMore,
    ScrollController? scrollController,
    Function(String)? onSearch,
    Function? onFilterOnTap,
    Function? onViewAllCards,
    Function(BaseObject object, bool isCardExhausted, bool isEmoji)?
        onCardSelected,
    required WalletType walletType,
  }) {
    return Obx(() => Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: AppDimens.dimen20),
                  UiApi.homeSearchBar(
                    hintText: "Search...",
                    filterBgColor: AppColors.introColor2,
                    onSearchChanged: (val) {
                      if (onSearch != null) onSearch(val.toLowerCase());
                    },
                  ),
                  SizedBox(height: AppDimens.dimen5),
                  Padding(
                    padding: EdgeInsets.all(AppDimens.dimen10),
                    child: Text(
                      "Search by merchant's name, location, amount, status, persons's name, date, etc",
                      style: AppTextStyles.subDescRegular,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: AppDimens.dimen120),
              child: cardAccountList.isNotEmpty && isDoneLoading.value
                  ? listView(
                      scrollController: scrollController,
                      padding: EdgeInsets.zero,
                      list: CardApi.renderCardAccount(
                        list: cardAccountList,
                        heroTag: "_accounts",
                        onTap: (baseObject, cardUtils, isEmojiClicked) {
                          if (onCardSelected != null) {
                            onCardSelected(
                              baseObject,
                              cardUtils.isExhaustedCard(),
                              isEmojiClicked,
                            );
                          }
                        },
                        type: walletType,
                      ),
                      isLoadingMore: isLoadingMore,
                      loadingWidget: (isLoadingMore?.value ?? false)
                          ? loaderMore()
                          : const SizedBox(),
                    )
                  : isDoneLoading.value && cardAccountList.isEmpty
                      ? UiApi.noDataWidget(
                          title: "Empty Wallet",
                          message:
                              "You have no gift cards in your ${walletType.toString().toLowerCase().replaceAll("wallettype.", " ").replaceAll("_", " ")} account. "
                              "You can proceed to make purchase of cards using below button.",
                          button: Column(
                            children: [
                              SizedBox(height: AppDimens.dimen50),
                              UiApi.button(
                                backgroundColor: AppColors.white,
                                borderColor: AppColors.kDarkColors,
                                text: "Shop Gift Cards",
                                child: UiApi.buttonChild(
                                  text: "Shop Gift Cards",
                                  textColor: AppColors.primaryGreenColor,
                                  asset:
                                      "assets/images/ic_onboarding_three.svg",
                                ),
                                onPressed: () {
                                  if (onViewAllCards != null) onViewAllCards();
                                },
                              ),
                              SizedBox(height: AppDimens.dimen50),
                            ],
                          ),
                        )
                      : UiApi.loader(),
            )
          ],
        ));
  }

  static Widget transactionHistoryBodyWidget(
    RxList<Payments> cardAccountList,
    RxBool isDoneLoading, {
    RxBool? isLoadingMore,
    ScrollController? scrollController,
    Function(String)? onSearch,
    Function? onFilterOnTap,
    Function? onViewAllCards,
    Function(Payments object)? onCardSelected,
    required WalletType walletType,
  }) {
    return Obx(
      () => cardAccountList.isNotEmpty && isDoneLoading.value
          ? Column(
              children: [
                SizedBox(height: AppDimens.dimen20),
                UiApi.homeSearchBar(
                  filterBgColor: AppColors.introColor2,
                  onSearchChanged: (val) {
                    if (onSearch != null) onSearch(val.toLowerCase());
                  },
                  onFilterClick: () {
                    if (onFilterOnTap != null) onFilterOnTap();
                  },
                ),
                SizedBox(height: AppDimens.dimen10),
                /* Expanded(
                  child: listView(
                      scrollController: scrollController,
                      padding: EdgeInsets.zero,
                      list: CardApi.renderCardAccount(
                        list: cardAccountList,
                        heroTag: "_accounts",
                        onTap: (baseObject, cardUtils, isEmojiClicked) {
                          if (onCardSelected != null) {
                            onCardSelected(
                              baseObject,
                              cardUtils.isExhaustedCard(),
                              isEmojiClicked,
                            );
                          }
                        },
                        type: walletType,
                      ),
                      loadingWidget: isLoadingMore?.value ?? false
                          ? loaderMore()
                          : const SizedBox()),
                ),*/
              ],
            )
          : isDoneLoading.value && cardAccountList.isEmpty
              ? UiApi.noDataWidget(
                  title: "Empty History",
                  message:
                      "You have no history available. You can proceed to make purchase of cards using below button.",
                  button: Column(
                    children: [
                      SizedBox(
                        height: AppDimens.dimen50,
                      ),
                      UiApi.button(
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.primaryGreenColor,
                        text: "Shop Gift Cards",
                        child: UiApi.buttonChild(
                          text: "Shop Gift Cards",
                          textColor: AppColors.primaryGreenColor,
                          asset: "assets/images/ic_onboarding_three.svg",
                        ),
                        onPressed: () {
                          if (onViewAllCards != null) onViewAllCards();
                        },
                      ),
                    ],
                  ),
                )
              : UiApi.loader(),
    );
  }

  static Widget syncTextField(TextEditingController ctrl,
      {GestureTapCallback? onTap, String hint = "Search location..."}) {
    return TextField(
      controller: ctrl,
      readOnly: true,
      onTap: () async {
        if (onTap != null) {
          onTap();
        }
      },
      decoration: InputDecoration(
        icon: Padding(
            padding: EdgeInsets.only(left: AppDimens.dimen10),
            child: Icon(
              Icons.search,
              size: AppDimens.dimen20,
              color: AppColors.black,
            )),
        hintText: hint,
        hintStyle: AppTextStyles.descStyleRegular,
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(right: AppDimens.dimen5),
      ),
    );
  }

  static Widget locationItemWidget(String address, RxBool isLoading) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: AppColors.black,
          size: AppDimens.dimen20,
        ),
        SizedBox(width: AppDimens.dimen10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selected Location",
                style: AppTextStyles.descStyleMedium
                    .copyWith(color: AppColors.primaryGreenColor),
              ),
              SizedBox(height: AppDimens.dimen6),
              Text(
                address,
                style: AppTextStyles.descStyleRegular,
              )
            ],
          ),
        ),
        SizedBox(width: AppDimens.dimen5),
        isLoading.value
            ? circularProgressBar(radius: AppDimens.dimen14)
            : const SizedBox(),
      ],
    );
  }

  static Widget questionItem(Question q, Function(Question) onTap) {
    return InkWell(
      onTap: () {
        onTap(q);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: AppDimens.dimen20,
              bottom: AppDimens.dimen20,
              left: AppDimens.dimen10,
              right: AppDimens.dimen10,
            ),
            decoration: deco(opacity: 0),
            child: Text(q.ask, style: AppTextStyles.descStyleLight),
          ),
          divider(
            height: 1,
            width: SizeConfig.screenWidth,
            color: AppColors.kSmokeWhite,
          ),
        ],
      ),
    );
  }

  static Widget questionsWidget(
      RxList<Question> questionList, Function(Question) onTap) {
    List<Widget> list = [];
    for (Question q in questionList) {
      list.add(questionItem(q, onTap));
    }
    return listView(list: list, padding: EdgeInsets.zero);
  }

  static Widget dialogContent(
    TextEditingController ctrl, {
    Function? onTap,
    String hint = "Enter answer",
    String buttonText = "Submit",
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: AppDimens.dimen40),
        textFormField(
          hintText: hint,
          labelText: hint,
          controller: ctrl,
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: AppDimens.dimen40),
        button(
          text: buttonText,
          textColor: AppColors.white,
          backgroundColor: AppColors.primaryGreenColor,
          onPressed: () {
            NavApi.fireBack();
            if (onTap != null) {
              onTap();
            }
          },
        ),
      ],
    );
    /* return Padding(
      padding: EdgeInsets.all(AppDimens.dimen20),
      child: Center(
        child: textFormField(
            hintText: "Phone Number",
            labelText: "Phone Number",
            controller: ctrl,
            keyboardType: TextInputType.phone),
      ),
    );*/
  }

  static Widget dialogMessage({
    String title = "",
    String mess = "",
    String asset = "assets/images/ic_warn.png",
    Widget? child,
  }) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: AppDimens.dimen5),
          assetImage(asset,
              height: AppDimens.dimen80, width: AppDimens.dimen80),
          SizedBox(height: AppDimens.dimen20),
          Text(
            title,
            style: AppTextStyles.titleStyleBold,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppDimens.dimen10),
          child ??
              Text(
                mess,
                style: AppTextStyles.descStyleRegular,
                textAlign: TextAlign.center,
              ),
          SizedBox(height: AppDimens.dimen20),
        ],
      ),
    );
  }

  static Widget securityQuestionsWarning() {
    if (isGuestUser.value) {
      return guestUserWarning();
    }
    return warningWidget(BaseController.isSecurityQuestionsAdded, onTap: () {
      NavApi.fireTarget(AddSecurityQuestionScreen());
    });
  }

  static Widget guestUserWarning() {
    return warningWidget(
      false.obs,
      bgColor: AppColors.primaryGreenColor,
      style: AppTextStyles.subDescStyleLight.copyWith(color: AppColors.white),
      text: [
        RichTextModel(text: "You have signed-in with a "),
        RichTextModel(
            text: "Guest Account ",
            style: AppTextStyles.subDescStyleBold
                .copyWith(color: AppColors.white)),
        RichTextModel(text: "and therefore has limited features. "),
        // RichTextModel(text: "You can still browse through our "),
        // RichTextModel(text: "brands of cards and make purchase."),
        RichTextModel(text: "\n\n"),
        RichTextModel(
            text: "Did you know you can quickly get your personal account on "),
        RichTextModel(
          text: "Prime",
          style:
              AppTextStyles.subDescStyleBold.copyWith(color: AppColors.white),
        ),
        RichTextModel(text: "? "),
        RichTextModel(text: "Click here to "),
        RichTextModel(
          text: "Sign Up ",
          style:
              AppTextStyles.subDescStyleBold.copyWith(color: AppColors.white),
        ),
        RichTextModel(text: "with just your phone number."),
      ],
      onTap: () {
        NavApi.fireTarget(GuestUserSignUp());
      },
    );
  }

  static Widget warningWidget(
    RxBool isValid, {
    GestureTapCallback? onTap,
    List<RichTextModel>? text,
    Color? bgColor,
    TextStyle? style,
  }) {
    return Obx(
      () => isValid.value
          ? const SizedBox()
          : InkWell(
              onTap: onTap,
              child: Container(
                decoration: deco(
                  color: bgColor ?? AppColors.redLight,
                  opacity: 0,
                  borderRadius: 0,
                ),
                child: richText(
                  maxLines: 6,
                  style: style,
                  mod: text ??
                      [
                        RichTextModel(
                          text: "Security Questions",
                          style: AppTextStyles.subDescStyleSemiBold
                              .copyWith(color: AppColors.white),
                        ),
                        RichTextModel(
                          text: " not set up on your account. Kindly",
                          style: AppTextStyles.subDescRegular
                              .copyWith(color: AppColors.white),
                        ),
                        RichTextModel(
                          text: " click here ",
                          style: AppTextStyles.subDescStyleBold
                              .copyWith(color: AppColors.white),
                        ),
                        RichTextModel(
                          text:
                              "to add this extra security layer in order not to lose your account when you forget your password or pin.",
                          style: AppTextStyles.subDescRegular
                              .copyWith(color: AppColors.white),
                        ),
                        RichTextModel(
                          text:
                              "\n\nNB: You will need this if you want to reset your password or PIN.",
                          style: AppTextStyles.subDescStyleMedium
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                ),
                padding: EdgeInsets.all(AppDimens.dimen10),
                margin: EdgeInsets.only(bottom: AppDimens.dimen10),
              ),
            ),
    );
  }

  ///Redemption Summary
  static Widget cardSummary({
    required List<PrimeCardModel> cardsList,
    double totalAmount = 0.0,
    double discounts = 0.0,
    double subTotal = 0.0,
    Function(PrimeCardModel)? onDelOnTap,
  }) {
    List<Widget> cartList = [];

    for (PrimeCardModel card in cardsList) {
      cartList.add(CardApi.cardSummaryItem(
        card,
        opacity: 0,
        borderColor: AppColors.white,
        textAmountColor: AppColors.black,
        onDelOnTap: () {
          if (onDelOnTap != null) {
            onDelOnTap(card);
          }
        },
      ));
      if (card != cardsList.last) {
        cartList.add(UiApi.divider(
          height: 1,
          width: SizeConfig.screenWidth,
          color: AppColors.backgroundExt,
        ));
      }
    }

    return Container(
      decoration: UiApi.deco(),
      margin: EdgeInsets.only(
        left: AppDimens.dimen16,
        right: AppDimens.dimen16,
        // top: AppDimens.dimen16,
      ),
      padding: EdgeInsets.only(top: AppDimens.dimen5, bottom: AppDimens.dimen5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(AppDimens.dimen8),
            child: Text(
              "Card(s) Summary",
              style: AppTextStyles.titleStyleBold,
            ),
          ),
          const Divider(color: AppColors.deactivatedText),
          Column(
            children: cartList,
          ),
          const Divider(color: AppColors.deactivatedText),
          Padding(
            padding: EdgeInsets.all(AppDimens.dimen10),
            child: Column(
              children: [
                UiApi.rowText(
                  title: "Total Amount",
                  subTitle:
                      NumberUtils.moneyCurrencyFormat(totalAmount, dec: 2),
                  subTitleStyle: AppTextStyles.descStyleBold,
                ),
                SizedBox(height: AppDimens.dimen16),
                UiApi.rowText(
                  title: "Discount Amount",
                  subTitle: NumberUtils.moneyCurrencyFormat(discounts, dec: 2),
                  subTitleStyle: AppTextStyles.descStyleRegular.copyWith(
                    color: AppColors.primaryGreenColor,
                    decoration: TextDecoration.lineThrough,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 1,
                  ),
                ),
                SizedBox(height: AppDimens.dimen16),
                UiApi.rowText(
                  title: "Sub Total",
                  subTitle: NumberUtils.moneyCurrencyFormat(subTotal, dec: 2),
                  subTitleStyle: AppTextStyles.descStyleBold
                      .copyWith(color: AppColors.redLight),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget ratingBarWidget({
    double initialRating = 0.0,
    double? size,
    int itemCount = 5,
    Function(double)? onRatingUpdate,
  }) {
    return RatingBar.builder(
      initialRating: initialRating,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Icon(
          Icons.star,
          color: Colors.amber,
          size: size ?? AppDimens.dimen50,
        );
      },
      onRatingUpdate: (rating) {
        if (onRatingUpdate != null) {
          onRatingUpdate(rating);
        }
      },
    );
  }

  static Widget ratingBar({double rating = 0.0, double? rateSize}) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: Colors.amber,
        size: rateSize ?? AppDimens.dimen16,
      ),
      itemCount: 5,
      itemSize: rateSize ?? AppDimens.dimen16,
    );
  }

  static Widget merchantClientInfo(
    MerchantDetails mer, {
    GestureTapCallback? rateOnTap,
    GestureTapCallback? callOnTap,
    GestureTapCallback? mapOnTap,
    String? cardDesc,
    double? width,
    int maxLines = 20,
  }) {
    return Container(
      decoration: UiApi.deco(),
      margin: EdgeInsets.only(
        left: AppDimens.dimen16,
        right: AppDimens.dimen16,
      ),
      padding: EdgeInsets.only(top: AppDimens.dimen8, bottom: AppDimens.dimen8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(AppDimens.dimen8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Merchant's Info", style: AppTextStyles.h5StyleBold),
                ratingBar(rating: 0),
              ],
            ),
          ),
          const Divider(color: AppColors.deactivatedText),
          Padding(
            padding: EdgeInsets.all(AppDimens.dimen8),
            child: Column(
              children: [
                UiApi.rowText(
                  title: "Name",
                  subTitleStyle: AppTextStyles.subDescStyleBold,
                  subTitle: Utils.capitalizeLetter(
                      capAllFirstLetters: true, val: mer.name),
                ),
                SizedBox(height: AppDimens.dimen16),
                UiApi.rowText(
                  title: "Telephone",
                  subTitle: mer.telephone,
                ),
                SizedBox(height: AppDimens.dimen16),
                UiApi.rowText(
                    title: "Location",
                    subTitle: mer.coordinates?.address ?? ''),
                SizedBox(height: AppDimens.dimen16),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Brief Description",
                      style: AppTextStyles.descStyleBold,
                      textAlign: TextAlign.left,
                    )),
                SizedBox(height: AppDimens.dimen5),
                richText(
                  maxLines: maxLines,
                  mod: [
                    RichTextModel(
                      text: (cardDesc ?? mer.description),
                      style: AppTextStyles.subDescStyleLight,
                    ),
                  ],
                )
              ],
            ),
          ),
          UiApi.divider(width: SizeConfig.screenWidth, height: .5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  child: UiApi.rowIconButton(
                text: "Reviews",
                iconColor: AppColors.yellowColorExt,
                icon: Icons.star_rate,
                size: AppDimens.dimen20,
                inMargin: AppDimens.dimen5,
                onTap: rateOnTap,
              )),
              UiApi.divider(height: AppDimens.dimen45),
              Flexible(
                child: UiApi.rowIconButton(
                  text: "Call",
                  iconColor: AppColors.merBlue,
                  onTap: callOnTap,
                  size: AppDimens.dimen20,
                  inMargin: AppDimens.dimen5,
                ),
              ),
              UiApi.divider(height: AppDimens.dimen45),
              Flexible(
                child: UiApi.rowIconButton(
                  text: "Map",
                  icon: Icons.map,
                  iconColor: AppColors.primaryGreenColor,
                  size: AppDimens.dimen20,
                  inMargin: AppDimens.dimen5,
                  onTap: mapOnTap,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  static Widget merchantInfo(
    MerchantDetails mer, {
    GestureTapCallback? rateOnTap,
    GestureTapCallback? callOnTap,
    GestureTapCallback? mapOnTap,
    double? width,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: UiApi.deco(),
          margin: EdgeInsets.only(
            left: AppDimens.dimen16,
            top: AppDimens.dimen16,
          ),
          width: width ?? SizeConfig.screenWidth * .85,
          height: SizeConfig.screenWidth * .65,
          padding:
              EdgeInsets.only(top: AppDimens.dimen5, bottom: AppDimens.dimen5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(AppDimens.dimen10),
                child: Text("Merchant's Information",
                    style: AppTextStyles.h5StyleBold),
              ),
              const Divider(color: AppColors.deactivatedText),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(AppDimens.dimen10),
                  child: Column(
                    children: [
                      UiApi.rowText(
                          title: "Name",
                          subTitle: Utils.capitalizeLetter(
                            val: mer.name,
                            capAllFirstLetters: true,
                          )),
                      SizedBox(height: AppDimens.dimen16),
                      UiApi.rowText(
                        title: "Telephone",
                        subTitle: mer.telephone,
                      ),
                      SizedBox(height: AppDimens.dimen16),
                      UiApi.rowText(
                        title: "Location",
                        subTitle: mer.coordinates?.address ?? '',
                      ),
                    ],
                  ),
                ),
              ),
              UiApi.divider(width: SizeConfig.screenWidth, height: .5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      child: UiApi.rowIconButton(
                    text: "Reviews",
                    iconColor: AppColors.yellowColorExt,
                    icon: Icons.star_rate,
                    size: AppDimens.dimen20,
                    inMargin: AppDimens.dimen5,
                    onTap: rateOnTap,
                  )),
                  UiApi.divider(height: AppDimens.dimen45),
                  Flexible(
                    child: UiApi.rowIconButton(
                      text: "Call",
                      iconColor: AppColors.merBlue,
                      onTap: callOnTap,
                    ),
                  ),
                  UiApi.divider(height: AppDimens.dimen45),
                  Flexible(
                    child: UiApi.rowIconButton(
                      text: "Map",
                      icon: Icons.map,
                      iconColor: AppColors.primaryGreenColor,
                      onTap: mapOnTap,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  static Widget merchantNearInfo(
    NearByMerchantModel mer, {
    GestureTapCallback? rateOnTap,
    GestureTapCallback? callOnTap,
    GestureTapCallback? routeOnTap,
    GestureTapCallback? goToOnTap,
    double? width,
    //LatLng latLng = const LatLng(0.0, 0.0),
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: goToOnTap,
          child: Container(
            decoration: UiApi.deco(),
            margin: EdgeInsets.only(
              left: AppDimens.dimen8,
              top: AppDimens.dimen16,
            ),
            width: width ?? SizeConfig.screenWidth * .82,
            height: SizeConfig.screenWidth * .64,
            padding: EdgeInsets.only(
                top: AppDimens.dimen5, bottom: AppDimens.dimen5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(AppDimens.dimen8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: richText(
                          maxLines: 1,
                          mod: [
                            RichTextModel(
                              text: Utils.capitalizeLetter(
                                val: mer.client.name,
                                capAllFirstLetters: true,
                              ),
                              style: AppTextStyles.descStyleBold,
                            )
                          ],
                        ),
                      ),
                      InkWell(
                          onTap: goToOnTap,
                          child: assetImage(
                            "assets/images/mycard_green.png",
                            height: AppDimens.dimen20,
                            width: AppDimens.dimen20,
                            assetColor: AppColors.introColor2,
                          )

                          /*Icon(
                          Icons.card,
                          size: AppDimens.dimen25,
                          color: AppColors.orange,
                        ),*/
                          ),
                    ],
                  ),
                ),
                const Divider(color: AppColors.deactivatedText),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(AppDimens.dimen10),
                    child: Column(
                      children: [
                        UiApi.rowText(
                          title: "Telephone",
                          subTitle: mer.client.telephone,
                        ),
                        SizedBox(height: AppDimens.dimen16),
                        UiApi.rowText(
                          title: "Location",
                          subTitle: mer.address,
                        ),
                        SizedBox(height: AppDimens.dimen16),
                        // UiApi.rowText(
                        //   title: "Distance",
                        //   subTitle:
                        //       "${GeoLocationApi.getCurrentPositionDistance(latLng)} away",
                        // ),
                      ],
                    ),
                  ),
                ),
                UiApi.divider(width: SizeConfig.screenWidth, height: .5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                        child: UiApi.rowIconButton(
                      text: "Reviews",
                      iconColor: AppColors.yellowColorExt,
                      icon: Icons.star_rate,
                      size: AppDimens.dimen20,
                      inMargin: AppDimens.dimen5,
                      onTap: rateOnTap,
                    )),
                    UiApi.divider(height: AppDimens.dimen45),
                    Flexible(
                      child: UiApi.rowIconButton(
                        text: "Call",
                        iconColor: AppColors.merBlue,
                        onTap: callOnTap,
                      ),
                    ),
                    UiApi.divider(height: AppDimens.dimen45),
                    Flexible(
                      child: UiApi.rowIconButton(
                        text: "Route",
                        icon: Icons.route,
                        iconColor: AppColors.primaryGreenColor,
                        onTap: routeOnTap,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget settingsItemWidget(String title, GestureTapCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: UiApi.deco(
          applyBorder: false,
          opacity: 0,
          borderSide: const Border(
            bottom: BorderSide(
              color: AppColors.kSmokeWhite,
              width: 1,
            ),
          ),
        ),
        padding:
            EdgeInsets.only(top: AppDimens.dimen20, bottom: AppDimens.dimen20),
        child: Padding(
          padding: EdgeInsets.only(
            left: AppDimens.dimen20,
            right: AppDimens.dimen20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.titleStyleRegular,
              ),
              Icon(
                Icons.arrow_forward,
                color: AppColors.black,
                size: AppDimens.dimen20,
              )
            ],
          ),
        ),
      ),
    );
  }

  static deleteAccountText({String text = "Deleting Account..."}) {
    return Padding(
      padding: EdgeInsets.all(AppDimens.dimen20),
      child: DefaultTextStyle(
        style: AppTextStyles.h5StyleBold.copyWith(
          color: AppColors.red,
        ),
        child: Text(
          text,
          style: AppTextStyles.h5StyleBold.copyWith(
            color: AppColors.redLight,
          ),
        ),
      ),
    );
  }

  ///Phone Widget
  static Widget phoneWidget({
    String hint = "",
    required RxString code,
    required RxString name,
    required RxString validString,
    required RxBool isValid,
    required TextEditingController ctrl,
    GestureTapCallback? onSelectCountry,
    Function(String)? onChanged,
  }) {
    return Column(
      children: [
        Container(
          color: AppColors.background,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: onSelectCountry,
                child: Padding(
                  padding: EdgeInsets.all(AppDimens.dimen16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(name.value,
                            style: AppTextStyles.titleStyleRegular),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: AppDimens.dimen16,
                      )
                    ],
                  ),
                ),
              ),
              UiApi.divider(height: 1, width: SizeConfig.screenWidth),
              Padding(
                padding: EdgeInsets.only(
                  left: AppDimens.dimen16,
                  right: AppDimens.dimen16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => Center(
                        child: Text(code.value,
                            style: AppTextStyles.titleStyleBold),
                      ),
                    ),
                    SizedBox(width: AppDimens.dimen10),
                    Expanded(
                      child: UiApi.textFormField(
                        borderColor: AppColors.background,
                        focusColor: AppColors.background,
                        unFocusColor: AppColors.background,
                        hintText: hint,
                        keyboardType: TextInputType.phone,
                        controller: ctrl,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: onChanged,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppDimens.dimen5),
        Align(
          alignment: Alignment.centerRight,
          child: Obx(
            () => Text(
              validString.value,
              style: AppTextStyles.style(
                style: AppTextStyles.smallerSubDescStyleRegular,
                color:
                    isValid.value ? AppColors.primaryGreenColor : AppColors.red,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }

  static Widget iconText({
    bool icon = false,
    String text = "",
    double? paddingBottom,
    Color? color,
    Color? iconColor,
    double? iconSize,
    IconData iconData = Icons.ac_unit,
    String? subText,
    Widget? subWidget,
    TextStyle? style,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom ?? AppDimens.dimen8),
      child: Row(
        children: [
          icon
              ? UiApi.assetImage(
                  "assets/images/ic_danger.png",
                  height: AppDimens.dimen20,
                  width: AppDimens.dimen20,
                )
              : Icon(
                  iconData,
                  size: iconSize ?? AppDimens.dimen12,
                  color: iconColor ?? AppColors.red,
                ),
          SizedBox(width: AppDimens.dimen14),
          Flexible(
            flex: subText != null ? 0 : 1,
            child: Text(
              text,
              style: style ??
                  (icon
                      ? AppTextStyles.h4StyleBold
                          .copyWith(color: color ?? AppColors.black)
                      : AppTextStyles.descStyleRegular
                          .copyWith(color: color ?? AppColors.black)),
            ),
          ),
          if (subText != null)
            Expanded(
              child: subWidget ??
                  Text(
                    subText,
                    style: AppTextStyles.descStyleBold,
                  ),
            )
        ],
      ),
    );
  }

  static phoneInputWidget(TextEditingController ctrl) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppDimens.dimen20),
          Text(
            'Confirm your Phone Number',
            style:
                AppTextStyles.descStyleMedium.copyWith(color: AppColors.black),
          ),
          SizedBox(height: AppDimens.dimen5),
          UiApi.textFormField(
            keyboardType: TextInputType.phone,
            controller: ctrl,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            hintText: 'Phone number Eg. +233245....',
            prefixIcon: SvgPicture.asset(
              'assets/images/ic_mobile.svg',
            ),
          ),
        ],
      ),
    );
  }

  static Widget eFundCardItem(
    EfundCardModel card, {
    Function(bool, EfundCardModel)? onChecked,
  }) {
    CardUtils cardUtils = CardUtils(card.card);
    return Container(
      decoration: UiApi.deco(borderRadius: 7),
      height: AppDimens.dimen105,
      margin: EdgeInsets.only(
        top: AppDimens.dimen10,
        left: AppDimens.dimen10,
        right: AppDimens.dimen10,
      ),
      padding: EdgeInsets.only(
        // right: AppDimens.dimen5,
        left: AppDimens.dimen5,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: AppDimens.dimen60,
              child: UiApi.imageLoader(
                url: card.card.image,
                heroTag: cardUtils.getHeroTag(alias: "_her"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SizedBox(
              width: SizeConfig.screenWidth,
              child: Padding(
                padding: EdgeInsets.only(
                  top: AppDimens.dimen3,
                  bottom: AppDimens.dimen3,
                  left: AppDimens.dimen5,
                  right: AppDimens.dimen5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiApi.richText(maxLines: 1, mod: [
                      RichTextModel(
                        text: cardUtils.getMerchantName(),
                        style: AppTextStyles.subDescStyleBold,
                      ),
                    ]),

                    ///Amount and Balance on Card Details
                    UiApi.richText(maxLines: 1, mod: [
                      RichTextModel(
                          text: "Amount: ",
                          style: AppTextStyles.smallSubDescStyleLight),
                      RichTextModel(
                          text: cardUtils.getCurrencyDueAmount(dec: 2),
                          style: AppTextStyles.subDescStyleBold
                              .copyWith(color: AppColors.primaryGreenColor)),
                      RichTextModel(
                          text: " | ", style: AppTextStyles.descStyleMedium),
                      RichTextModel(
                          text: cardUtils.getCurrencyCardActualAmount(dec: 2),
                          style: AppTextStyles.smallSubDescStyleRegular
                              .copyWith(
                                  decorationStyle: TextDecorationStyle.wavy,
                                  decoration: TextDecoration.lineThrough)),
                    ]),
                    SizedBox(height: AppDimens.dimen2),

                    UiApi.richText(
                      maxLines: 1,
                      mod: [
                        RichTextModel(
                          text: cardUtils.getCardTitle(
                              defVal: "No title available"),
                          style: AppTextStyles.smallSubDescStyleRegular,
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimens.dimen3),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: AppDimens.dimen14,
                          color: AppColors.primaryGreenColor,
                        ),
                        SizedBox(width: AppDimens.dimen2),
                        Flexible(
                          child: UiApi.richText(
                            maxLines: 1,
                            mod: [
                              RichTextModel(
                                text: cardUtils.getLocation(
                                    defaultVal: "Location not available"),
                                style: AppTextStyles.smallSubDescStyleLight,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimens.dimen2),
                    Text(
                      card.paid ? "PAID" : "NOT FUNDED",
                      style: AppTextStyles.smallSubDescStyleSemiBold.copyWith(
                        color: card.paid
                            ? AppColors.primaryGreenColor
                            : AppColors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: card.paid
                ? SizedBox(width: SizeConfig.screenWidth * 0.3)
                : checkBox((isChecked) {
                    if (onChecked != null) {
                      onChecked(isChecked, card);
                    }
                  }),
          ),
          Flexible(
            flex: 0,
            child: Container(
              width: AppDimens.dimen3,
              height: SizeConfig.screenWidth * 3,
              color: card.paid ? AppColors.primaryGreenColor : AppColors.orange,
            ),
          ),
        ],
      ),
    );
  }

  static Widget textSeparatedWidget(
    List<String> list, {
    TextStyle? textStyle,
    TextStyle? separatorStyle,
    int maxLines = 2,
  }) {
    List<RichTextModel> model = [];

    for (String s in list) {
      model.add(RichTextModel(
          text: '$s ',
          style: textStyle ??
              AppTextStyles.descStyleSemiBold
                  .copyWith(color: AppColors.market3)));
      if (s != list.last) {
        model.add(
          RichTextModel(
            text: '/ ',
            style: separatorStyle ??
                AppTextStyles.titleStyleRegular
                    .copyWith(color: AppColors.iconColor),
          ),
        );
      }
    }

    return richText(mod: model, maxLines: maxLines);
  }

  static Widget descriptionWidget({String text = '', String title = ''}) {
    return text.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppDimens.dimen10),
              Text(title, style: AppTextStyles.descStyleSemiBold),
              Text(text, style: AppTextStyles.subDescStyleLight),
            ],
          )
        : const SizedBox.shrink();
  }

  static Widget buttonIcon({
    required Widget child,
    Function? onTap,
    bool isRounded = false,
    Color? roundContainerColour,
    Color? roundContainerBorderColour,
    EdgeInsetsGeometry? margin,
    double? height,
    double? width,
  }) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: isRounded
            ? circleEmpty(
                child: child,
                size: height,
                backGroundColor: roundContainerColour,
                borderColor: roundContainerBorderColour,
              )
            : Container(
                height: height ?? AppDimens.dimen22,
                width: width ?? AppDimens.dimen30,
                decoration: UiApi.deco(
                  borderRadius: 3,
                  borderColor: roundContainerBorderColour ?? AppColors.lineExt,
                  opacity: 0,
                  color: roundContainerColour ?? AppColors.white,
                ),
                child: Center(child: child),
              ),
      ),
    );
  }

  static Widget titleWidget({required String text, double? fontSize}) {
    return Text(text,
        style: AppTextStyles.h4StyleBold.copyWith(fontSize: fontSize));
  }

  static Widget dropDownWidget({
    String hint = "Select item",
    List<String>? dropItems,
    Function()? onTap,
    required TextEditingController controller,
  }) {
    return textFormField(
        enabled: false,
        controller: controller,
        hintText: hint,
        height: AppDimens.dimen55,
        onTap: onTap,
        suffixIcon: Icon(
          Icons.arrow_drop_down,
          size: AppDimens.dimen30,
        ));
  }

  static Widget addressItemWidget(AddressModel address,
      {Function(AddressModel)? onTap, bool showIcon = true}) {
    return InkWell(
      onTap: () {
        // if (address.isWithinRange && onTap != null) {
        //   onTap(address);
        // }
        if (onTap != null) {
          onTap(address);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: AppDimens.dimen5),
          Row(
            children: [
              if (showIcon && (address.name.isNotEmpty))
                Flexible(
                    flex: 0,
                    child: Icon(
                      Icons.location_pin,
                      size: AppDimens.dimen20,
                      color: AppColors.black,
                    )),
              if (showIcon) SizedBox(width: AppDimens.dimen10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    richText(mod: [
                      RichTextModel(
                        text: address.name,
                        style: AppTextStyles.descStyleBold,
                      )
                    ]),
                    SizedBox(height: AppDimens.dimen3),
                    richText(
                      mod: [
                        RichTextModel(
                          text: address.phone,
                          style: AppTextStyles.smallSubDescStyleRegular,
                        )
                      ],
                      maxLines: 3,
                    ),
                    SizedBox(height: AppDimens.dimen3),
                    richText(
                      mod: [
                        RichTextModel(
                          text: address.coordinate.address,
                          style: AppTextStyles.smallSubDescStyleRegular,
                        )
                      ],
                      maxLines: 3,
                    ),
                    // if (!address.isWithinRange)
                    //   Text(
                    //     "Out of delivery range",
                    //     style: AppTextStyles.smallSubDescStyleRegular
                    //         .copyWith(color: AppColors.redLight),
                    //   ),
                  ],
                ),
              ),
              SizedBox(width: AppDimens.dimen10),
              if (address.distance > 0.0)
                Flexible(
                  flex: 0,
                  child: Text(
                    "${address.distance.toStringAsFixed(2)}\nKm",
                    // textAlign: TextAlign.start,
                    style: AppTextStyles.subDescStyleLight.copyWith(
                      color: address.isWithinRange
                          ? AppColors.black
                          : AppColors.black,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: AppDimens.dimen5),
          divider(
              width: SizeConfig.screenWidth, color: AppColors.backgroundExt),
        ],
      ),
    );
  }

  static Widget topMenuWidget({
    required RxList<DictionaryModel> menu,
    required Rx<DictionaryModel> mod,
    Function(DictionaryModel)? onTap,
    bool isRectangular = false,
    Color? backgroundColor,
    Color? selectedBgColor,
    Color? borderColor,
  }) {
    return Container(
      decoration: deco(
          color: backgroundColor ?? AppColors.primaryGreenColor,
          borderColor: borderColor ?? AppColors.primaryGreenColor,
          borderRadius: isRectangular ? 5 : 30),
      margin: EdgeInsets.all(AppDimens.dimen10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...menu.map((e) => topMenuItemWidget(
                e,
                mod.value,
                onTap: onTap,
                selectedBgColor: selectedBgColor,
                isRectangular: isRectangular,
              ))
        ],
      ),
    );
  }

  static Widget topMenuItemWidget(
    DictionaryModel mod,
    DictionaryModel selectedDict, {
    bool isRectangular = false,
    Color? selectedBgColor,
    Function(DictionaryModel)? onTap,
  }) {
    bool isSelected = selectedDict.key == mod.key;
    GlobalKey<AnimatorWidgetState> key = GlobalKey<AnimatorWidgetState>();
    return Flexible(
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap(mod);
          }
          key.currentState?.forward(from: 0);
        },
        child: isSelected
            ? FadeIn(
                key: key,
                child: Container(
                  decoration: isSelected
                      ? deco(
                          borderRadius: isRectangular ? 5 : 30,
                          color: selectedBgColor,
                          opacity: isRectangular ? 0 : 0.3,
                        )
                      : null,
                  margin: EdgeInsets.symmetric(
                    horizontal:
                        isRectangular ? AppDimens.dimen2 : AppDimens.dimen3,
                    vertical:
                        isRectangular ? AppDimens.dimen1 : AppDimens.dimen3,
                  ),
                  width: SizeConfig.screenWidth,
                  height: isRectangular ? AppDimens.dimen45 : AppDimens.dimen40,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isSelected && mod.icon != null)
                        Icon(
                          mod.icon,
                          color: AppColors.primaryGreenColor,
                          size: AppDimens.dimen20,
                        ),
                      if (isSelected && mod.asset != null)
                        assetImage(
                          mod.asset ?? '',
                          height: AppDimens.dimen20,
                          width: AppDimens.dimen20,
                        ),
                      if (isSelected) SizedBox(width: AppDimens.dimen5),
                      Text(
                        mod.value,
                        style: AppTextStyles.subDescRegular.copyWith(
                          color: isSelected
                              ? AppColors.primaryGreenColor
                              : AppColors.white,
                        ),
                      ),
                    ],
                  )),
                ),
              )
            : Container(
                decoration: isSelected ? deco(borderRadius: 30) : null,
                margin: EdgeInsets.symmetric(
                    horizontal: AppDimens.dimen3, vertical: AppDimens.dimen3),
                width: SizeConfig.screenWidth,
                height: AppDimens.dimen40,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isSelected)
                      Icon(
                        mod.icon,
                        color: AppColors.primaryGreenColor,
                        size: AppDimens.dimen20,
                      ),
                    if (isSelected) SizedBox(width: AppDimens.dimen5),
                    Text(
                      mod.value,
                      style: AppTextStyles.subDescRegular.copyWith(
                        color: isSelected
                            ? AppColors.primaryGreenColor
                            : AppColors.white,
                      ),
                    ),
                  ],
                )),
              ),
      ),
    );
  }

  static Widget locationPickerWidget({
    String? address,
    GestureTapCallback? onTap,
    bool isLoadingAddress = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.location_on,
            color: AppColors.iconColor,
            size: AppDimens.dimen16,
          ),
          SizedBox(width: AppDimens.dimen5),
          Expanded(
            child: richText(mod: [
              RichTextModel(
                text: address ?? "",
                style: AppTextStyles.smallSubDescStyleSemiBold
                    .copyWith(color: AppColors.black),
              )
            ]),
          ),
          SizedBox(width: AppDimens.dimen5),
          isLoadingAddress
              ? circularProgressIndicator(radius: AppDimens.dimen10)
              : Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.iconColor,
                  size: AppDimens.dimen20,
                ),
        ],
      ),
    );
  }

  static Widget emptyListWidget() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Empty data"),
      ],
    );
  }

  static Widget disclosureScreen(Function(bool) onAccepted) {
    return Column(
      children: [
        UiApi.richText(maxLines: 15, mod: [
          RichTextModel(text: "This permission will allow "),
          RichTextModel(
              text: "Prime E-Gift ", style: AppTextStyles.descStyleBold),
          RichTextModel(
              text:
                  " app to find your current location in order to find or suggest nearby merchants to you."),
          RichTextModel(
              text:
                  " Merchants closer to you will be automatically suggested "),
          RichTextModel(
              text: "to you when using the nearby merchants feature. "),
          RichTextModel(text: "\n\nIf you don't feel comfortable with this, "),
          RichTextModel(
              text:
                  "you can ignore since it's not compulsory to use this feature."),
        ]),
        SizedBox(height: AppDimens.dimen20),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimens.dimen10, right: AppDimens.dimen10),
              child: UiApi.button(
                text: "Agree",
                onPressed: () {
                  NavApi.fireBack();
                  onAccepted(true);
                },
              ),
            ),
            SizedBox(height: AppDimens.dimen20),
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimens.dimen10, right: AppDimens.dimen10),
              child: UiApi.button(
                backgroundColor: AppColors.white,
                borderColor: AppColors.red,
                text: "Not Now",
                textStyle: AppTextStyles.descStyleRegular
                    .copyWith(color: AppColors.red),
                onPressed: () {
                  NavApi.fireBack();
                  onAccepted(false);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget disclosureWidget(DisclosureModel model) {
    return Column(
      children: [
        if (model.richText != null)
          UiApi.richText(maxLines: 15, mod: model.richText!),
        if (model.richText == null)
          Text(model.message, style: AppTextStyles.descStyleLight),
        SizedBox(height: AppDimens.dimen20),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimens.dimen10, right: AppDimens.dimen10),
              child: UiApi.button(
                text: "Agree",
                onPressed: () {
                  NavApi.fireBack();
                  if (model.onAccepted != null) model.onAccepted!(true);
                },
              ),
            ),
            SizedBox(height: AppDimens.dimen20),
            Padding(
              padding: EdgeInsets.only(
                  left: AppDimens.dimen10, right: AppDimens.dimen10),
              child: UiApi.button(
                backgroundColor: AppColors.white,
                borderColor: AppColors.red,
                text: "Not Now",
                textStyle: AppTextStyles.descStyleRegular
                    .copyWith(color: AppColors.red),
                onPressed: () {
                  NavApi.fireBack();
                  if (model.onAccepted != null) model.onAccepted!(false);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget deliveryInfoText(
      {String? title, String? value, IconData? icon}) {
    return Container(
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.dimen10,
        vertical: AppDimens.dimen10,
      ),
      decoration: UiApi.deco(
        borderRadius: 0,
        opacity: .1,
        borderColor: AppColors.backgroundExt,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: AppTextStyles.caption,
          ),
          SizedBox(height: AppDimens.dimen5),
          UiApi.iconText(
            text: value ?? '',
            iconData: icon ?? Icons.person,
            iconSize: AppDimens.dimen20,
            style: AppTextStyles.descStyleBold,
            iconColor: AppColors.black,
          ),
        ],
      ),
    );
  }

  static Widget menuStrippedItem(CategoryModel model,
      {Function(CategoryModel)? onTap}) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(model);
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: AppDimens.dimen10),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.dimen10,
          vertical: AppDimens.dimen3,
        ),
        decoration: deco(
          borderColor: AppColors.market3,
          opacity: 0,
          borderRadius: 5,
          color: model.isSelected ? AppColors.market3 : AppColors.white,
        ),
        child: Center(
          child: Text(
            model.name,
            style: AppTextStyles.smallSubDescStyleBold.copyWith(
              color: model.isSelected ? AppColors.white : AppColors.market3,
            ),
          ),
        ),
      ),
    );
  }

  static Widget workingDayItem(String day) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimens.dimen5),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.dimen10,
        vertical: AppDimens.dimen3,
      ),
      decoration: deco(
        borderColor: AppColors.market3,
        opacity: 0,
        borderRadius: 5,
      ),
      child: Text(
        day,
        style: AppTextStyles.smallSubDescStyleRegular
            .copyWith(color: AppColors.market3),
      ),
    );
  }

  static Widget textWidget(
    String title,
    String data, {
    IconData? icon,
    bool isStatus = false,
    TextStyle? titleStyle,
    TextStyle? subTitleStyle,
    CrossAxisAlignment? crossAxisAlignment,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon ?? Icons.add,
              size: AppDimens.dimen14,
            ),
            Text(
              title,
              style: titleStyle ?? AppTextStyles.subDescRegular,
            ),
          ],
        ),
        SizedBox(height: AppDimens.dimen5),
        //isStatus
        //  ? _orderStatusWidget(data)
        //:
        Text(
          data,
          style: subTitleStyle ?? AppTextStyles.subDescStyleBold,
        ),
      ],
    );
  }

  static Widget textAndIcon({String? text, IconData? icon}) {
    return Flexible(
      child: Row(
        children: [
          Icon(
            icon ?? Icons.add,
            color: AppColors.black,
            size: AppDimens.dimen14,
          ),
          SizedBox(width: AppDimens.dimen3),
          Flexible(
            child: richText(
              mod: [
                RichTextModel(
                  text: text ?? '',
                  style: AppTextStyles.smallSubDescStyleRegular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///Fill container with multiple colors
  ///@See [https://stackoverflow.com/questions/57068825/set-two-different-colours-to-single-container]
  static Widget buttonFilled({
    String? valueText,
    String? buttonText,
    Widget? buttonTextWidget,
    Color leftColor = Colors.black,
    Color rightColor = AppColors.primaryGreenColor,
    Color borderColor = Colors.transparent,
    GestureTapCallback? onTap,
    double? size,
    double fillPercent = 0.35,
  }) {
    double fillStop = (1 - fillPercent);
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];
    final List<Color> colors = [
      leftColor,
      leftColor,
      rightColor,
      rightColor,
    ];
    size = size ?? SizeConfig.screenWidth * 0.7;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: AppDimens.dimen50,
        decoration: UiApi.deco(
          borderRadius: 30,
          borderColor: borderColor,
          gradient: LinearGradient(
            end: Alignment.centerRight,
            begin: Alignment.centerLeft,
            //tileMode: TileMode.decal,
            stops: stops,
            colors: colors,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.dimen16,
          vertical: AppDimens.dimen5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size * (1 - fillPercent)),
              child: Text(
                valueText ?? '',
                style: AppTextStyles.descStyleBold
                    .copyWith(color: AppColors.white),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: size * fillPercent,
              ),
              child: buttonTextWidget ??
                  Text(
                    buttonText ?? '',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.descStyleBold
                        .copyWith(color: AppColors.white),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget imageLoaderExt({
    String? url,
    List<String>? images,
    String? title,
    Widget? subWidget,
    String? heroTag,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return InkWell(
      onTap: () {
        NavApi.fireTarget(
          BaseImageViewerScreen(
            url: url,
            images: images,
            heroTag: heroTag,
            borderRadius: 10,
            title: title,
            subWidget: subWidget,
          ),
          trans: Transition.fadeIn,
        );
      },
      child: Hero(
        tag: heroTag ?? '',
        child: UiApi.imageLoader(
          url: url ?? images?.first,
          height: height ?? AppDimens.dimen100,
          width: width ?? AppDimens.dimen100,
          fit: fit ?? BoxFit.cover,
        ),
      ),
    );
  }

  static Widget bottomItemWidget({
    String? asset,
    IconData? icon,
    String text = '',
    double? iconSize,
    GestureTapCallback? onTap,
    Widget? child,
    Color? iconColor,
  }) {
    return InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child ??
                (icon == null
                    ? assetImage(
                        asset ?? '',
                        assetColor: iconColor,
                        height: iconSize ?? AppDimens.dimen20,
                        width: iconSize ?? AppDimens.dimen20,
                      )
                    : Icon(
                        icon,
                        size: iconSize ?? AppDimens.dimen20,
                        color: iconColor,
                      )),
            SizedBox(height: AppDimens.dimen3),
            Flexible(
              child: Text(
                text,
                style: AppTextStyles.smallerSubDescStyleMedium,
              ),
            )
          ],
        ));
  }

  static Widget actionWidget({
    String? asset,
    GestureTapCallback? onTap,
    IconData? icon,
    Color iconColor = AppColors.red,
  }) {
    return UiApi.circleEmpty(
      backGroundColor: AppColors.kGreyWhite.withOpacity(.8),
      padding: EdgeInsets.all(AppDimens.dimen6),
      child: icon != null
          ? Icon(
              icon,
              color: iconColor,
              size: AppDimens.dimen22,
            )
          : asset != null
              ? assetImage(
                  asset,
                  height: AppDimens.dimen22,
                  assetColor: iconColor,
                )
              : const SizedBox.shrink(),
      onTap: onTap,
    );
  }

  static Widget textIconButton({
    String text = '',
    IconData icon = Icons.add,
    GestureTapCallback? onTap,
    TextStyle? style,
    Color iconColor = Colors.black,
    double? iconSize,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            text,
            style: style ?? AppTextStyles.titleStyleBold,
          ),
          SizedBox(width: AppDimens.dimen3),
          Icon(
            icon,
            color: iconColor,
            size: iconSize ?? AppDimens.dimen20,
          ),
        ],
      ),
    );
  }
}
