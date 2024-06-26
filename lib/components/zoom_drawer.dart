import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '/components/drawer_menu_mat.dart';
import '/views/feeds_view.dart';
import '/views/home_view.dart';
import '/views/profile_view.dart';

import 'drawer_menu.dart';

class ZoomDrawerView extends StatefulWidget {
  const ZoomDrawerView({super.key});

  @override
  State<ZoomDrawerView> createState() => _ZoomDrawerViewState();
}

class _ZoomDrawerViewState extends State<ZoomDrawerView> {
  MenuItem currentItem = MenuItems.home;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuBackgroundColor: Colors.grey.shade700,
      mainScreen: getScreen(),
      menuScreen: Builder(
        builder: (context) => DrawerMenu(
          currentItem: currentItem,
          onSelectedItem: (item) {
            setState(() {
              currentItem = item;
              ZoomDrawer.of(context)!.close();
            });
          },
        ),
      ),
      androidCloseOnBackTap: true,
    );
  }

  getScreen() {
    switch (currentItem) {
      case MenuItems.home:
        return const HomeView();
      case MenuItems.feeds:
        return const FeedsView();
      case MenuItems.profile:
        return const ProfileView();
    }
  }
}
