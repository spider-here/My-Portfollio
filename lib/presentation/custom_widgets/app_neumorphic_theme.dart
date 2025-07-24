import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';


class AppNeumorphic extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  const AppNeumorphic({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    final isDark = Get.isDarkMode;

    return NeumorphicTheme(
      theme: NeumorphicThemeData(
        baseColor: isDark ? Colors.grey.shade800 : Colors.grey.shade50,
        lightSource: isDark ? LightSource.bottomRight : LightSource.topLeft,
      ),
      child: Builder(builder: (context){
        final theme = NeumorphicTheme.currentTheme(context);
        return Neumorphic(
            style: NeumorphicStyle(
              depth: NeumorphicTheme.embossDepth(context),
              lightSource: theme.lightSource,
              boxShape: const NeumorphicBoxShape.rect(),
            ),
            padding: padding ?? context.designInsetSymmetric(vertical: 8.0, horizontal: 12.0),
            child: child
        );
      }),
    );
  }
}


