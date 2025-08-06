import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:zakwan_ali_portfolio/data/local/local_data.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/context_theme.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

import '../../../creatives/app_colors.dart';
import '../../../custom_widgets/app_elevated_button.dart';
import '../../../custom_widgets/space_box.dart';

class MHome extends StatelessWidget{
  const MHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: context.screenHeight - kToolbarHeight *2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TypeWriterText(
            text: Text(
              LocalData.welcome,
              style: context.appTextTheme.headlineLarge,
              textAlign: TextAlign.start,
            ),
            duration: const Duration(milliseconds: 1),
          ),
          RichText(
              text: TextSpan(children: <InlineSpan>[
                TextSpan(
                  text: LocalData.headline,
                  style: context.appTextTheme.headlineSmall,
                ),
                TextSpan(
                  text: ' ${LocalData.headlineStyled}',
                  style: context.appTextTheme.headlineMedium,
                ),
              ])),
          const SpaceBox(space: 12.0),
          Text(
            LocalData.introduction, style: context.appTextTheme.bodyMedium,
            textAlign: TextAlign.start,
            maxLines: 10,
          ),
          const SpaceBox(space: 50.0),
          AppElevatedButton(
              onClick: () {
                // pagesC.pageJump(4);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Contact me',
                    style: context.appTextTheme.bodySmall?.copyWith(
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
    );
  }

}