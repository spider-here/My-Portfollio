import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/controllers/theme_controller.dart';
import 'package:zakwan_ali_portfolio/creatives/colors.dart';
import 'package:zakwan_ali_portfolio/custom_widgets/app_elevated_button.dart';
import 'package:zakwan_ali_portfolio/custom_widgets/app_icon_button.dart';

class DHome extends StatelessWidget {
  final ThemeController themeC = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppIconButton(
                    onClick: () {},
                    icon: SvgPicture.asset(
                      'icons/linkedin.svg',
                      color:
                          themeC.dark.isTrue ? accentTextDark : accentTextLight,
                    )),
                AppIconButton(
                    onClick: () {},
                    icon: SvgPicture.asset(
                      'icons/github.svg',
                      color:
                          themeC.dark.isTrue ? accentTextDark : accentTextLight,
                    )),
              ],
            ),
            Padding(padding: EdgeInsets.only(left: 50.0)),
            Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width/3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, I\'m Zakwan',
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Crafting Seamless Experiences with',
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Flutter Magic.',
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Experienced Flutter developer with a strong background in web and mobile app development. Committed to continuous learning and dedicated to delivering quality work.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.start,
                        maxLines: 10,
                      ),
                    ],
                  ),
                ),
                AppElevatedButton(onClick: (){}, child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Contact me', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: primaryTextDark, fontWeight: FontWeight.bold),),
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    Icon(Icons.send_rounded, size: 18.0, color: primaryTextDark,)
                  ],
                ))
              ],
            ),
            Stack(
              children: [
                ShaderMask(shaderCallback: (Rect bounds) {
                  return themeC.dark.isTrue
                      ? LinearGradient(colors: [accentTextLight, accentTextDark])
                          .createShader(bounds)
                      : LinearGradient(colors: [accentTextDark, accentTextLight])
                          .createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: SvgPicture.asset('icons/curly_braces.svg', width: size.width/4, height: size.width/4,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
