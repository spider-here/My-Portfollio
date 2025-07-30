import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ScrollsController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final RxDouble offset = 0.0.obs;
  final RxDouble pixels = 0.0.obs;
  final RxDouble maxExtent = 0.0.obs;

  bool get hasClients => scrollController.hasClients;

  @override
  void onInit() {
    scrollController.addListener(() {
      if(hasClients){
        offset.value = scrollController.offset;
        pixels.value = scrollController.position.pixels;
        maxExtent.value = scrollController.position.maxScrollExtent;
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
