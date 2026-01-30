import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/intro_model.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';
import 'package:core_module/core_ui/widgets/pod_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:primecustomer/controller/view/intro_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroScreen extends BaseScreenStandard {
  //IntroScreen({Key? key}) : super(key: key);

  final _introController = Get.put(IntroController());
  final _pageController = PageController();

  @override
  bool safeArea() {
    return false;
  }

  @override
  Widget body(BuildContext context) {
    return _notchIntroBody();
  }

  Widget _pageBody(IntroModel model) {
    return Stack(
      children: [
        AssetImageWidget(
          asset: model.assetName,
          height: appDimen.screenHeight * 0.6,
          width: appDimen.screenWidth,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          child: ContainerWidget.withCircularNotch(
            height: appDimen.screenHeight * 0.55,
            width: appDimen.screenWidth,
            color: model.color,
            notchWidth: 155,
          ),
        )
      ],
    );
  }

  Widget _notchIntroBody() {
    return Obx(
          () => Scaffold(
        backgroundColor:
        _introController.introData[_introController.pageIndex.value].color,
        body: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: _introController.introData.length,
              onPageChanged: _introController.onPageChanged,
              scrollBehavior: const ScrollBehavior(),
              itemBuilder: (context, index) {
                return _pageBody(_introController.introData[index]);
              },
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SizedBox(
                height: appDimen.screenHeight * 0.46,
                width: appDimen.screenWidth,
                child: Obx(
                      () => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.dp()),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxHeight: appDimen.screenHeight * 0.27),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    _introController
                                        .introData[
                                    _introController.pageIndex.value]
                                        .mainText,
                                    textAlign: TextAlign.center,
                                    style: textTheme.bodyLarge?.copyWith(
                                        fontSize: 24.dp(),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(height: 10.dp()),
                                Flexible(
                                  flex: 0,
                                  child: Text(
                                    _introController
                                        .introData[
                                    _introController.pageIndex.value]
                                        .subText,
                                    style: textTheme.bodySmall,
                                    //?.copyWith(fontSize: 10.dp()),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.dp()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButtonWidget.withCircularBorder(
                                iconSize: 20,
                                icon: Icons.arrow_back_ios,
                                iconColor: _introController.pageIndex.value != 0
                                    ? colorScheme.primary
                                    : colorScheme.secondaryFixedDim,
                                borderColor: Colors.transparent,
                                iconPadding: 2,
                                onTap: () {
                                  if (_introController.pageIndex.value != 0) {
                                    _introController
                                        .onGoToPrevious(_pageController);
                                  }
                                },
                              ),
                              SizedBox(width: appDimen.dimen(10)),
                              FittedBox(
                                  child: PodWidget(
                                    podLength: _introController.introData.length,
                                    currentIndex: _introController.pageIndex,
                                    onTap: (index) {
                                      _pageController.animateToPage(
                                        index,
                                        duration: const Duration(milliseconds: 200),
                                        curve: Curves.decelerate,
                                      );
                                    },
                                  )),
                              SizedBox(width: appDimen.dimen(10)),
                              IconButtonWidget.withCircularBorder(
                                icon: Icons.arrow_forward_ios,
                                iconSize: 20,
                                iconPadding: 2,
                                iconColor: colorScheme.primary,
                                borderColor: Colors.transparent,
                                onTap: () {
                                  _introController.onGoToNext(_pageController);
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10.dp()),
                          TextButtonWidget(
                            text: "Skip Now",
                            onTap: _introController.onSkipOnClick,
                          ),
                          SizedBox(height: 10.dp()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

/*@override
  bool showAppBar() {
    return false;
  }

  @override
  Widget body(BuildContext context) {
    _introController.setContext(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: AppDimens.dimen8,
            top: AppDimens.dimen5,
            right: AppDimens.dimen8,
            bottom: AppDimens.dimen40,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _introController.onGetStartedClicked();
                    },
                    child: Text('SKIP', style: AppTextStyles.descStyleRegular),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: _introController.introData.length,
                    onPageChanged: _introController.onPageChanged,
                    scrollBehavior: const ScrollBehavior(
                        //androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
                        ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildScreenImageSection(index),
                            SizedBox(height: AppDimens.dimen10),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AppDimens.dimen16,
                                  right: AppDimens.dimen16),
                              child: Text(
                                _introController.introData[index].mainText,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.h3StyleBold
                                    .copyWith(letterSpacing: 0.24),
                              ),
                            ),
                            SizedBox(height: AppDimens.dimen20),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AppDimens.dimen16,
                                  right: AppDimens.dimen16),
                              child: Text(
                                _introController.introData[index].subText,
                                style: AppTextStyles.descStyleRegular.copyWith(
                                  color: AppColors.grey,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: AppDimens.dimen20),
              Obx(
                () => FittedBox(
                    child: UiApi.pod(
                  _introController.introData.length,
                  _introController.pageIndex,
                  onTap: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.decelerate,
                    );
                  },
                )
                    */ /*SizedBox(
                    height: AppDimens.dimen20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_introController.introData.length,
                          (index) {
                        return GestureDetector(
                          onTap: (() => _pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.decelerate,
                              )),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: _introController.pageIndex.value == index
                                ? AppDimens.dimen14
                                : AppDimens.dimen8,
                            height: _introController.pageIndex.value == index
                                ? AppDimens.dimen14
                                : AppDimens.dimen8,
                            margin: EdgeInsets.only(right: AppDimens.dimen5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: _introController.pageIndex.value == index
                                  ? AppColors.introColor2
                                  : AppColors.introColor3,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),*/ /*
                    ),
              ),
              SizedBox(height: AppDimens.dimen40),
              Obx(
                () => TextButton(
                  onPressed: () {
                    if (_introController.lastPage.value) {
                      _introController.onGetStartedClicked();
                      return;
                    }
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate,
                    );
                  },
                  child: Text(
                    _introController.lastPage.value ? 'Get Started' : 'Next',
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.grey,
                    minimumSize: Size(AppDimens.dimen200, AppDimens.dimen45),
                    backgroundColor: AppColors.introColor2,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimens.dimen24,
                      vertical: AppDimens.dimen14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimens.dimen50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScreenImageSection(int index) {
    final asset = _introController.introData[index].assetName;
    return UiApi.assetImage(
      asset,
      height: index == 0 ? AppDimens.dimen220 : AppDimens.dimen190,
    );
  }*/
}
