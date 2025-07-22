import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zakwan_ali_portfolio/controllers/presentation/pages_controller.dart';

import '../creatives/app_theme.dart';
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
    return FlipCard(
      controller: flipCardController,
      front: Card(
        shape: const RoundedRectangleBorder(

        ),
        elevation: 2.0,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: Get.isDarkMode
                ? [
                    primarySwatch.shade300,
                    primarySwatch.shade600,
                    primarySwatch.shade800,
                    backgroundDark
                  ]
                : [
                    primarySwatch.shade600,
                    primarySwatch.shade300,
                    primarySwatch.shade100,
                    backgroundLight,
                    backgroundLight
                  ],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
                child: Text(
                  title,
                  style: context.textTheme.titleSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  subtitle,
                  style: context.textTheme.bodyMedium,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, right: 5.0),
                      child: AppIconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: context.textTheme.bodyMedium?.color,
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
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text(
                  info,
                  textAlign: TextAlign.justify,
                  style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: context.textTheme.bodyMedium?.color,
                      ),
                      onClick: flipCardController.toggleCard,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          textStyle: WidgetStatePropertyAll(
                            GoogleFonts.montserrat(
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
    );
  }
}
