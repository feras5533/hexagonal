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
        itemCount: 10,
        itemBuilder: (context, index) => customFeed(index),
      ),
    );
  }

  customFeed(index) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/feeds.jpg',
              width: Get.width,
              height: Get.height * 0.23,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Lorem ipsum',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a felis non mi imperdiet venenatis eget et felis. Suspendisse ultrices magna hendrerit ligula sagittis aliquet.....',
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(children: [
                        Text('username'),
                        Text('21-01-223'),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        if (index != 9)
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
