import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../components/custom_appbar.dart';
import '/components/custom_scaffold.dart';
import '/helpers/theme.dart';
import 'image_details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> places = [
    'assets/places/place1.jpg',
    'assets/places/place2.jpg',
    'assets/places/place3.jpg',
    'assets/places/place4.jpg',
    'assets/places/place5.jpg',
    'assets/places/place6.jpg',
  ];

  List<String> carousel = [
    'assets/places/place4.jpg',
    'assets/places/place5.jpg',
    'assets/places/place6.jpg',
  ];

  List<String> projects = [
    'assets/projects/1.png',
    'assets/projects/2.png',
    'assets/projects/3.png',
    'assets/projects/4.png',
  ];
  @override
  Widget build(BuildContext context) {
    return customScaffold(
      appBar: customaAppbar(context: context),
      background: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText('Today featured'),
            CarouselSlider.builder(
              itemCount: carousel.length,
              itemBuilder: (context, index, realIndex) => InkWell(
                onTap: () {
                  Get.to(() => ImageDetailsView(
                        image: carousel[index],
                        index: realIndex,
                      ));
                },
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Hero(
                        tag: 'image$realIndex',
                        child: Image.asset(carousel[index]),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.bottomCenter,
                      padding: const EdgeInsets.only(bottom: 20),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: AlignmentDirectional.bottomCenter,
                          end: AlignmentDirectional.center,
                          colors: [
                            Colors.black,
                            Colors.black45,
                            Colors.black26,
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Text(
                        'Lorem ipsum',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              options: CarouselOptions(
                autoPlay: true,
                pauseAutoPlayOnTouch: true,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                enlargeFactor: 0.35,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              ),
            ),
            titleText('Top Images'),
            SizedBox(
              height: Get.height * 0.2,
              width: Get.width,
              child: ListView.builder(
                itemCount: places.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Get.to(() => ImageDetailsView(
                          image: places[index],
                          index: index,
                        ));
                  },
                  child: Hero(
                    tag: 'image$index',
                    child: customContainer(
                      places[index],
                    ),
                  ),
                ),
              ),
            ),
            titleText('Our Projects'),
            GridView.builder(
              itemCount: projects.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) =>
                  projectsContainer(projects[index]),
            ),
          ],
        ),
      ),
    );
  }

  customContainer(image) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: Get.width * 0.45,
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.only(
                right: Get.width * 0.025,
                left: Get.width * 0.05,
                bottom: Get.height * 0.01,
              ),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.elliptical(50, 25),
                ),
              ),
              child: Image.asset(image),
            ),
            const Text(
              'Lorem ipsum',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Transform.translate(
          offset: const Offset(160, 80),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade600,
              border: Border.all(color: AppTheme.seconderyColor, width: 5),
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_forward,
                color: AppTheme.seconderyColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  titleText(title) {
    return Padding(
      padding: EdgeInsets.only(
        left: Get.width * 0.05,
        bottom: Get.height * 0.02,
        top: Get.height * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              shadows: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  offset: Offset(5, 5),
                  blurRadius: 5,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Image.asset(
              'assets/icon.png',
              scale: 5,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  projectsContainer(image) {
    return Column(
      children: [
        SizedBox(
          width: 150,
          child: Image.asset(
            image,
          ),
        ),
        const Text(
          'Lorem ipsum',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
