// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:oxy_boot/View/home_page.dart';
import 'package:oxy_boot/View/Menu/card_screen.dart';
import 'package:oxy_boot/View/Menu/drawer_main_screen.dart';
import 'package:oxy_boot/View/Menu/profile.dart';
import 'package:oxy_boot/View/usersignin/Login.dart';
import 'package:oxy_boot/generated/menu_item.dart';
import 'package:oxy_boot/responsive/mobile.dart';
import 'package:oxy_boot/responsive/response.dart';
import 'package:oxy_boot/responsive/webview.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MenuItemClass currentItem = MenuItems.home;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      slideWidth: 240,
      style: DrawerStyle.Style1,
      mainScreen: getScreen(),
      menuScreen: Builder(builder: (context) {
        return MenuScreen(
          currentItem: currentItem,
          onSelectedItem: (item) {
            setState(() {
              currentItem = item;
              ZoomDrawer.of(context)!.close();
            });
          },
        );
      }),
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.home:
        return const  ResponsiveLayout(mobileScreenLayout: mobilescreenlayout(), webScreenLayout: weblcreenlayout());
      case MenuItems.cart:
        return CartScreen();
    }
    return Container();
  }
}
