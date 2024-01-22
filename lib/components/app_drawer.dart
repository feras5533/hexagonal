import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quetzal_flutter/helpers/theme.dart';
import 'package:quetzal_flutter/views/feeds_view.dart';
import 'package:quetzal_flutter/views/home_view.dart';
import 'package:quetzal_flutter/views/profile_view.dart';
import 'package:quetzal_flutter/views/welcome_view.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  // Route _createRoute(pageName) {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => pageName,
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       const begin = Offset(0.0, 1.0);
  //       const end = Offset.zero;
  //       const curve = Curves.ease;

  //       var tween =
  //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  //       return SlideTransition(
  //         position: animation.drive(tween),
  //         child: child,
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(40),
          margin: EdgeInsets.only(left: 0, right: 20, top: 50, bottom: 30),
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
        ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Home',
            ),
            onTap: () {
              Get.to(() => (HomeView()));
            }),
        ListTile(
            leading: const Icon(Icons.table_rows),
            title: const Text(
              'Feeds',
            ),
            onTap: () {
              Get.to(() => (FeedsView()));
            }),
        ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              'Profile',
            ),
            onTap: () {
              Get.to(() => (ProfileView()));
            }),
        ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Logout',
            ),
            onTap: () {
              Get.offAll(
                const WelcomeView(),
              );
            }),
      ],
    );
  }
}
