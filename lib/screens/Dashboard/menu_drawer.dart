import 'package:cms_application/controller/profile_controller.dart';
import 'package:cms_application/screens/Dashboard/dashboard.dart';
import 'package:cms_application/screens/Dashboard/menu_screen.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        dragOffset: 40,
        controller: ProfileController.i.zoomDrawerController,
        showShadow: true,
        shadowLayer2Color: ColorManager.kPrimaryColor,
        menuBackgroundColor: ColorManager.kPrimaryColor,
        angle: 0,
        slideWidth: 300,
        drawerShadowsBackgroundColor: ColorManager.kPrimaryColor,
        menuScreen: const MenuScreen(),
        mainScreen: const DashBoard());
  }
}
