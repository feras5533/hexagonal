import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '/helpers/theme.dart';

customaAppbar({required context}) {
  return AppBar(
    title: Image.asset('assets/logo.png'),
    centerTitle: true,
    toolbarHeight: 80,
    backgroundColor: AppTheme.seconderyColor,
    leading: IconButton(
      onPressed: () {
        ZoomDrawer.of(context)!.toggle();
      },
      icon: const Icon(Icons.menu),
    ),
  );
}
