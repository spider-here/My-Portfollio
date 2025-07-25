import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../creatives/app_colors.dart';


class AppElevatedButton extends StatelessWidget{
  final VoidCallback onClick;
  final Widget child;
  final Rx<LinearGradient> darkGradient = LinearGradient(colors: [primarySwatchLight.shade300, primarySwatchLight.shade600]).obs;
  final Rx<LinearGradient> lightGradient = LinearGradient(colors: [primarySwatchLight.shade600, primarySwatchLight.shade300]).obs;
  AppElevatedButton({super.key, required this.onClick, required this.child});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(15.0),
      shadowColor: primaryColorDark,
      child: InkWell(
        onTap: onClick,
        onHover: (hover){
          if(hover && Get.isDarkMode){
            darkGradient.value = LinearGradient(colors: [primarySwatchLight.shade300, primarySwatchLight.shade200, primarySwatchLight.shade100]);
          }
          else if(hover && !Get.isDarkMode){
            lightGradient.value = LinearGradient(colors: [primarySwatchLight.shade400, primarySwatchLight.shade500, primarySwatchLight.shade600]);
          }
          else{
            darkGradient.value = LinearGradient(colors: [primarySwatchLight.shade100, primarySwatchLight.shade200, primarySwatchLight.shade300]);
            lightGradient.value = LinearGradient(colors: [primarySwatchLight.shade600, primarySwatchLight.shade400, primarySwatchLight.shade400]);
          }
        },
          borderRadius: BorderRadius.circular(15.0),
        child: Obx(
          ()=> Container(
            decoration: BoxDecoration(
              gradient: Get.isDarkMode ? darkGradient.value : lightGradient.value
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: child,
            ),
          ),
        )
      ),
    );
  }

}