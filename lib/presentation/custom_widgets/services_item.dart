import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/controllers/presentation/pages_controller.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/context_theme.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart' as rc;
import '../creatives/app_colors.dart';
import 'app_icon_button.dart';


class ServicesItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String info;
  final FlipCardController flipCardController = FlipCardController();
  final ImageProvider image;
  final PagesController pagesC = Get.find<PagesController>();

  ServicesItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.info,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: FlipCard(
        controller: flipCardController,
        front: Card(
          shape: const RoundedRectangleBorder(
          ),
          elevation: 2.0,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: Get.isDarkMode
                  ? <Color>[
                      primarySwatchLight.shade300,
                      primarySwatchLight.shade600,
                      primarySwatchLight.shade800,
                      backgroundDark
                    ]
                  : <Color>[
                      primarySwatchLight.shade600,
                      primarySwatchLight.shade300,
                      primarySwatchLight.shade100,
                      backgroundLight,
                      backgroundLight
                    ],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: context.designInsetLTRB(20.0, 20.0, 20.0, 5.0),
                  child: Text(
                    title,
                    style: context.appTextTheme.titleSmall,
                  ),
                ),
                Padding(
                  padding: context.designInsetSymmetric(horizontal: 20.0),
                  child: Text(
                    subtitle,
                    style: context.appTextTheme.bodyMedium,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        padding: context.designInsetOnly(bottom: 5.0, right: 5.0),
                        child: AppIconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: context.appTextTheme.bodyMedium?.color,
                          ),
                          onClick: flipCardController.toggleCard,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
        back: Card(
          shape: const RoundedRectangleBorder(
          ),
          elevation: 2.0,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
                opacity: 0.04,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: context.designInsetAll(rc.ResponsiveContext(context).isLandscape ? 50.0 : 8.0),
                  child: Text(
                    info,
                    textAlign: TextAlign.justify,
                    style: rc.ResponsiveContext(context).isLandscape ? context.appTextTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ): context.appTextTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: context.designInsetAll(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AppIconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: context.appTextTheme.bodyMedium?.color,
                        ),
                        onClick: flipCardController.toggleCard,
                      ),
                      Padding(
                        padding: context.designInsetOnly(right: 10.0),
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            textStyle: WidgetStatePropertyAll<TextStyle?>(
                              rc.ResponsiveContext(context).isLandscape ? context.appTextTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ): context.appTextTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          child: const Text(
                            'Want your app done?',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
