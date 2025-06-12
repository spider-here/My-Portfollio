import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagesController extends GetxController{
  final PageController pageController = PageController();
  final RxInt currentPageIndex = 0.obs;

  void pageJump(index) {
    pageController.animateToPage(index, duration: Durations.medium4, curve: Curves.decelerate);
    currentPageIndex.value = index;
  }

  void nextPage(){
    pageController.nextPage(duration: Durations.medium4, curve: Curves.decelerate);
    currentPageIndex.value++;
  }

}