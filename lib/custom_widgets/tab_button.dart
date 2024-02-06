import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';
import '../creatives/colors.dart';

class TabButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final int index;
  final RxInt selectedIndex;
  final ThemeController themeC = Get.put(ThemeController());
  final RxBool hover = false.obs;

  TabButton({
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
        child: Text(text),
        style: _tabButtonStyle(context),
        onHover: (isHover) => hover.value = isHover,
      ),
    );
  }

  ButtonStyle _tabButtonStyle(BuildContext context) {
    final bool isSelected = index == selectedIndex.value;
    final ThemeData theme = Theme.of(context);

    return ButtonStyle(
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      )),
      foregroundColor: _getForegroundColor(context, isSelected),
      textStyle: MaterialStateProperty.all(theme.textTheme.titleSmall),
      overlayColor: themeC.dark.isTrue
          ? MaterialStateProperty.all(primaryColor.withOpacity(0.3))
          : MaterialStateProperty.all(primaryColor.withOpacity(0.1)),
    );
  }

  MaterialStateProperty<Color?> _getForegroundColor(BuildContext context, bool isSelected) {
    if (isSelected || hover.isTrue) {
      return themeC.dark.isTrue
          ? MaterialStateProperty.all(accentTextDark)
          : MaterialStateProperty.all(accentTextLight);
    } else {
      return MaterialStateProperty.all(Theme.of(context).textTheme.titleSmall?.color);
    }
  }
}
