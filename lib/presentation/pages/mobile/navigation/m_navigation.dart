import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/controllers/presentation/scrolls_controller.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/footer.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/space_box.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/mobile/about/m_about.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/context_theme.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

import '../../../creatives/app_theme.dart';
import '../../../custom_widgets/app_icon_button.dart';
import '../../../custom_widgets/page_title.dart';
import '../contact/m_contact.dart';
import '../home/m_home.dart';
import '../portfolio/m_portfolio.dart';
import '../services/m_services.dart';

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
            builder: (BuildContext context, double height, Widget? child) {
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
                actions: <Widget>[
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
          children: <Widget>[
            // Align(
            //   alignment: FractionalOffset.bottomRight,
            //   child: Obx(() {
            //     if (!scrollsC.hasClients) return const SizedBox.shrink();
            //
            //     final scroll = scrollsC.pixels.value;
            //
            //     final scrolledToMid = scroll > context.screenHeight / 2;
            //     final scrolledDownStart = scroll > 0.0;
            //
            //     return AnimatedOpacity(
            //       opacity: scrolledToMid
            //           ? 0.0
            //           : scrolledDownStart
            //           ? 0.2
            //           : 1.0,
            //       duration: const Duration(milliseconds: 300),
            //       child: Image.asset(
            //         'images/portrait.png',
            //         height: context.heightFromDesign(420.0),
            //       ),
            //     );
            //   }),
            // ),
            SingleChildScrollView(
              controller: scrollsC.scrollController,
              physics: const BouncingScrollPhysics(),
              padding: context.designInsetOnly(top: 24.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: context.designInsetSymmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const MHome(),
                        const SpaceBox(space: 50.0),
                        PageTitle(context: context, text: 'About me'),
                        const SpaceBox(space: 16.0),
                        const MAbout(),
                        const SpaceBox(space: 50.0),
                        PageTitle(context: context, text: 'Services I offer'),
                        const SpaceBox(space:16.0),
                        const MServices(),
                        const SpaceBox(space: 50.0),
                        PageTitle(context: context, text: 'My portfolio'),
                        const SpaceBox(
                          space: 16.0,
                        ),
                        const MPortfolio(),
                        const SpaceBox(space: 50.0),
                        PageTitle(context: context, text: 'Contact me'),
                        const SpaceBox(space: 16.0,
                        ),
                        MContact(),
                      ],
                    ),
                  ),
                  const Footer()
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
