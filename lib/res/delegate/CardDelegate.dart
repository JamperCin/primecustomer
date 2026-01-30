import 'package:primecustomer/controller/basic/card_controller.dart';
import 'package:primecustomer/data/enum/display_type.dart';
import 'package:primecustomer/data/model/remote/prime_card_model.dart';
import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:primecustomer/res/ui_helpers/card_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardDelegate extends SearchDelegate<PrimeCardModel> {
  CardController controller;
  RxBool isDoneLoading = true.obs;

  CardDelegate({required this.controller});

  @override
  TextStyle? get searchFieldStyle =>
      AppTextStyles.descStyleLight.copyWith(fontSize: AppDimens.dimen14);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Obx(
        () => isDoneLoading.value
            ? IconButton(
                tooltip: 'Clear',
                icon: Icon(Icons.clear, size: AppDimens.dimen18),
                onPressed: () {
                  query = '';
                },
              )
            : Padding(
                padding: EdgeInsets.only(right: AppDimens.dimen18),
                child: UiApi.circularProgressIndicator(
                  radius: AppDimens.dimen12,
                ),
              ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back, size: AppDimens.dimen18),
      onPressed: () {
        close(context, const PrimeCardModel());
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<RxList<PrimeCardModel>>(
      future: query == ""
          ? null
          : controller.getSearchResults(query, isDoneLoading),
      builder: (context, snapshot) => query == ''
          ? Container(
              padding: EdgeInsets.all(AppDimens.dimen16),
              child: Text(
                'Search merchant or location...',
                style: AppTextStyles.subDescStyleLight,
              ),
            )
          : snapshot.hasData
          ? cardsWidget(snapshot.data!, context)
          : UiApi.loader(),
    );
  }

  Widget cardsWidget(RxList<PrimeCardModel> list, BuildContext context) {
    List<Widget> col = [];
    col.add(SizedBox(height: AppDimens.dimen40));

    col.add(
      CardApi.renderCard(
        list: list,
        isDone: isDoneLoading,
        cardType: DisplayType.GRID_VERTICAL,
        heroTag: "_filter_cards",
        titleWidget: const SizedBox(),
        showMerchantName: true,
        onTap: (card) {
          close(context, card);
        },
        loaderLength: 5,
        showSubText: true,
      ),
    );

    return ListView(children: col);
  }
}
