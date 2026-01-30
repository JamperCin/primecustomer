import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/app/app_text_styles.dart';
import 'package:flutter/material.dart';

abstract class BaseSearchDelegate<T> extends SearchDelegate<T> {
  Future<List<T>> fetchSuggestions({required String query});
  Widget suggestionsHistory(BuildContext context);
  Widget listItemWidget(BuildContext context, T item);
  Widget listWidget(BuildContext context, List<T> items);
  Widget? loadingWidget();
  Widget filterWidget();
  Widget cardWidget(BuildContext context, T item);
  double cardElevation();
  void setContext(BuildContext context);
  void onClose(BuildContext context);

  @override
  List<Widget>? buildActions(BuildContext context) {
    setContext(context);
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear, size: AppDimens.dimen18),
        onPressed: () {
          query = '';
        },
      ),
      filterWidget(),
    ];
  }

  @override
  String? get searchFieldLabel => 'Search...';

  @override
  TextStyle? get searchFieldStyle => AppTextStyles.descStyleRegular;

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back, size: AppDimens.dimen18),
      onPressed: () {
        onClose(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return suggestionsHistory(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<T>>(
      future: query == "" ? null : fetchSuggestions(query: query),
      builder: (context, snapshot) => query == ''
          ? suggestionsHistory(context)
          : snapshot.hasData
              ? listWidget(context, snapshot.data!)
              : (loadingWidget() ??
                  Container(
                    child: Text(
                      'Loading...',
                      style: AppTextStyles.smallSubDescStyleLight,
                    ),
                    padding: EdgeInsets.all(AppDimens.dimen16),
                  )),
    );
  }
}
