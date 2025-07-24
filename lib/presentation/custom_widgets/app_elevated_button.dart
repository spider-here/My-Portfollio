import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../creatives/app_colors.dart';


class AppElevatedButton extends StatelessWidget{
  final VoidCallback onClick;
  final Widget child;
  final Rx<LinearGradient> darkGradient = LinearGradient(colors: [primarySwatch.shade300, primarySwatch.shade600]).obs;
  final Rx<LinearGradient> lightGradient = LinearGradient(colors: [primarySwatch.shade600, primarySwatch.shade300]).obs;
  AppElevatedButton({super.key, required this.onClick, required this.child});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(15.0),
      shadowColor: accentTextDark,
      child: InkWell(
        onTap: onClick,
        onHover: (hover){
          if(hover && Get.isDarkMode){
            darkGradient.value = LinearGradient(colors: [primarySwatch.shade300, primarySwatch.shade200, primarySwatch.shade100]);
          }
          else if(hover && !Get.isDarkMode){
            lightGradient.value = LinearGradient(colors: [primarySwatch.shade400, primarySwatch.shade500, primarySwatch.shade600]);
          }
          else{
            darkGradient.value = LinearGradient(colors: [primarySwatch.shade100, primarySwatch.shade200, primarySwatch.shade300]);
            lightGradient.value = LinearGradient(colors: [primarySwatch.shade600, primarySwatch.shade400, primarySwatch.shade400]);
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