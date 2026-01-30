import 'package:carousel_slider/carousel_slider.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:get/get.dart';

import '../../data/model/remote/advert_image_model.dart';
import '../app/app_dimens.dart';

class AdvertApi {
  ///Render advert
  static Widget renderAdvert(
      {required List<AdvertImageModel> list, Color? color}) {
    RxInt currentIndex = 0.obs;

    return Obx(
      () => list.isNotEmpty
          ? FadeInUp(
              child: Container(
                color: color ?? AppColors.background,
                padding: EdgeInsets.only(
                    top: AppDimens.dimen5, bottom: AppDimens.dimen5),
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: list.length,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          reverse: true,
                          //height: MediaQuery.of(context).size.height,
                          autoPlayCurve: Curves.easeIn,
                          scrollPhysics: const BouncingScrollPhysics(),
                          aspectRatio: SizeConfig.getAspectRatio(v: 2.6),
                          viewportFraction: 0.83,
                          onPageChanged: (index, val) {
                            currentIndex.value = index;
                          }),
                      itemBuilder: (context, index, ind) {
                        return UiApi.imageLoader(
                            url: list[index].url,
                            border: 0,
                            fit: BoxFit.cover,
                            width: SizeConfig.screenWidth * 0.9);
                      },
                    ),
                    SizedBox(height: AppDimens.dimen10),
                    Obx(() => UiApi.pod((list.length), currentIndex))
                  ],
                ),
              ),
            )
          : const ListTileShimmer(
              hasBottomBox: true,
              hasCustomColors: true,
              isDisabledAvatar: true,
            ),
    );
  }

  static Widget advert(
    AdvertImageModel advert,
    int podLength,
    RxInt currentIndex,
  ) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: UiApi.imageLoader(url: advert.url),
        ),
        Flexible(
          flex: 0,
          child: UiApi.pod(podLength, currentIndex),
        )
      ],
    );
  }

  ///Render minor advert
  static Widget renderAdvertBigImages(
      {required List<AdvertImageModel> list, Color? color}) {
    RxInt currentIndex = 0.obs;

    return Obx(
      () => list.isNotEmpty
          ? FadeInUp(
              child: Container(
                color: color ?? AppColors.background,
                child: CarouselSlider.builder(
                  itemCount: list.length,
                  options: CarouselOptions(
                      autoPlay: true,
                      // enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      reverse: true,
                      height: AppDimens.dimen250,
                      autoPlayCurve: Curves.easeIn,
                      scrollPhysics: const BouncingScrollPhysics(),
                      aspectRatio: SizeConfig.getAspectRatio(v: 1.5),
                      viewportFraction: 1,
                      onPageChanged: (index, val) {
                        currentIndex.value = index;
                      }),
                  itemBuilder: (context, index, ind) {
                    return UiApi.imageLoader(
                      url: list[index].url,
                      border: 0,
                      fit: BoxFit.cover,
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenWidth,
                    );
                  },
                ),
              ),
            )
          : const ListTileShimmer(
              hasBottomBox: true,
              hasCustomColors: true,
              isDisabledAvatar: true,
            ),
    );
  }
}
