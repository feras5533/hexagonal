import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/components/custom_snackbar.dart';
import '/components/zoom_drawer.dart';
import '/repo/auth_repo.dart';
import '/views/login_view.dart';

class AuthViewModel {
  late BuildContext context;
  AuthViewModel({
    required this.context,
  });

  Future loginViewModel({
    required username,
    required password,
  }) async {
    AuthRequest request = AuthRequest(context: context);
    var loginCheck = await request.login(
      username: username,
      password: password,
    );

    if (loginCheck) {
      Get.offAll(() => const ZoomDrawerView());
    } else {
      customDialog(title: 'one or both fields are wrong', context: context);
    }
  }

  Future signupViewModel({
    required username,
    required email,
    required password,
  }) async {
    AuthRequest request = AuthRequest(context: context);
    var check = await request.register(
      username: username,
      email: email,
      password: password,
    );

    if (check) {
      Get.off(() => const LoginView());

      customDialog(
          title: 'the account created successfully',
          context: context,
          error: false);
    } else {
      customDialog(
        title: 'somthing went wrong try again',
        context: context,
      );
    }
  }
}
