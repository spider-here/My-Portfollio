import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:zakwan_ali_portfolio/controllers/presentation/scrolls_controller.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/space_box.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/context_theme.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

import '../../../../globals.dart';
import '../../../creatives/app_colors.dart';
import '../../../creatives/app_theme.dart';
import '../../../custom_widgets/app_elevated_button.dart';
import '../../../custom_widgets/app_icon_button.dart';
import '../../../custom_widgets/app_neumorphic.dart';
import '../../../custom_widgets/page_title.dart';
import '../../desktop/about/tab_views/qualifications_view.dart';
import '../../desktop/about/tab_views/work_view.dart';

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
            scrollsC.offset > 0 ? context.heightFromDesign(kToolbarHeight) : context.heightFromDesign(kToolbarHeight + 40.0),
          ),
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 300),
            tween: Tween<double>(
              begin: context.heightFromDesign(kToolbarHeight + 40.0),
              end: scrollsC.offset > 0
                  ? context.heightFromDesign(kToolbarHeight)
                  : context.heightFromDesign(kToolbarHeight + 40.0),
            ),
            builder: (context, height, child) {
              return AppBar(
                toolbarHeight: height,
                backgroundColor: context.appTheme.scaffoldBackgroundColor,
                surfaceTintColor: Colors.transparent,
                elevation: 0.0,
                title: const Text('Flutter Developer'),
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
            SingleChildScrollView(
              controller: scrollsC.scrollController,
              physics: const BouncingScrollPhysics(),
              padding: context.designInsetLTRB(16.0, 24.0, 16.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.screenWidth / 1.1,
                    child: Column(
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
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: 'Crafting Seamless Experiences with ',
                            style: context.textTheme.headlineSmall,
                          ),
                          TextSpan(
                            text: 'Flutter Magic.',
                            style: context.textTheme.headlineMedium,
                          ),
                        ])),
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
                              // pagesC.pageJump(4);
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
                  const SpaceBox(space: 50.0),
                  PageTitle(context: context, text: 'About me'),
                  const SpaceBox(space: 32.0),
                  const Text(
                    'Passionate and skilled in the realm of Computer Science,'
                        ' I bring a wealth of experience and expertise in web and mobile application development,'
                        ' particularly in Flutter. With a solid foundation in Agile methodologies,'
                        ' I have led teams to deliver high-quality Android, iOS, and web applications,'
                        ' showcasing advanced logic building and robust problem-solving abilities.'
                        ' My commitment to continuous learning is evident through certifications'
                        ' in Flutter Application Development and Microsoft Office Expertise.'
                        ' As a technology enthusiast, I stay abreast of modern trends while honing my skills in full-stack development,'
                        ' API integration, debugging, and IT support. With a track record of successfully leading projects,'
                        ' I am driven by a relentless pursuit of excellence and thrive in dynamic,'
                        ' collaborative environments where I can apply and refine my skills to drive impactful solutions.',
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    width: context.widthFromDesign(550.0),
                    height: context.widthFromDesign(750.0),
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          SizedBox(
                            width: context.widthFromDesign(550.0),
                            height: context.heightFromDesign(50.0),
                            child: TabBar(
                              tabAlignment: TabAlignment.start,
                              dividerHeight: 0.0,
                              isScrollable: true,
                              splashBorderRadius: BorderRadius.zero,
                              indicatorColor: context.textTheme.headlineMedium?.color,
                              labelColor: context.textTheme.headlineMedium?.color,
                              tabs: [
                                Tab(
                                  height: context.heightFromDesign(30.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.work_rounded,
                                        size: context.fontSizeFromDesign(20.0),
                                      ),
                                      const SpaceBox.horizontal(space: 10.0),
                                      Text(
                                        'Work',
                                        style: TextStyle(
                                            fontSize:
                                            context.textTheme.bodySmall?.fontSize),
                                      )
                                    ],
                                  ),
                                ),
                                Tab(
                                  height: context.heightFromDesign(30.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: context.fontSizeFromDesign(20.0),
                                      ),
                                      const SpaceBox.horizontal(space: 10.0),
                                      Text(
                                        'Qualification',
                                        style: TextStyle(
                                            fontSize:
                                            context.textTheme.bodySmall?.fontSize),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: DefaultTabController(
                              length: 2,
                              child: AppNeumorphic(
                                child: TabBarView(
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    WorkView(),
                                    QualificationsView(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SpaceBox(space: 32.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppElevatedButton(
                                  onClick: () {
                                    Globals.downloadFile(
                                        'https://firebasestorage.googleapis.com/v0/b/zakwan-ali.appspot.com/o/cv%2FZakwan%20Ali%20Tariq%20-%20CV.pdf?alt=media&token=f2596387-81e5-494d-b049-d6a52be00222');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.file_download_outlined,
                                        size: context.fontSizeFromDesign(14.0),
                                        color: primaryTextDark,
                                      ),
                                      const SpaceBox.horizontal(space: 10.0),
                                      Text(
                                        'Download Resume',
                                        style: context.textTheme.bodySmall?.copyWith(
                                            color: primaryTextDark,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // MServices(),
                  // MPortfolio(),
                  // MContact(),
                ],
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomRight,
              child: Image.asset(
                'images/portrait.png',
                height: context.heightFromDesign(380.0),
              ),
            )
          ],
        ),
      );
    });
  }
}
