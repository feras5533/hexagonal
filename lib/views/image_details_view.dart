import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quetzal_flutter/components/custom_scaffold.dart';

import '/helpers/theme.dart';

class ImageDetailsView extends StatefulWidget {
  final image;
  final index;

  const ImageDetailsView({super.key, this.image, this.index});

  @override
  State<ImageDetailsView> createState() => _ImageDetailsViewState();
}

class _ImageDetailsViewState extends State<ImageDetailsView> {
  @override
  Widget build(BuildContext context) {
    return customScaffold(
      background: true,
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: 'image${widget.index}',
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(70, 50),
                      bottomRight: Radius.elliptical(70, 50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 20,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    widget.image,
                    height: Get.height * 0.55,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(
                    left: Get.width * 0.03,
                    top: Get.height * 0.04,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: AppTheme.seconderyColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: Get.width * 0.05,
                  right: Get.width * 0.07,
                  top: Get.height * 0.03,
                ),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Icon(
                    Icons.location_pin,
                    size: Get.height * 0.05,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.03),
                child: const Text(
                  'Lorem ipsum',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a felis non mi imperdiet venenatis eget et felis. Suspendisse ultrices magna hendrerit ligula sagittis aliquet. Phasellus dictum fringilla sem id egestas.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
          ),
          ElevatedButton(
            onPressed: () {
              popUp();
            },
            style: ButtonStyle(
                // backgroundColor: MaterialStatePropertyAll(),
                ),
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 60,
              ),
              child: Text(
                'See it with your eyes!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  popUp() {
    return Get.defaultDialog(
      title: "Book a trip to this location",
      titlePadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      textConfirm: "Confirm",
      textCancel: "Cancel",
      content: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Text(
                  'RATE',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    '4.9/5',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 35,
                ),
              ],
            ),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a felis non mi imperdiet venenatis eget et felis.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
      onConfirm: () {},
      buttonColor: Colors.grey,
    );
  }
}
