import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quetzal_flutter/components/custom_snackbar.dart';
import 'package:quetzal_flutter/helpers/prints.dart';

import '../components/zoom_drawer.dart';
import '../repo/auth_repo.dart';
import '/helpers/theme.dart';
import '/components/custom_scaffold.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formState = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool isHidden = true;
  bool isLoading = false;
  bool usernameRed = false;
  bool passwordRed = false;

  Future login() async {
    if (_userNameController.text.isEmpty) {
      customDialog(title: 'the username can\'t be empty', context: context);
      setState(() {
        usernameRed = true;
      });
      return;
    }

    if (_passwordController.text.isEmpty) {
      customDialog(title: 'the password can\'t be empty', context: context);
      setState(() {
        passwordRed = true;
      });
      return;
    }
    setState(() {
      isLoading = true;
    });

    AuthRequest request = AuthRequest(context: context);
    var loginCheck = await request.login(
      username: _userNameController.text,
      password: _passwordController.text,
    );

    printWarning('logloglog $loginCheck');

    Future.delayed(Duration(seconds: 1)).then((value) {
      if (loginCheck) {
        Get.offAll(() => ZoomDrawerView());
      } else {
        customDialog(title: 'one or both fields are wrong', context: context);
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return customScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset('assets/loginHeader.jpg'),
          ),
          Stack(
            children: [
              ColoredBox(
                  color: Colors.black,
                  child: SizedBox(
                    height: Get.height * 0.1,
                    width: Get.width,
                  )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.02),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                clipBehavior: Clip.antiAlias,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'WELCOME',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'BACK',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Form(
                        key: _formState,
                        child: SizedBox(
                          height: Get.height * 0.3,
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            controller: _scrollController,
                            children: [
                              custonTextFormField(
                                controller: _userNameController,
                                label: 'Username',
                                next: true,
                                username: true,
                                ifEmpty: usernameRed,
                              ),
                              custonTextFormField(
                                controller: _passwordController,
                                label: 'Password',
                                password: true,
                                hidden: isHidden,
                                ifEmpty: passwordRed,
                              ),
                              SizedBox(
                                height: Get.height * 0.15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: Get.height * 0.01),
                          height: Get.height * 0.07,
                          width: Get.width * 0.8,
                          child: ElevatedButton(
                            onPressed: () {
                              login();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  AppTheme.primaryColor),
                            ),
                            child: isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  )
                                : const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  custonTextFormField({
    required controller,
    required label,
    bool next = false,
    bool username = false,
    bool password = false,
    bool hidden = false,
    required ifEmpty,
  }) {
    return Container(
      margin: EdgeInsets.only(top: Get.height * 0.04),
      child: TextFormField(
        controller: controller,
        obscureText: hidden,
        onTapOutside: (event) {
          Get.focusScope!.unfocus();
          if (password) {
            _scrollController
                .jumpTo(_scrollController.position.minScrollExtent);
          }
        },
        onTap: () {
          if (password) {
            _scrollController
                .jumpTo(_scrollController.position.maxScrollExtent);
          }
        },
        onFieldSubmitted: (value) {
          if (password) {
            Get.focusScope!.unfocus();

            _scrollController
                .jumpTo(_scrollController.position.minScrollExtent);
          }
        },
        onEditingComplete: () {
          if (username) {
            FocusScope.of(context).nextFocus();
            _scrollController
                .jumpTo(_scrollController.position.maxScrollExtent);
          }
        },
        onChanged: (value) {
          setState(() {
            if (username) {
              usernameRed = false;
            }
            if (password) {
              passwordRed = false;
            }
          });
        },
        obscuringCharacter: '*',
        textInputAction: next ? TextInputAction.next : TextInputAction.done,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              borderSide: BorderSide(
                color: ifEmpty ? Colors.red : Colors.black,
                width: 2,
                strokeAlign: -1,
              ),
            ),
            focusColor: AppTheme.primaryColor,
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 2,
              ),
            ),
            labelText: label,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: ifEmpty ? Colors.red : null,
            ),
            floatingLabelStyle: TextStyle(
              color: ifEmpty ? Colors.red : Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            contentPadding: EdgeInsets.only(
              left: Get.width * 0.1,
              top: Get.height * 0.025,
              bottom: Get.height * 0.025,
            ),
            suffixIcon: password
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isHidden = !isHidden;
                      });
                    },
                    child: isHidden
                        ? Icon(
                            Icons.visibility,
                            color: ifEmpty ? Colors.red : null,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: ifEmpty ? Colors.red : Colors.grey,
                          ),
                  )
                : null),
      ),
    );
  }
}
