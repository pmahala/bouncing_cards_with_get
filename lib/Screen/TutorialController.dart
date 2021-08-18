import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TutorialPageController extends GetxController {
  var pageController = PageController(viewportFraction: 0.8).obs;
  var currentIndex = 0.obs;

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }
}
