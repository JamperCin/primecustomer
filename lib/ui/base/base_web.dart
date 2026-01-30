import 'package:primecustomer/data/enum/action_event.dart';
import 'package:primecustomer/data/model/local/web_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'base_screen_impl.dart';

class BaseWebView extends BaseScreenImpl {
  RxBool isPageLoading = true.obs;
  late WebViewController wCtrl;

  @override
  WebModel getModel() {
    return baseObject as WebModel;
  }

  @override
  List<Widget> actions() {
    return [
      getModel().onDoneOnclick != null
          ? InkWell(
              onTap: () {
                getModel().onDoneOnclick!();
              },
              child: Padding(
                padding: EdgeInsets.only(
                  right: AppDimens.dimen15,
                  top: AppDimens.dimen5,
                  bottom: AppDimens.dimen5,
                ),
                child: Text(
                  "Done",
                  style: AppTextStyles.descStyleMedium
                      .copyWith(color: AppColors.skyBlueColor),
                ),
              ),
            )
          : const SizedBox()
    ];
  }

  @override
  bool showAppBar() {
    return true;
  }

  @override
  double appBarElevation() {
    return 0;
  }

  @override
  String appBarTitle() {
    return getModel().title ?? "";
  }

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: getWebController()),
        Obx(
          () => isPageLoading.value
              ? Center(child: UiApi.circularProgressIndicator())
              : const Text(""),
        ),
      ],
    );
  }

  WebViewController getWebController() {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('MessageInvoker', onMessageReceived: (s) {
        NavApi.fireEvent(Event(action: EventAction.NAV_HOME));
      })
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            if (!isPageLoading.value) {
              isPageLoading.value = true;
            }

            print("Its started loading ==> $url");
          },
          onPageFinished: (String url) {
            if (isPageLoading.value) {
              isPageLoading.value = false;
            }

            print("Its done loading ==> $url");
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(getModel().url ?? ''));

    return controller;
  }
}
