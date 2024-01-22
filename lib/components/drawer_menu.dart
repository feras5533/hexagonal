import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/helpers/theme.dart';
import '/views/welcome_view.dart';

class MenuItem {
  final String title;
  final IconData icon;

  const MenuItem(this.title, this.icon);
}

class MenuItems {
  static const home = MenuItem('Home', Icons.home);
  static const feeds = MenuItem('Feeds', Icons.table_rows);
  static const profile = MenuItem('Profile', Icons.person);
  // static const logout = MenuItem('Logout', Icons.logout);

  static const all = <MenuItem>[
    home,
    feeds,
    profile,
    // logout,
  ];
}

class DrawerMenu extends StatefulWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const DrawerMenu({
    super.key,
    required this.currentItem,
    required this.onSelectedItem,
  });

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: SafeArea(
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 65),
            margin: EdgeInsets.only(right: 20, top: 50, bottom: 30),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(children: [
              Image.asset('assets/placeholder.png'),
              Padding(padding: EdgeInsets.all(10)),
              Text('feras'),
            ]),
          ),
          ...MenuItems.all.map(buildMenuItem).toList(),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: MenuItemButton(
              leadingIcon: const Icon(
                Icons.logout,
              ),
              onPressed: () {
                Get.offAll(
                  () => const WelcomeView(),
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildMenuItem(MenuItem item) => ListTile(
        textColor: Colors.white,
        selectedColor: Colors.white,
        selectedTileColor: Colors.black38,
        selected: widget.currentItem == item,
        minLeadingWidth: 20,
        leading: Icon(item.icon),
        title: Text(item.title),
        onTap: () => widget.onSelectedItem(item),
      );
}
