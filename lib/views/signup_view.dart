import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/components/custom_scaffold.dart';
import '/components/custom_snackbar.dart';
import '/helpers/theme.dart';
import '/view_model/auth_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formState = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool isHidden = true;
  bool isLoading = false;
  bool usernameRed = false;
  bool emailRed = false;
  bool passwordRed = false;

  Future register() async {
    if (_userNameController.text.isEmpty) {
      customDialog(title: 'the username can\'t be empty', context: context);
      setState(() {
        usernameRed = true;
      });
      return;
    }

    if (_emailController.text.isEmpty) {
      customDialog(title: 'the email can\'t be empty', context: context);
      setState(() {
        emailRed = true;
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
    AuthViewModel request = AuthViewModel(context: context);
    await request.signupViewModel(
      username: _userNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return customScaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: Get.height * 0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const AutoSizeText('Sign Up',
                  minFontSize: 25,
                  maxFontSize: 30,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Start Your',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.32,
                      child: AnimatedTextKit(
                        repeatForever: true,
                        pause: Duration.zero,
                        animatedTexts: [
                          FadeAnimatedText(
                            'Account',
                            textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          FadeAnimatedText(
                            'Design',
                            textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          FadeAnimatedText(
                            'Journy',
                            textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
                child: Form(
                  key: _formState,
                  child: SizedBox(
                    height: Get.height * 0.4,
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
                          controller: _emailController,
                          label: 'Email',
                          next: true,
                          email: true,
                          ifEmpty: emailRed,
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
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: Get.height * 0.01),
                  height: Get.height * 0.07,
                  width: Get.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      register();
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(AppTheme.primaryColor),
                    ),
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          )
                        : const AutoSizeText(
                            'Register',
                            minFontSize: 18,
                            maxFontSize: 25,
                            style: TextStyle(
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
    );
  }

  custonTextFormField({
    required controller,
    required label,
    bool next = false,
    bool username = false,
    bool email = false,
    bool password = false,
    bool hidden = false,
    required ifEmpty,
  }) {
    return Container(
      margin: EdgeInsets.only(
        top: Get.height * 0.025,
        left: Get.width * 0.03,
        right: Get.width * 0.03,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: hidden,
        onTapOutside: (event) {
          Get.focusScope!.unfocus();
          if (password || email) {
            _scrollController
                .jumpTo(_scrollController.position.minScrollExtent);
          }
        },
        onTap: () {
          if (password || email) {
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
          if (username || email) {
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
            if (email) {
              emailRed = false;
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
              top: Get.height * 0.022,
              bottom: Get.height * 0.022,
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
