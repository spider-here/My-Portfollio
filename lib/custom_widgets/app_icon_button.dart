import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';
import '../creatives/colors.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onClick;
  final ThemeController themeC = Get.put(ThemeController());
  final RxBool hover = false.obs;

  AppIconButton({required this.onClick, required this.icon});

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
          hoverColor: themeC.dark.isTrue ? accentTextDark : accentTextLight,
        ),
      ),
    );
  }

  ButtonStyle _themeModeStyle(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ButtonStyle(
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      )),
      foregroundColor: hover.isTrue
          ? themeC.dark.isTrue
              ? MaterialStateProperty.all(accentTextDark)
              : MaterialStateProperty.all(accentTextLight)
          : MaterialStateProperty.all(
              Theme.of(context).textTheme.titleSmall?.color),
      textStyle: MaterialStateProperty.all(theme.textTheme.titleSmall),
      overlayColor: themeC.dark.isTrue
          ? MaterialStateProperty.all(primaryColor.withOpacity(0.3))
          : MaterialStateProperty.all(primaryColor.withOpacity(0.1)),
    );
  }
}
