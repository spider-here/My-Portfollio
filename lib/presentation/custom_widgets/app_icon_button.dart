import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../creatives/app_colors.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onClick;
  final RxBool hover = false.obs;

  AppIconButton({super.key, required this.onClick, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MouseRegion(
        onEnter: (_) {
          hover.value = true;
        },
        onExit: (_) {
          hover.value = false;
        },
        child: IconButton(
          onPressed: onClick,
          icon: icon,
          style: _themeModeStyle(context),
          hoverColor: Get.isDarkMode ? primaryColorDark : accentTextLight,
        ),
      ),
    );
  }

  ButtonStyle _themeModeStyle(BuildContext context) {

    return ButtonStyle(
      shape: const WidgetStatePropertyAll<OutlinedBorder?>(RoundedRectangleBorder(

      )),
      foregroundColor: hover.isTrue
          ? Get.isDarkMode
              ? const WidgetStatePropertyAll<Color?>(primaryColorDark)
              : const WidgetStatePropertyAll<Color?>(accentTextLight)
          : WidgetStatePropertyAll<Color?>(
              context.textTheme.titleSmall?.color),
      textStyle: WidgetStatePropertyAll<TextStyle?>(context.textTheme.titleSmall),
      overlayColor: Get.isDarkMode
          ? WidgetStatePropertyAll<Color?>(primaryColorLight.withAlpha(77))
          : WidgetStatePropertyAll<Color?>(primaryColorLight.withAlpha(26)),
    );
  }
}
