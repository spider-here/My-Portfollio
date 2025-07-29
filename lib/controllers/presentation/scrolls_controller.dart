import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ScrollsController extends GetxController{
  final ScrollController scrollController = ScrollController();
  final RxDouble offset = 0.0.obs;

  @override
  void onInit() {
    scrollController.addListener((){
      offset.value = scrollController.offset;
    });
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}