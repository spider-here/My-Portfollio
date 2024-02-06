import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagesController extends GetxController{
  PageController pageController = PageController();
  final RxInt currentPageIndex = 0.obs;

  void pageJump(index) {
    pageController.animateToPage(index, duration: Durations.medium4, curve: Curves.easeInOut);
    currentPageIndex.value = index;
  }

}