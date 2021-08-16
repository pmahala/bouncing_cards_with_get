import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var pageController = PageController();
  var currentIndex = 0.obs;

  void updateCurrentIndex(int index) {
    currentIndex = index.obs;
  }
}
