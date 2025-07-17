import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/presentation/theme_controller.dart';
import '../creatives/app_colors.dart';

class TabButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final int index;
  final RxInt selectedIndex;
  final ThemeController themeC = Get.find<ThemeController>();
  final RxBool hover = false.obs;

  TabButton({super.key,
    required this.onClick,
    required this.text,
    required this.index,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => TextButton(
        onPressed: onClick,
        style: _tabButtonStyle(context),
        onHover: (isHover) => hover.value = isHover,
        child: Text(text),
      ),
    );
  }

  ButtonStyle _tabButtonStyle(BuildContext context) {
    final bool isSelected = index == selectedIndex.value;
    final ThemeData theme = Theme.of(context);

    return ButtonStyle(
      shape: const WidgetStatePropertyAll(RoundedRectangleBorder(

      )),
      foregroundColor: _getForegroundColor(context, isSelected),
      textStyle: WidgetStatePropertyAll(theme.textTheme.titleSmall),
      overlayColor: themeC.dark.isTrue
          ? WidgetStatePropertyAll(primaryColor.withOpacity(0.3))
          : WidgetStatePropertyAll(primaryColor.withOpacity(0.1)),
    );
  }

  WidgetStateProperty<Color?> _getForegroundColor(BuildContext context, bool isSelected) {
    if (isSelected || hover.isTrue) {
      return themeC.dark.isTrue
          ? const WidgetStatePropertyAll(accentTextDark)
          : const WidgetStatePropertyAll(accentTextLight);
    } else {
      return WidgetStatePropertyAll(Theme.of(context).textTheme.titleSmall?.color);
    }
  }
}
