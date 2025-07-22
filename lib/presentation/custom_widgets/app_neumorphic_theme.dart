import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/context_theme.dart';

import '../creatives/app_colors.dart';

class AppNeumorphicTheme extends StatelessWidget {
  final Widget child;

  const AppNeumorphicTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Get.isDarkMode;

    return NeumorphicTheme(
      theme: NeumorphicThemeData(
        baseColor: isDark ? Colors.grey.shade800 : Colors.grey.shade50,
        lightSource: isDark ? LightSource.bottomRight : LightSource.topLeft,
      ),
      child: child,
    );
  }
}


