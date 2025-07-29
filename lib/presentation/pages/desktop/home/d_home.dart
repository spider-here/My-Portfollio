import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:zakwan_ali_portfolio/controllers/presentation/pages_controller.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';
import '../../../creatives/app_colors.dart';
import '../../../custom_widgets/app_elevated_button.dart';
import '../../../custom_widgets/default_page_body.dart';
import '../../../custom_widgets/space_box.dart';

class DHome extends StatelessWidget {
  final PagesController pagesC = Get.find<PagesController>();

  DHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: context.designInsetLTRB(100.0, 50.0, 100.0, 0.0),
          child: DefaultPageBody(
            children: [
              Padding(
                padding: context.designInsetOnly(top: 100.0),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.width / 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TypeWriterText(
                            text: Text(
                              'Hi, I\'m Zakwan',
                              style: context.textTheme.headlineLarge,
                              textAlign: TextAlign.start,
                            ),
                            duration: const Duration(milliseconds: 1),
                          ),
                          Text(
                            'Crafting Seamless Experiences with',
                            style: context.textTheme.headlineSmall,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'Flutter Magic.',
                            style: context.textTheme.headlineMedium,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            'Experienced Flutter developer with a strong background in web and mobile app development. Committed to continuous learning and dedicated to delivering quality work.',
                            style: context.textTheme.bodyMedium,
                            textAlign: TextAlign.start,
                            maxLines: 10,
                          ),
                        ],
                      ),
                    ),
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
                              style: context.textTheme.bodySmall?.copyWith(
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
              const Spacer(),
              // Image.asset('images/portrait.png', width: context.widthFromDesign(600.0), height: context.heightFromDesign(850.0),),
            ],
          )),
    );
  }
}
