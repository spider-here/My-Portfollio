import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../creatives/app_colors.dart';

class TabButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final int index;
  final RxInt selectedIndex;
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
        onHover: (bool isHover) => hover.value = isHover,
        child: Text(text),
      ),
    );
  }

  ButtonStyle _tabButtonStyle(BuildContext context) {
    final bool isSelected = index == selectedIndex.value;

    return ButtonStyle(
      shape: const WidgetStatePropertyAll<OutlinedBorder?>(RoundedRectangleBorder(

      )),
      foregroundColor: _getForegroundColor(context, isSelected),
      textStyle: WidgetStatePropertyAll<TextStyle?>(context.textTheme.titleSmall),
      overlayColor: Get.isDarkMode
          ? WidgetStatePropertyAll<Color?>(primaryColorLight.withAlpha(77))
          : WidgetStatePropertyAll<Color?>(primaryColorLight.withAlpha(26)),
    );
  }

  WidgetStateProperty<Color?> _getForegroundColor(BuildContext context, bool isSelected) {
    if (isSelected || hover.isTrue) {
      return Get.isDarkMode
          ? const WidgetStatePropertyAll<Color?>(primaryColorDark)
          : const WidgetStatePropertyAll<Color?>(accentTextLight);
    } else {
      return WidgetStatePropertyAll<Color?>(context.textTheme.titleSmall?.color);
    }
  }
}
