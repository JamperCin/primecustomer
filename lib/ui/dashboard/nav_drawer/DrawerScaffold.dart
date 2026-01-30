import 'package:primecustomer/controller/view/NavDrawerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/enum/drawer_inder.dart';
import '../../../res/app/app_colors.dart';
import '../../../res/config/size_config.dart';
import 'NavDrawerHomeScreen.dart';

class DrawerScaffold extends StatefulWidget {
  final NavDrawerController drawerController = Get.put(NavDrawerController());
  final double drawerWidth = SizeConfig.screenWidth * 0.75;
  final Function(DrawerIndex) onDrawerCall;
  final Widget? screenView;

  final Function(bool)? drawerIsOpen;
  final AnimatedIconData animatedIconData;
  final Widget? menuIcon;
  final DrawerIndex screenIndex;

  DrawerScaffold({
    required this.onDrawerCall,
    this.screenView,
    this.animatedIconData = AnimatedIcons.arrow_menu,
    this.menuIcon,
    this.drawerIsOpen,
    this.screenIndex = DrawerIndex.ORDERS,
  });

  @override
  _DrawerScaffoldState createState() => _DrawerScaffoldState();
}

class _DrawerScaffoldState extends State<DrawerScaffold>
    with TickerProviderStateMixin {
  ScrollController? scrollController;
  AnimationController? iconAnimationController;
  AnimationController? animationController;
  double scrolloffset = 0.0;

  @override
  void initState() {
    initControllers();
    super.initState();
  }

  Future<bool> getInitState() async {
    scrollController!.jumpTo(
      widget.drawerWidth,
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    widget.drawerController.setContext(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth + widget.drawerWidth,
          //we use with as screen width and add drawerWidth (from navigation_home_screen)
          child: Row(
            children: <Widget>[
              ///Side menu navigational drawer bar
              SizedBox(
                width: widget.drawerWidth,
                //we divided first drawer Width with HomeDrawer and second full-screen Width with all home screen, we called screen View
                height: MediaQuery.of(context).size.height,
                child: AnimatedBuilder(
                  animation: iconAnimationController!,
                  builder: (context, child) {
                    return Transform(
                      //transform we use for the stable drawer  we, not need to move with scroll view
                      transform: Matrix4.translationValues(
                          scrollController!.offset, 0.0, 0.0),
                      child: NavDrawerHomeScreen(
                        navDrawerController: widget.drawerController,
                        screenIndex: widget.screenIndex,
                        iconAnimationController: iconAnimationController!,
                        callBackIndex: (DrawerIndex indexType) {
                          onDrawerClick();
                          widget.onDrawerCall(indexType);
                        },
                        onDrawerClose: () {
                          onDrawerClick();
                        },
                      ),
                    );
                  },
                ),
              ),

              ///Main Landing Page for App
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                //full-screen Width with widget.screenView
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AppColors.grey.withOpacity(0.6),
                          blurRadius: 24),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      ///this IgnorePointer we use as touch(user Interface) widget.screen View, for example scrolloffset == 1 means drawer is close we just allow touching all widget.screen View
                      IgnorePointer(
                        ignoring: scrolloffset == 1 || false,
                        child: widget.screenView,
                      ),

                      ///alternative touch(user Interface) for widget.screen, for example, drawer is close we need to tap on a few home screen area and close the drawer
                      if (scrolloffset == 1.0)
                        InkWell(
                          onTap: () {
                            onDrawerClick();
                          },
                        ),
                      // this just
                      ///menu and arrow icon animation and set color of drawer burger menu
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top + 8,
                            left: 8),
                        child: SizedBox(
                          width: AppBar().preferredSize.height - 8,
                          height: AppBar().preferredSize.height - 8,
                          child: Material(
                            color: Colors.transparent,
                            //AppColors.lightGreen.withOpacity(0.6),
                            //elevation: .4,
                            //shape: const CircleBorder(),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(
                                  AppBar().preferredSize.height),
                              child: Center(
                                // if you use your own menu view UI you add form initialization
                                child: widget.menuIcon ??
                                    AnimatedIcon(
                                      icon: widget.animatedIconData,
                                      color: AppColors.primaryGreenColor,
                                      progress: iconAnimationController!,
                                    ),
                                /*Obx(
                                      () => AnimatedIcon(
                                        icon: widget.animatedIconData,
                                        color: AppColors.primaryGreenColor,
                                        progress: iconAnimationController!,
                                      ),
                                    ),*/
                              ),
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                onDrawerClick();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onDrawerClick() {
    //if scrollcontroller.offset != 0.0 then we set to closed the drawer(with animation to offset zero position) if is not 1 then open the drawer
    if (scrollController!.offset != 0.0) {
      scrollController!.animateTo(
        0.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      scrollController?.animateTo(
        widget.drawerWidth,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  void initControllers() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    iconAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 0));
    iconAnimationController?.animateTo(1.0,
        duration: const Duration(milliseconds: 0), curve: Curves.fastOutSlowIn);
    scrollController =
        ScrollController(initialScrollOffset: widget.drawerWidth);
    scrollController?.addListener(() {
      if (scrollController!.offset <= 0) {
        if (scrolloffset != 1.0) {
          setState(() {
            scrolloffset = 1.0;
            try {
              widget.drawerIsOpen!(true);
            } catch (_) {}
          });
        }
        iconAnimationController?.animateTo(0.0,
            duration: const Duration(milliseconds: 0),
            curve: Curves.fastOutSlowIn);
      } else if (scrollController!.offset > 0 &&
          scrollController!.offset < widget.drawerWidth.floor()) {
        iconAnimationController?.animateTo(
            (scrollController!.offset * 100 / (widget.drawerWidth)) / 100,
            duration: const Duration(milliseconds: 0),
            curve: Curves.fastOutSlowIn);
      } else {
        if (scrolloffset != 0.0) {
          setState(() {
            scrolloffset = 0.0;
            try {
              widget.drawerIsOpen!(false);
            } catch (_) {}
          });
        }
        iconAnimationController!.animateTo(1.0,
            duration: const Duration(milliseconds: 0),
            curve: Curves.fastOutSlowIn);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => getInitState());
  }
}
