import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quetzal_flutter/views/login_view.dart';
import 'package:quetzal_flutter/views/signup_view.dart';
import 'package:quetzal_flutter/components/custom_scaffold.dart';
import 'package:quetzal_flutter/helpers/theme.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    _fadeInController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeOutController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeInController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _fadeOutController.forward();
      }
    });

    _fadeOutController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          if (switcher == 2) {
            switcher = 0;
          } else {
            switcher++;
          }
        });

        _fadeInController.reset();
        _fadeOutController.reset();

        _fadeInController.forward();
      }
    });

    _fadeInController.forward();
    super.initState();
  }

  List<String> images = [
    'assets/slider/slider1.jpg',
    'assets/slider/slider2.jpg',
    'assets/slider/slider3.jpg',
  ];

  late AnimationController _fadeInController;
  late AnimationController _fadeOutController;
  int switcher = 0;

  @override
  void dispose() {
    _fadeInController.dispose();
    _fadeOutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return customScaffold(
      body: Stack(
        children: [
          ColoredBox(
            color: Colors.white,
            child: SizedBox(
              height: Get.height,
              width: Get.width,
            ),
          ),
          FadeTransition(
            opacity: TweenSequence(
              <TweenSequenceItem<double>>[
                TweenSequenceItem<double>(
                  tween: Tween<double>(begin: 1.0, end: 0.0),
                  weight: 1,
                ),
              ],
            ).animate(_fadeOutController),
            child: Image.asset(
              images[switcher],
              height: Get.height,
              width: Get.width,
              fit: BoxFit.cover,
            ),
          ),
          ColoredBox(
            color: Colors.white24,
            child: SizedBox(
              height: Get.height,
              width: Get.width,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    // color: Colors.white,
                  ),
                ),
                Image.asset('assets/logo.png'),
                Padding(
                  padding: EdgeInsets.only(
                    top: Get.height * 0.35,
                    bottom: Get.height * 0.1,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      customButton(
                        function: () {
                          Get.to(
                            () => LoginView(),
                          );
                        },
                        title: 'Login',
                      ),
                      customButton(
                        function: () {},
                        title: 'continue with Apple',
                        apple: true,
                      ),
                      customButton(
                        function: () {},
                        title: 'continue with Google',
                        google: true,
                      ),
                      customButton(
                        function: () {
                          Get.to(
                            () => SignupView(),
                          );
                        },
                        title: 'Sign up',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  customButton({
    required function,
    required String title,
    bool google = false,
    bool apple = false,
  }) {
    return Container(
      height: Get.height * 0.065,
      width: Get.width * 0.8,
      margin: EdgeInsets.symmetric(
        vertical: Get.height * 0.01,
      ),
      child: ElevatedButton(
        onPressed: function,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppTheme.primaryColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            google
                ? Image.asset('assets/google.png')
                : apple
                    ? Image.asset(
                        'assets/apple.png',
                        color: Colors.black,
                      )
                    : const SizedBox(),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: Get.width * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
