import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/other_profiles.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/space_box.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/context_theme.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';

import '../../../../controllers/presentation/pages_controller.dart';
import '../../../creatives/app_colors.dart';
import '../../../creatives/app_theme.dart';
import '../../../custom_widgets/app_icon_button.dart';
import '../../../custom_widgets/scroll_widget.dart';
import '../../../custom_widgets/tab_button.dart';
import '../about/m_about.dart';
import '../contact/m_contact.dart';
import '../home/m_home.dart';
import '../portfolio/m_portfolio.dart';
import '../services/m_services.dart';

class MNavigation extends StatelessWidget {
  final PagesController pagesC = Get.find<PagesController>();
  final List<Widget> pages = [
    MHome(),
    MAbout(),
    MServices(),
    MPortfolio(),
    MContact()
  ];

  MNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        isDraggable: false,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: SliderAppBar(
          config: SliderAppBarConfig(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            drawerIconColor:
            Get.isDarkMode ? primaryTextDark : primaryTextLight,
            title: Text(
              'Flutter Developer',
              textAlign: TextAlign.center,
              style: context.textTheme.titleSmall,
            ),
            trailing: AppIconButton(
              onClick: AppTheme.changeTheme,
              icon: Get.isDarkMode
                  ? const Icon(Icons.wb_sunny_outlined)
                  : const Icon(Icons.nightlight_outlined),
            ),
          ),
        ),
        sliderOpenSize: context.widthFromDesign(180.0),
        slider: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 12.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: context.heightFromDesign(8.0),
            children: [
              TabButton(
                onClick: () => pagesC.pageJump(0),
                text: 'Home',
                index: 0,
                selectedIndex: pagesC.currentPageIndex,
              ),
              TabButton(
                onClick: () => pagesC.pageJump(1),
                text: 'About',
                index: 1,
                selectedIndex: pagesC.currentPageIndex,
              ),
              TabButton(
                onClick: () => pagesC.pageJump(2),
                text: 'Services',
                index: 2,
                selectedIndex: pagesC.currentPageIndex,
              ),
              TabButton(
                onClick: () => pagesC.pageJump(3),
                text: 'Portfolio',
                index: 3,
                selectedIndex: pagesC.currentPageIndex,
              ),
              TabButton(
                onClick: () => pagesC.pageJump(4),
                text: 'Contact',
                index: 4,
                selectedIndex: pagesC.currentPageIndex,
              ),
              const Spacer(),
              const OtherProfiles(horizontal: true,),
            ],
          ),
        ),
        child: Stack(
          children: [
            Scrollbar(
              controller: pagesC.pageController,
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: pagesC.pageController,
                pageSnapping: false,
                scrollDirection: Axis.vertical,
                children: pages,
                onPageChanged: (index) {
                  pagesC.currentPageIndex.value = index;
                },
              ),
            ),
            Align(
                alignment: FractionalOffset.bottomLeft,
                child: Obx(() {
                  return Visibility(
                    visible: pagesC.currentPageIndex.value != 4,
                    child: Padding(
                      padding: context.designInsetOnly(bottom: 16.0, left: 8.0),
                      child: ScrollWidget(
                        onClick: pagesC.nextPage,
                        scrollDown: true,
                      ),
                    ),
                  );
                })),
            Align(
                alignment: FractionalOffset.topRight,
                child: Obx(() {
                  return Visibility(
                    visible: pagesC.currentPageIndex.value == 4,
                    child: Padding(
                      padding: context.designInsetOnly(top: 16.0, right: 8.0),
                      child: ScrollWidget(
                        onClick: () => pagesC.pageJump(0),
                        scrollDown: false,
                      ),
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }
}
