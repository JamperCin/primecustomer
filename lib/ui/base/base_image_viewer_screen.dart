import 'package:cached_network_image/cached_network_image.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/config/assets_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/app/app_colors.dart';
import '../../res/config/size_config.dart';

class BaseImageViewerScreen extends BaseScreenStandard {
  final String? url;
  final List<String>? images;
  final String? heroTag;
  final double? height;
  final double? width;
  final double? borderRadius;
  final BoxFit? fit;
  final Widget? placeHolder;
  final String? title;
  final Widget? subWidget;
  final BorderRadiusGeometry? border;

  RxInt currentPodIndex = 0.obs;

  BaseImageViewerScreen({
    this.url,
    this.images,
    this.width,
    this.heroTag,
    this.height,
    this.fit,
    this.title,
    this.border,
    this.subWidget,
    this.placeHolder,
    this.borderRadius,
  });

  @override
  String appBarTitle() {
    return title ?? '';
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppDimens.dimen16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (url != null) urlRenderWidget(url ?? '', heroTag: heroTag),
          if (images != null) imagesRenderWidget(images ?? []),
          SizedBox(height: AppDimens.dimen20),
          if (subWidget != null) subWidget!
        ],
      ),
    );
  }

  Widget urlRenderWidget(String url, {String? heroTag}) {
    return ClipRRect(
      borderRadius: border ?? BorderRadius.circular(borderRadius ?? 10),
      child: InteractiveViewer(
        child: Hero(
          tag: heroTag ?? '',
          child: CachedNetworkImage(
            imageUrl: url ?? "",
            height: height ?? SizeConfig.screenWidth,
            width: width ?? SizeConfig.screenWidth,
            fit: fit ?? BoxFit.fill,
            placeholder: (context, url) =>
                placeHolder ??
                UiApi.assetImage(
                  AssetsConfig.background,
                  height: height ?? SizeConfig.screenWidth,
                  width: width ?? SizeConfig.screenWidth,
                ),
            errorWidget: (context, url, error) => UiApi.assetImage(
              AssetsConfig.background,
              height: height ?? SizeConfig.screenWidth,
              width: width ?? SizeConfig.screenWidth,
            ),
          ),
        ),
      ),
    );
  }

  Widget imagesRenderWidget(List<String> images) {
    return Column(
      children: [
        UiApi.carouselSlider(
          enlargeCenterPage: true,
          viewportFraction: 1,
          list: images.map(
            (e) {
              return urlRenderWidget(
                e,
              );
            },
          ).toList(),
          currentPod: currentPodIndex,
          aspectRatio: 1,
        ),
        SizedBox(height: AppDimens.dimen20),
        Obx(
          () => UiApi.pod(
            images.length,
            currentPodIndex,
            activeColor: AppColors.market3,
          ),
        ),
      ],
    );
  }
}
