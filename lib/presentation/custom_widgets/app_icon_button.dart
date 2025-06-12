import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/presentation/theme_controller.dart';
import '../creatives/app_colors.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onClick;
  final ThemeController themeC = Get.find<ThemeController>();
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
          hoverColor: themeC.dark.isTrue ? accentTextDark : accentTextLight,
        ),
      ),
    );
  }

  ButtonStyle _themeModeStyle(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ButtonStyle(
      shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      )),
      foregroundColor: hover.isTrue
          ? themeC.dark.isTrue
              ? const WidgetStatePropertyAll(accentTextDark)
              : const WidgetStatePropertyAll(accentTextLight)
          : WidgetStatePropertyAll(
              Theme.of(context).textTheme.titleSmall?.color),
      textStyle: WidgetStatePropertyAll(theme.textTheme.titleSmall),
      overlayColor: themeC.dark.isTrue
          ? WidgetStatePropertyAll(primaryColor.withOpacity(0.3))
          : WidgetStatePropertyAll(primaryColor.withOpacity(0.1)),
    );
  }
}
