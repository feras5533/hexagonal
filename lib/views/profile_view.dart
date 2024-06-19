import 'package:flutter/material.dart';

import '../components/custom_appbar.dart';
import '/components/custom_scaffold.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return customScaffold(
      appBar: customaAppbar(context: context),
      background: true,
      body: Stack(
        children: [
          Center(
            widthFactor: 0.8,
            child: Image.asset(
              'assets/profile.png',
              color: Colors.black26,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                ),
                Image.asset(
                  'assets/placeholder.png',
                  scale: 0.5,
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Feras Atiyat',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                customMainContainer(
                  Column(
                    children: [
                      const Text(
                        'Basic Info',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      customInfoContainer(
                        main: 'Photo',
                        sub: 'edit your photo',
                      ),
                      const Divider(color: Colors.black),
                      customInfoContainer(
                        main: 'Name',
                        sub: 'feras atiyat',
                      ),
                      const Divider(color: Colors.black),
                      customInfoContainer(
                        main: 'Birthday',
                        sub: '27-08-1998',
                      ),
                      const Divider(color: Colors.black),
                      customInfoContainer(
                        main: 'Gender',
                        sub: 'male',
                      ),
                    ],
                  ),
                ),
                customMainContainer(
                  Column(
                    children: [
                      const Text(
                        'Content Info',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      customInfoContainer(
                        main: 'Email',
                        sub: 'feras@gmail.com',
                      ),
                      const Divider(color: Colors.black),
                      customInfoContainer(
                        main: 'Phone',
                        sub: '+962775764608',
                      ),
                      const Divider(color: Colors.black),
                      customInfoContainer(
                        main: 'Location',
                        sub: '-----------------',
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

  customMainContainer(child) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: const BorderRadius.vertical(
            top: Radius.elliptical(50, 25), bottom: Radius.elliptical(50, 25)),
      ),
      child: child,
    );
  }

  customInfoContainer({
    main,
    sub,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                main,
                style: const TextStyle(fontSize: 18),
              ),
              Text(sub),
            ],
          ),
          const Icon(Icons.arrow_circle_right_outlined),
        ],
      ),
    );
  }
}
