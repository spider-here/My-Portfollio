import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:zakwan_ali_portfolio/controllers/presentation/pages_controller.dart';
import 'package:zakwan_ali_portfolio/data/local/local_data.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/app_neumorphic.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/context_theme.dart';
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
            children: <Widget>[
              Padding(
                padding: context.designInsetOnly(top: 100.0),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: context.width / 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TypeWriterText(
                            text: Text(
                              LocalData.welcome,
                              style: context.textTheme.headlineLarge,
                              textAlign: TextAlign.start,
                            ),
                            duration: const Duration(milliseconds: 1),
                          ),
                          Text(
                            LocalData.headline,
                            style: context.textTheme.headlineSmall,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            LocalData.headlineStyled,
                            style: context.textTheme.headlineMedium,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            LocalData.introduction,
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
                          children: <Widget>[
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
              const SpaceBox.horizontal(space: 150.0),
      SizedBox(
        height: context.heightFromDesign(690.0),
        width: context.widthFromDesign(446.0),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              bottom: context.heightFromDesign(66.0),
              left: context.widthFromDesign(120.0),
              child: Transform.rotate(
                angle: -math.pi / 16.0,
                child: Card(
                  color: context.appTheme.scaffoldBackgroundColor,
                  elevation: 6.0,
                  child: Container(
                    padding: context.designInsetAll(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.appTextTheme.titleLarge!.color!,
                        width: 5.0,
                      ),
                    ),
                    child: Container(
                      padding: context.designInsetAll(2.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.appTheme.colorScheme.secondary,
                          width: 2.0,
                        ),
                      ),
                      child: Container(
                        padding: context.designInsetAll(2.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.appTheme.primaryColor,
                            width: 8.0,
                          ),
                        ),
                        child: Container(
                          padding: context.designInsetAll(2.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: context.appTextTheme.titleLarge!.color!,
                              width: 5.0,
                            ),
                          ),
                          child: Container(
                            height: context.heightFromDesign(346.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: context.appTextTheme.titleLarge!.color!,
                                width: 3.0,
                              ),
                            ),
                            child: AspectRatio(
                              aspectRatio: 0.8,
                              child: Image.asset(
                                'images/flutter.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: context.heightFromDesign(76.0),
              left: 0.0,
              child: Transform.rotate(
                angle: math.pi / 16.0,
                child: Card(
                  color: Colors.transparent,
                  elevation: 16.0,
                  child: Container(
                    padding: context.designInsetAll(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.appTextTheme.titleLarge!.color!,
                        width: 5.0,
                      ),
                    ),
                    child: Container(
                      padding: context.designInsetAll(2.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.appTheme.colorScheme.secondary,
                          width: 2.0,
                        ),
                      ),
                      child: Container(
                        padding: context.designInsetAll(2.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.appTheme.primaryColor,
                            width: 8.0,
                          ),
                        ),
                        child: Container(
                          padding: context.designInsetAll(2.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: context.appTextTheme.titleLarge!.color!,
                              width: 5.0,
                            ),
                          ),
                          child: Container(
                            height: context.heightFromDesign(346.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: context.appTextTheme.titleLarge!.color!,
                                width: 3.0,
                              ),
                            ),
                            child: AspectRatio(
                              aspectRatio: 0.8,
                              child: Image.asset(
                                'images/portrait.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )],
          )),
    );
  }
}
