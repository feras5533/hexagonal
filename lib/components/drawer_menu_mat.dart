import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;

  const MenuItem(this.title, this.icon);
}

class MenuItems {
  static const home = MenuItem('Home', Icons.home);
  static const feeds = MenuItem('Feeds', Icons.table_rows);
  static const profile = MenuItem('Profile', Icons.person);

  static const all = <MenuItem>[
    home,
    feeds,
    profile,
  ];
}
