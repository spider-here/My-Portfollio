import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/controllers/theme_controller.dart';
import 'package:zakwan_ali_portfolio/creatives/colors.dart';

class AppElevatedButton extends StatelessWidget{
  final VoidCallback onClick;
  final Widget child;
  ThemeController themeC = Get.put(ThemeController());
  Rx<LinearGradient> darkGradient = LinearGradient(colors: [primarySwatch.shade300, primarySwatch.shade600]).obs;
  Rx<LinearGradient> lightGradient = LinearGradient(colors: [primarySwatch.shade600, primarySwatch.shade300]).obs;
  AppElevatedButton({required this.onClick, required this.child});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      borderRadius: BorderRadius.circular(15.0),
      shadowColor: accentTextDark,
      child: InkWell(
        onTap: onClick,
        onHover: (hover){
          if(hover && themeC.dark.isTrue){
            darkGradient.value = LinearGradient(colors: [primarySwatch.shade600, primarySwatch.shade300]);
          }
          else if(hover && themeC.dark.isFalse){
            lightGradient.value = LinearGradient(colors: [primarySwatch.shade300, primarySwatch.shade600]);
          }
          else{
            darkGradient.value = LinearGradient(colors: [primarySwatch.shade300, primarySwatch.shade600]);
            lightGradient.value = LinearGradient(colors: [primarySwatch.shade600, primarySwatch.shade300]);
          }
        },
          borderRadius: BorderRadius.circular(15.0),
        child: Obx(
          ()=> Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: themeC.dark.isTrue ? darkGradient.value : lightGradient.value
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: child,
            ),
          ),
        )
      ),
    );
  }

}