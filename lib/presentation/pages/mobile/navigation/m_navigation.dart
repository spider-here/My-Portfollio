import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/controllers/presentation/scrolls_controller.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/space_box.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/mobile/about/m_about.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/context_theme.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

import '../../../creatives/app_theme.dart';
import '../../../custom_widgets/app_icon_button.dart';
import '../home/m_home.dart';

class MNavigation extends StatelessWidget {
  final ScrollsController scrollsC =
  Get.put<ScrollsController>(ScrollsController());

  MNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            scrollsC.offset > context.screenHeight/7
                ? context.heightFromDesign(kToolbarHeight)
                : context.heightFromDesign(kToolbarHeight + 40.0),
          ),
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 300),
            tween: Tween<double>(
              begin: context.heightFromDesign(kToolbarHeight + 40.0),
              end: scrollsC.offset > context.screenHeight/7
                  ? context.heightFromDesign(kToolbarHeight)
                  : context.heightFromDesign(kToolbarHeight + 40.0),
            ),
            builder: (context, height, child) {
              return AppBar(
                toolbarHeight: height,
                backgroundColor: context.appTheme.scaffoldBackgroundColor,
                surfaceTintColor: Colors.transparent,
                elevation: 0.0,
                title: Text(scrollsC.offset > context.screenHeight/7 ? 'Zakwan Ali Tariq' : 'Flutter Developer' ),
                titleTextStyle: context.textTheme.titleSmall,
                centerTitle: false,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0.8),
                  child: scrollsC.offset > 0
                      ? const Divider(
                      color: Colors.grey, thickness: 0.2, height: 0.8)
                      : const SizedBox(),
                ),
                actions: [
                  AppIconButton(
                    onClick: AppTheme.changeTheme,
                    icon: Get.isDarkMode
                        ? const Icon(Icons.wb_sunny_outlined)
                        : const Icon(Icons.nightlight_outlined),
                  ),
                  // const SpaceBox.horizontal(space: 100.0)
                ],
              );
            },
          ),
        ),
        body: Stack(
          children: [
            Align(
              alignment: FractionalOffset.bottomRight,
              child: Obx(() {
                if (!scrollsC.hasClients) return const SizedBox.shrink();

                final scroll = scrollsC.pixels.value;

                final scrolledToMid = scroll > context.screenHeight / 2;
                final scrolledDownStart = scroll > 0.0;

                return AnimatedOpacity(
                  opacity: scrolledToMid
                      ? 0.0
                      : scrolledDownStart
                      ? 0.2
                      : 1.0,
                  duration: const Duration(milliseconds: 300),
                  // child: Image.asset(
                  //   'images/portrait.png',
                  //   height: context.heightFromDesign(420.0),
                  // ),
                );
              }),
            ),
            SingleChildScrollView(
              controller: scrollsC.scrollController,
              physics: const BouncingScrollPhysics(),
              padding: context.designInsetLTRB(16.0, 24.0, 16.0, 0.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MHome(),
                  SpaceBox(space: 100.0),
                  MAbout(),
                  SpaceBox(space: 100.0),

                  // MServices(),
                  // MPortfolio(),
                  // MContact(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
