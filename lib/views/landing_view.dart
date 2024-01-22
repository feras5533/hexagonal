import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quetzal_flutter/views/welcome_view.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
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
                  const Text(
                    'Where you can show your',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: Duration.zero,
                      animatedTexts: [
                        FadeAnimatedText(
                          'Creativity',
                          textStyle: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        FadeAnimatedText(
                          'Design',
                          textStyle: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        FadeAnimatedText(
                          'Ideas',
                          textStyle: const TextStyle(
                            fontSize: 40,
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
