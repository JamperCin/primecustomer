import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/model/local/intro_model.dart';
import 'package:primecustomer/data/constants/pref_constants.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/auth/login/login_screen.dart';
import '../base/base_controller.dart';

class IntroController extends BaseController {
  final pageIndex = 0.obs;
  final lastPage = false.obs;

  static get icIntro1 => "assets/images/ic_intro_image_1.png";
  static get icIntro2 => "assets/images/ic_intro_image_2.png";
  static get icIntro3 => "assets/images/ic_intro_image_3.png";


  final introData =  [
    IntroModel(
      color: AppColors.introColor_1,
      assetName: icIntro1,
      mainText: 'Celebrate family and \nfriends with a Prime \nGift Card',
      subText: 'Shop from your favorite store using \nPrime E gift card. Shop like never before.',
    ),
    IntroModel(
      color: AppColors.introColor_2,
      mainText: 'Personalize your gift \nwith a message. \nSet a date for the \ngift card to be sent.',
      subText:
      'Make it personal with a special message \nin a last minute surprise',
      assetName: icIntro2,
    ),
    IntroModel(
      color: AppColors.introColor_3,
      mainText: 'Get your shopping \ndone in-app or at the shop',
      subText:
      'Shop from your favorite stores using \nPrime E gift card and have it delivered or picked up.',
      assetName: icIntro3,
    ),
   /* IntroModel(
      assetName: "assets/images/ic_cards_group.png",
      mainText: 'Gifting made easier\nwith Prime E-Gift Card',
      subText:
          'Surprise family and friends with an e-gift card,\nGiving them choice to buy what they want. ',
    ),
    IntroModel(
      mainText: 'Book appointment\nin your time',
      subText:
          'Looking for a special treat, schedule the\ndate and time to go.',
      assetName: 'assets/images/ic_onboarding_two.svg',
    ),
    IntroModel(
        mainText: 'Live Shop',
        subText:
            'The new way to introduce your brand\nto the world through live video\nstreaming and making sales on the side',
        assetName: 'assets/images/ic_onboard_four.png'),
    IntroModel(
        mainText: 'Shop with your gift card\non prime marketplace',
        subText:
            'Shop from your favorite store using\nPrime E gift card. Shop like never before.',
        assetName: 'assets/images/ic_onboarding_three.svg'),*/
  ];



  void onPageChanged(int newIndex) {
    pageIndex.value = newIndex;
    lastPage.value = newIndex == introData.length - 1;
  }

  void onSkipOnClick() {
    prefUtils.setBool(PrefConstants.IS_INTRO_SHOWN, true);
    navUtils.fireTargetOff(LoginScreen());
  }

  void onGoToNext(PageController pageController) {
    if (lastPage.value) {
      onSkipOnClick();
      return;
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }

  void onGoToPrevious(PageController pageController) {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }

}
