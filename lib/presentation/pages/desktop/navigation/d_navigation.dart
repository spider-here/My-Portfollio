import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:zakwan_ali_portfolio/controllers/presentation/theme_controller.dart';

import '../../../../controllers/presentation/pages_controller.dart';
import '../../../custom_widgets/app_icon_button.dart';
import '../../../custom_widgets/tab_button.dart';
import '../about/d_about.dart';
import '../contact/d_contact.dart';
import '../home/d_home.dart';
import '../portfolio/d_portfolio.dart';
import '../services/d_services.dart';

class DNavigation extends StatelessWidget {
  final ThemeController themeC = Get.find<ThemeController>();
  final PagesController pagesC = Get.find<PagesController>();
  final List<Widget> pages = [
    DHome(),
    DAbout(),
    DServices(),
    DPortfolio(),
    DContact()
  ];

  DNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            pagesC.currentPageIndex > 0 ? 50.0 : 100.0,
          ),
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 300),
            tween: Tween<double>(
              begin: 100.0,
              end: pagesC.currentPageIndex > 0 ? 50.0 : 100.0,
            ),
            builder: (context, height, child) {
              return AppBar(
                toolbarHeight: height,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                surfaceTintColor: Colors.transparent,
                elevation: 0.0,
                title: const Padding(
                  padding: EdgeInsets.only(left: 100.0),
                  child: Text('Flutter Developer'),
                ),
                titleTextStyle: Theme.of(context).textTheme.titleSmall,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0.8),
                  child: pagesC.currentPageIndex > 0
                      ? const Divider(color: Colors.grey, thickness: 0.2, height: 0.8)
                      : const SizedBox(),
                ),
                actions: [
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
                  AppIconButton(
                    onClick: themeC.changeTheme,
                    icon: themeC.dark.isTrue
                        ? const Icon(Icons.wb_sunny_outlined)
                        : const Icon(Icons.nightlight_outlined),
                  ),
                  const Padding(padding: EdgeInsets.only(right: 100.0)),
                ],
              );
            },
          ),
        ),
        body: Scrollbar(
          controller: pagesC.pageController,
          child: PageView(
            controller: pagesC.pageController,
            scrollDirection: Axis.vertical,
            pageSnapping: true,
            children: pages,
            onPageChanged: (index) {
              pagesC.currentPageIndex.value = index;
            },
          ),
        ),
      ),
    );
  }
}


