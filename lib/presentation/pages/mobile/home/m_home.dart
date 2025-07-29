
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:zakwan_ali_portfolio/controllers/presentation/pages_controller.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';
import '../../../creatives/app_colors.dart';
import '../../../custom_widgets/app_elevated_button.dart';
import '../../../custom_widgets/default_page_body.dart';
import '../../../custom_widgets/space_box.dart';

class MHome extends StatelessWidget {
  final PagesController pagesC = Get.find<PagesController>();

  MHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth/1.1,
            padding: context.designInsetLTRB(16.0, 24.0, 16.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TypeWriterText(
                  text: Text(
                    'Hi, I\'m Zakwan',
                    style: context.textTheme.headlineLarge,
                    textAlign: TextAlign.start,
                  ),
                  duration: const Duration(
                      milliseconds: 1),
                ),
                RichText(text: TextSpan(
                    children: [
                    TextSpan(
                      text: 'Crafting Seamless Experiences with ',
                      style: context.textTheme.headlineSmall,
                    ),
                      TextSpan(
                        text: 'Flutter Magic.',
                        style: context.textTheme.headlineMedium,
                      ),
                  ]
                )),
                const SpaceBox(space: 12.0),
                Text(
                  'Experienced Flutter developer with a strong background in web and mobile app development. Committed to continuous learning and dedicated to delivering quality work.',
                  style: context.textTheme.bodyMedium,
                  textAlign: TextAlign.start,
                  maxLines: 10,
                ),
                const SpaceBox(space: 32.0),
                AppElevatedButton(
                    onClick: () {
                      pagesC.pageJump(4);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Contact me',
                          style: context
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                              color: primaryTextDark,
                              fontWeight: FontWeight.bold),
                        ),
                        const SpaceBox.horizontal(space: 10.0),
                        Icon(
                          Icons.send_outlined,
                          size: 14.0,
                          color: primaryTextDark,
                        )
                      ],
                    )),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('images/portrait.png', height: context.heightFromDesign(400.0),),
            ],
          ),
        ],
      ),
    );
  }
}
