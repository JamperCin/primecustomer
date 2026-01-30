import 'package:primecustomer/res/app/app_dimens.dart';
import 'package:primecustomer/res/config/size_config.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:flutter/material.dart';

abstract class BaseSliverScreen extends StatefulWidget {
  const BaseSliverScreen({Key? key}) : super(key: key);

  ///Set the app bar title of the page, If no appbar is specified,
  ///a default app bar is used
  String appBarTitle();
  String heroTag();

  ///Set a widget for the appBarTitle
  Widget? appBarTitleWidget();

  Widget? flexImageWidget();

  Widget? flexBarWidget();

  double expandedTitleScale();

  Widget? flexImageWidgetIcon();

  double expandedHeight();
  double? collapsedHeight();

  double decoTopHeight();

  ///Set the elevation of the appBar. The default elevation is == 10
  double appBarElevation();

  double? floatWidgetPaddingLeft();
  double? floatWidgetPaddingRight();

  /// Defines the color, opacity, and size of icons.
  ///
  /// Used by [IconTheme] to control the color, opacity, and size of icons in a
  /// widget subtree.
  ///
  /// To obtain the current icon theme, use [IconTheme.of]. To convert an icon
  /// theme to a version with all the fields filled in, use [new
  /// IconThemeData.fallback].
  IconThemeData iconThemeData();

  /// {@template flutter.material.appbar.actions}
  /// A list of Widgets to display in a row after the [title] widget.
  ///
  /// Typically these widgets are [IconButton]s representing common operations.
  /// For less common operations, consider using a [PopupMenuButton] as the
  /// last action.
  ///
  /// The [actions] become the trailing component of the [NavigationToolbar] built
  /// by this widget. The height of each action is constrained to be no bigger
  /// than the [toolbarHeight].
  /// {@endtemplate}
  List<Widget> actions();

  Widget body(BuildContext context);

  Widget bodyDeco(BuildContext context);

  GestureTapCallback? floatWidgetOnclick();

  /// A bottom navigation bar to display at the bottom of the scaffold.
  ///
  /// Snack bars slide from underneath the bottom navigation bar while bottom
  /// sheets are stacked on top.
  Widget bottomNavigationBar({BuildContext? context});
  Widget floatingWidget({BuildContext? context});
  bool decorateBody();

  /// An app bar to display at the top of the scaffold.
  SliverAppBar? appBar();

  ///An Icon that is set to the far right hand corner of the app bar
  //IconData icon();

  void dismissKeyBoard(BuildContext context);
  Color backgroundColor();
  Color appBarBackgroundColor();
  Color appBarTitleColor();
  void setContext(BuildContext context);
  bool showAppBar();
  bool shouldDismissKeyboard();
  Widget floatingActionButton(BuildContext context);
  Widget flexibleSpace(BuildContext context);
  FloatingActionButtonLocation actionButtonLocation();
  //void setState(VoidCallback);
  //VoidCallback? stateListener;

  @override
  State<BaseSliverScreen> createState() => _BaseSliverScreenState();
}

class _BaseSliverScreenState extends State<BaseSliverScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.setContext(context);
    return Scaffold(
      backgroundColor: widget.backgroundColor(),
      floatingActionButton: widget.floatingActionButton(context),
      floatingActionButtonLocation: widget.actionButtonLocation(),
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
            slivers: [
              widget.appBar() ??
                  SliverAppBar(
                    actions: widget.actions(),
                    pinned: widget.showAppBar(),
                    backgroundColor: widget.appBarBackgroundColor(),
                    iconTheme: widget.iconThemeData(),
                    centerTitle: true,
                    toolbarHeight: AppDimens.dimen55,
                    expandedHeight: widget.expandedHeight(),
                    collapsedHeight: widget.collapsedHeight(),
                    flexibleSpace: widget.flexibleSpace(context),
                    title: widget.appBarTitleWidget(),
                    elevation: widget.appBarElevation(),
                  ),
              SliverToBoxAdapter(
                child: GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: widget.decorateBody() ? AppDimens.dimen20 : 0),
                    child: widget.body(context),
                  ),
                  onTap: () {
                    if (widget.shouldDismissKeyboard()) {
                      widget.dismissKeyBoard(context);
                    }
                  },
                ),
              ),
            ],
          ),
          widget.decorateBody() ? decoratedBody(context) : const SizedBox(),
          floatWidget(context),
          floatDecoWidget(context),
        ],
      ),
      bottomNavigationBar: widget.bottomNavigationBar(context: context),
    );
  }

  Widget decoratedBody(BuildContext context) {
    final double defaultMargin = widget.expandedHeight() + AppDimens.dimen18;
    final double defaultStart = widget.expandedHeight() - AppDimens.dimen10;
    final double defaultEnd = defaultStart / 2;

    double diff = defaultMargin - widget.expandedHeight();
    if (diff > AppDimens.dimen24) {
      diff = -(diff - AppDimens.dimen18);
    }

    if (widget.decorateBody()) {
      diff = diff - AppDimens.dimen10;
    }
    double floatTop = widget.expandedHeight() + diff;

    double top = floatTop + 25;

    double scale = 1.0;

    if (scrollController.hasClients) {
      double offset = scrollController.offset;
      top -= offset;

      if (offset < defaultMargin - defaultStart) {
        scale = 1.0;
      } else if (offset < defaultStart - defaultEnd) {
        scale = (defaultMargin - defaultEnd - offset) / defaultEnd;
      } else {
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..scale(scale),
          child: UiApi.containerRoundCorners(
            width: SizeConfig.screenWidth,
            height: AppDimens.dimen30,
            backgroundColor: widget.backgroundColor(),
            borderRadius: 20,
            borderColor: Colors.transparent,
          )),
    );
  }

  Widget floatWidget(BuildContext context) {
    final double defaultMargin = widget.expandedHeight() + AppDimens.dimen20;
    final double defaultStart = widget.expandedHeight() - AppDimens.dimen10;
    final double defaultEnd = defaultStart / AppDimens.dimen2.toInt();

    double diff = defaultMargin - widget.expandedHeight();
    if (diff > AppDimens.dimen24) {
      diff = -(diff - AppDimens.dimen18);
    }

    if (widget.decorateBody()) {
      diff = diff - AppDimens.dimen10;
    }

    double top = widget.expandedHeight() + diff;
    double scale = 1.0;

    if (scrollController.hasClients) {
      double offset = scrollController.offset;
      top -= offset;

      if (offset < defaultMargin - defaultStart) {
        scale = 1.0;
      } else if (offset < defaultStart - defaultEnd) {
        scale = (defaultMargin - defaultEnd - offset) / defaultEnd;
      } else {
        scale = 0.0;
      }
    }

    return Stack(
      children: [
        Positioned(
          top: top,
          right: widget.floatWidgetPaddingRight(),
          left: widget.floatWidgetPaddingLeft(),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..scale(scale),
            child: InkWell(
              child: widget.floatingWidget(context: context),
              onTap: widget.floatWidgetOnclick(),
            ),
          ),
        ),
      ],
    );
  }

  Widget floatDecoWidget(BuildContext context) {
    final double defaultMargin = widget.expandedHeight() + AppDimens.dimen20;
    final double defaultStart = widget.expandedHeight() * 0.5;
    final double defaultEnd = defaultStart / AppDimens.dimen2.toInt();

    double top = widget.decoTopHeight();
    double scale = 1.0;

    if (scrollController.hasClients) {
      double offset = scrollController.offset;
      top -= offset;

      if (offset < defaultMargin - defaultStart) {
        scale = 1.0;
      } else if (offset < defaultStart - defaultEnd) {
        scale = (defaultMargin - defaultEnd - offset) / defaultEnd;
      } else {
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(scale),
        child: widget.bodyDeco(context),
      ),
    );
  }
}
