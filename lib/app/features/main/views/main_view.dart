import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../config/constant/app_constant.dart';
import '../../../shared/styles/app_styles.dart';
import '../../../shared/widgets/kd_maintenance_widget.dart';
import '../modules/conversation/views/conversation_view.dart';
import '../modules/home/views/home_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller.bottomController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.white,
        adjustScreenBottomPaddingOnCurve: true,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
      navBarHeight: 65,
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const KdMaintenanceWidget(),
      const ConversationView(),
      const KdMaintenanceWidget(),
      const KdMaintenanceWidget(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        iconSize: 24,
        icon: const Icon(Icons.home_outlined),
        title: "Beranda",
        activeColorPrimary: KdColors.primary70,
        textStyle: KdTextStyles.caption2Medium,
        inactiveColorPrimary: const Color(0xffCCCBCB),
      ),
      PersistentBottomNavBarItem(
        iconSize: 24,
        icon: const Icon(Icons.assessment_outlined),
        title: "Dasbor",
        activeColorPrimary: KdColors.primary70,
        textStyle: KdTextStyles.caption2Medium,
        inactiveColorPrimary: const Color(0xffCCCBCB),
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          padding: const EdgeInsets.only(bottom: 6),
          child: Image.asset(
            KdAssetsImagesPath.logosIcon,
            fit: BoxFit.fill,
          ),
        ),
        title: "KELAS",
        textStyle: KdTextStyles.caption2Medium,
        activeColorSecondary: KdColors.primary70,
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: const Color(0xffCCCBCB),
      ),
      PersistentBottomNavBarItem(
        iconSize: 24,
        icon: const Icon(Icons.date_range_outlined),
        title: "Kalender",
        activeColorPrimary: KdColors.primary70,
        textStyle: KdTextStyles.caption2Medium,
        inactiveColorPrimary: const Color(0xffCCCBCB),
      ),
      PersistentBottomNavBarItem(
        iconSize: 24,
        icon: const Icon(Icons.storefront_outlined),
        title: "Market",
        activeColorPrimary: KdColors.primary70,
        textStyle: KdTextStyles.caption2Medium,
        inactiveColorPrimary: const Color(0xffCCCBCB),
      ),
    ];
  }
}
