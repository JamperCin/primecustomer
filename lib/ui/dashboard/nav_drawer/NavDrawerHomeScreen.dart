import 'package:primecustomer/controller/view/NavDrawerController.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/ui_helpers/ui_api.dart';
import 'package:primecustomer/ui/dashboard/nav_drawer/profile/profile_page_screen.dart';
import 'package:flutter/material.dart';

import '../../../data/enum/drawer_inder.dart';
import '../../../res/app/app_colors.dart';
import '../../../res/app/app_dimens.dart';

class NavDrawerHomeScreen extends StatefulWidget {
  final AnimationController iconAnimationController;
  final DrawerIndex screenIndex;
  final Function(DrawerIndex) callBackIndex;
  final Function? onDrawerClose;
  final NavDrawerController navDrawerController;

  NavDrawerHomeScreen({
    required this.navDrawerController,
    required this.screenIndex,
    required this.iconAnimationController,
    required this.callBackIndex,
    this.onDrawerClose,
  });

  @override
  _NavDrawerHomeScreenState createState() => _NavDrawerHomeScreenState();
}

class _NavDrawerHomeScreenState extends State<NavDrawerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    widget.navDrawerController.setContext(context);
    return Scaffold(
      backgroundColor: AppColors.notWhite.withOpacity(0.5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          UiApi.navTopWidget(onTap: () {
            if (widget.onDrawerClose != null) widget.onDrawerClose!();
            NavApi.fireTarget(ProfilePageScreen());
          }),
          SizedBox(height: AppDimens.dimen4),
          UiApi.divider(),
          Expanded(
            child: Scrollbar(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ...widget.navDrawerController.drawerList.map((mod) =>
                      UiApi.navItemWidget(mod, widget.screenIndex, onTap: (i) {
                        widget.callBackIndex(i);
                      }))
                ],
              ),
              /*ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: widget.navDrawerController.drawerList.length,
                itemBuilder: (BuildContext context, int index) {
                  DrawerModel mod =
                      widget.navDrawerController.drawerList[index];
                  return mod.index == DrawerIndex.SPACER
                      ? SizedBox(height: AppDimens.dimen70)
                      : UiApi.navItemWidget(mod, widget.screenIndex,
                          onTap: (index) {
                          onNavItemOnClick(index);
                        });
                },
              ),*/
            ),
          ),
          // SizedBox(height: AppDimens.dimen40),
        ],
      ),
    );
  }

  Future<void> onNavItemOnClick(DrawerIndex indexScreen) async {
    widget.callBackIndex(indexScreen);
  }
}
