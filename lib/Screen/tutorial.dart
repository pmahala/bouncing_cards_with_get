// import 'package:bouncing_card_example/animations/customshake.dart';
// import 'package:bouncing_cards/Animation/customShake.dart';
import 'homePageController.dart';
import 'package:bouncing_cards/Helper/Data/data.dart';
import 'package:bouncing_cards/Widget/cardWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';

import 'package:flutter/widgets.dart';

import '../main.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final pageController = PageController(viewportFraction: 0.8);
  // int currentIndex = 0;

  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      body: Obx(
        () => Container(
          padding: EdgeInsets.all(24),
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            controller: homePageController.pageController.value,
            itemCount: Data.cards.length,
            itemBuilder: (context, index) {
              final cardData = Data.cards[index];

              final card = CardWidget(
                  color: cardData.color,
                  title: cardData.title,
                  urlImage: cardData.imgUrl,
                  subtitle: cardData.subtitle,
                  description: cardData.description);
              if (homePageController.currentIndex.value == index) {
                return HeadShake(child: card);
              }
              return card;
            },
            onPageChanged: (int index) => setState(
              () {
                homePageController.updateCurrentIndex(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
