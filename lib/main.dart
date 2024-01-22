import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:quetzal_flutter/views/home_view.dart';

import '/views/landing_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LandingView(),
    );
  }
}
//LandingView
