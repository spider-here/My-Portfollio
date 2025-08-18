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
              const SpaceBox.horizontal(space: 100.0),
      Stack(
        alignment: Alignment.topCenter,
        children: [
          // Nail at the top
          Positioned(
            top: 8,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black, // nail color
              ),
            ),
          ),

          // Strings
          Positioned(
            top: 16,
            child: CustomPaint(
              size: Size(context.widthFromDesign(300.0), 50), // width ≈ frame width
              painter: _StringPainter(),
            ),
          ),

          // The tilted photo frame
          Transform.rotate(
            angle: math.pi / 16.0,
            child: Card(
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
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.appTextTheme.titleLarge!.color!,
                            width: 3.0,
                          ),
                        ),
                        child: Image.asset(
                          'images/portrait.png',
                          width: context.widthFromDesign(290.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )],
          )),
    );
  }
}

class _StringPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    // Nail at the center top
    final nail = Offset(size.width / 2, 0);

    // Left and right corners of frame (approximate)
    final leftCorner = Offset(size.width * 0.25, size.height);
    final rightCorner = Offset(size.width * 0.75, size.height);

    // Draw strings
    canvas.drawLine(nail, leftCorner, paint);
    canvas.drawLine(nail, rightCorner, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
