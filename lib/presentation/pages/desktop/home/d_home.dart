
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:zakwan_ali_portfolio/controllers/presentation/pages_controller.dart';
import 'package:zakwan_ali_portfolio/controllers/presentation/theme_controller.dart';
import '../../../creatives/app_colors.dart';
import '../../../custom_widgets/app_elevated_button.dart';
import '../../../custom_widgets/defaultPageBody.dart';
import '../../../custom_widgets/scroll_widget.dart';

class DHome extends StatelessWidget {
  final ThemeController themeC = Get.find<ThemeController>();
  final PagesController pagesC = Get.find<PagesController>();

  DHome({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(100.0, 50.0, 100.0, 0.0),
        child: DefaultPageBody(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 100.0),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width / 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TypeWriterText(
                          text: Text(
                            'Hi, I\'m Zakwan',
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontSize: 38.0
                            ),
                            textAlign: TextAlign.start,
                          ),
                          duration: const Duration(
                              milliseconds: 1),
                        ),
                        Text(
                          'Crafting Seamless Experiences with',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontSize: 22.0
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          'Flutter Magic.',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontSize: 26.0
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          'Experienced Flutter developer with a strong background in web and mobile app development. Committed to continuous learning and dedicated to delivering quality work.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 16.0
                          ),
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
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                color: primaryTextDark,
                                fontWeight: FontWeight.bold),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 10.0)),
                          Icon(
                            Icons.send_outlined,
                            size: 14.0,
                            color: primaryTextDark,
                          )
                        ],
                      )),
                  ScrollWidget(
                    onClick: () {
                      pagesC.nextPage();
                    },
                    scrollDown: true,
                  )
                ],
              ),
            ),
            const Spacer(),
            Image.asset('images/portrait.png'),
          ],
        )
      ),
    );
  }
}
