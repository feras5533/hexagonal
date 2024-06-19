import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '/views/welcome_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 5800)).then(
      (value) => Get.off(
        () => const WelcomeView(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        enableFeedback: false,
        onTap: () {
          Get.off(
            () => const WelcomeView(),
          );
        },
        child: Stack(
          children: [
            Image.asset(
              'assets/background.jpg',
              height: Get.height,
              width: Get.width,
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AutoSizeText(
                    'Where you can show your',
                    minFontSize: 25,
                    maxFontSize: 30,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const Text(
                  //   'Where you can show your',
                  //   style: TextStyle(
                  //     fontSize: 30,
                  //   ),
                  // ),
                  SizedBox(
                    height: 70,
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: Duration.zero,
                      animatedTexts: [
                        FadeAnimatedText(
                          'Creativity',
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
                          'Ideas',
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
          ],
        ),
      ),
    );
  }
}
