import 'package:flutter/material.dart';

import '/helpers/theme.dart';

customScaffold({
  required Widget body,
  appBar,
  bool background = false,
  bool drawer = true,
}) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: background ? AppTheme.seconderyColor : Colors.white,
    appBar: appBar,
    body: body,
    // drawer: drawer
    //     ? Drawer(
    //         elevation: 0.0,
    //         width: Get.width * 0.7,
    //         child: const AppDrawer(),
    //       )
    //     : null
  );
}
