import 'package:primecustomer/controller/view/menu_category_controller.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/remote/category_model.dart';
import 'package:primecustomer/res/app/app_colors.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/base/base_screen_standard.dart';
import 'package:primecustomer/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllMenuCategoriesScreen extends BaseScreenStandard {
  MenuCategoryController controller = Get.put(MenuCategoryController());

  AllMenuCategoriesScreen() {
    Utils.delayTimer(() {
      controller.setData(getModel());
    });
  }

  @override
  CardModel getModel() {
    CardModel card = baseObject as CardModel;
    return card;
  }

  @override
  void setContext(BuildContext context) {
    controller.setContext(context);
  }

  @override
  String appBarTitle() {
    return "Menu Categories";
  }

  @override
  Color backgroundColor() {
    return AppColors.background;
  }

  @override
  Color appBarBackgroundColor() {
    return backgroundColor();
  }

  @override
  Widget body(BuildContext context) {
    return UiApi.listView(
      list: listView(),
      padding: EdgeInsets.only(
        top: AppDimens.dimen20,
        right: AppDimens.dimen12,
        left: AppDimens.dimen12,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
    );
  }

  @override
  List<Widget> listView() {
    List<Widget> list = [];

    list.add(UiApi.securityQuestionsWarning());

    /// SearchBar and filter for the category
    list.add(UiApi.homeSearchBar(
      onSearchChanged: (val) {
        controller.onSearchMenu(val);
      },
      /* onFilterClick: () {
        //  controller.onFilterOnClick();
      },*/
    ));

    list.add(SizedBox(height: AppDimens.dimen20));

    /// Add Menu categories like Wedding, Christmas etc
    list.add(Obx(() => menuListWidget(list: controller.menuCatList)));

    return list;
  }

  Widget menuListWidget({required List<CategoryModel> list}) {
    List<Widget> col = [];
    List<Widget> row = [];

    int i = -1;
    int tempIndex = -1;
    int rowLength = 3;

    for (CategoryModel cat in list) {
      i++;

      ///Add the card widget to the row
      row.add(Flexible(
        flex: 1,
        child: AspectRatio(
          aspectRatio: SizeConfig.getAspectRatio(v: .75),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: AppDimens.dimen10,
              left: AppDimens.dimen3,
              right: AppDimens.dimen3,
            ),
            child: UiApi.menuItemWidget(
                opacity: .2,
                borderColor: AppColors.kSmokeWhite,
                iconSize: AppDimens.dimen40,
                iconPadding: AppDimens.dimen10,
                containerPadding: AppDimens.dimen6,
                textStyle: AppTextStyles.subDescRegular
                    .copyWith(fontWeight: FontWeight.w500),
                menuTitle: cat.name,
                imagePath: cat.logo,
                border: const BorderRadius.vertical(
                    top: Radius.circular(25), bottom: Radius.circular(25)),
                circularIcon: true,
                margin: EdgeInsets.all(AppDimens.dimen2),
                onMenuOnClick: () {
                  print("MENU $cat");
                  controller.viewAllTypesOfCardOnClick(menu: cat);
                }),
          ),
        ),
      ));

      if (i == tempIndex + rowLength) {
        col.add(Row(
          children: row,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ));
        tempIndex = i;
        row = [];
      }

      if (i == list.length - 1 && i % 2 == 0) {
        row.add(
          Flexible(flex: 1, child: SizedBox(width: SizeConfig.screenWidth)),
        );
        col.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: row,
        ));
      }
    }

    return Column(children: col);
  }
}
