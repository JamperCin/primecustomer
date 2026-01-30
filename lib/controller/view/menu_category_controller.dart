import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/model/local/card_model.dart';
import 'package:primecustomer/data/model/remote/advert_image_model.dart';
import 'package:primecustomer/data/model/remote/category_model.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/ui/dashboard/card/all_cards.dart';
import 'package:get/get.dart';

class MenuCategoryController extends BaseController {
  ///Menu categories list here
  RxList<CategoryModel> menuCatList = RxList<CategoryModel>();
  List<CategoryModel> tempMenuCatList = [];

  ///List of of adverts will be stored as array here
  RxList<AdvertImageModel> advertList = RxList<AdvertImageModel>();

  void viewAllTypesOfCardOnClick({String? filter, CategoryModel? menu}) {
    NavApi.fireTarget(
      AllCardsScreen(),
      model: CardModel(
        filter: filter,
        advertList: advertList,
        selectedMenuCategory: menu,
      ),
    );
  }

  void onSearchMenu(String val) {
    menuCatList.clear();
    for (CategoryModel mod in tempMenuCatList) {
      if (mod.name.toLowerCase().contains(val)) {
        menuCatList.add(mod);
      }
    }
    if (val.isEmpty) {
      menuCatList.addAll(tempMenuCatList);
    }
  }

  void setData(CardModel card) {
    //Clear list
    menuCatList.clear();
    tempMenuCatList.clear();

    //set menu
    menuCatList.addAll(card.menuCategoryList ?? []);
    tempMenuCatList.addAll(card.menuCategoryList ?? []);

    //set advert data
    advertList.addAll(card.advertList ?? []);
  }
}
