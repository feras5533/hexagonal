import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/components/custom_scaffold.dart';
import '../components/custom_appbar.dart';

class FeedsView extends StatefulWidget {
  const FeedsView({super.key});

  @override
  State<FeedsView> createState() => _FeedsViewState();
}

class _FeedsViewState extends State<FeedsView> {
  @override
  Widget build(BuildContext context) {
    return customScaffold(
      appBar: customaAppbar(context: context),
      background: true,
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => customFeed(index),
      ),
    );
  }

  customFeed(index) {
    return Column(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/feeds.jpg',
                  width: Get.width,
                  height: Get.height * 0.25,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Get.width * 0.025),
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Get.height * 0.015),
                        child: const Text(
                          'Lorem ipsum',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a felis non mi imperdiet venenatis eget et felis. Suspendisse ultrices magna hendrerit ligula sagittis aliquet.....',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: Get.width * 0.035),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(children: [
                    Text('username'),
                    Text('21-01-2023'),
                  ]),
                ],
              ),
            ),
          ],
        ),
        if (index != 5)
          Divider(
            color: Colors.grey,
            thickness: 2,
            height: Get.height * 0.07,
            indent: 50,
            endIndent: 50,
          )
        else
          const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
      ],
    );
  }
}
