import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/presentation/creatives/app_theme.dart';
import 'package:zakwan_ali_portfolio/presentation/custom_widgets/space_box.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/context_theme.dart';
import 'package:zakwan_ali_portfolio/utils/extensions/responsive_context.dart';
import '../../../../controllers/presentation/pages_controller.dart';
import '../../../custom_widgets/app_icon_button.dart';
import '../../../custom_widgets/scroll_widget.dart';
import '../../../custom_widgets/tab_button.dart';
import '../about/d_about.dart';
import '../contact/d_contact.dart';
import '../home/d_home.dart';
import '../portfolio/d_portfolio.dart';
import '../services/d_services.dart';

class DNavigation extends StatelessWidget {
  final PagesController pagesC = Get.find<PagesController>();
  final List<Widget> pages = <Widget>[
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
            pagesC.currentPageIndex > 0
                ? context.heightFromDesign(50.0)
                : context.heightFromDesign(100.0),
          ),
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 300),
            tween: Tween<double>(
              begin: context.heightFromDesign(100.0),
              end: pagesC.currentPageIndex > 0
                  ? context.heightFromDesign(50.0)
                  : context.heightFromDesign(100.0),
            ),
            builder: (BuildContext context, double height, Widget? child) {
              return AppBar(
                toolbarHeight: height,
                backgroundColor: context.appTheme.scaffoldBackgroundColor,
                surfaceTintColor: Colors.transparent,
                elevation: 0.0,
                title: Padding(
                  padding: context.designInsetOnly(left: 100.0),
                  child: const Text('Flutter Developer'),
                ),
                titleTextStyle: context.textTheme.titleSmall,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0.8),
                  child: pagesC.currentPageIndex > 0
                      ? const Divider(
                          color: Colors.grey, thickness: 0.2, height: 0.8)
                      : const SizedBox(),
                ),
                actions: <Widget>[
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
                    onClick: AppTheme.changeTheme,
                    icon: Get.isDarkMode
                        ? const Icon(Icons.wb_sunny_outlined)
                        : const Icon(Icons.nightlight_outlined),
                  ),
                  const SpaceBox.horizontal(space: 100.0)
                ],
              );
            },
          ),
        ),
        body: Stack(
          children: <Widget>[
            Scrollbar(
              controller: pagesC.pageController,
              child: PageView(
                controller: pagesC.pageController,
                scrollDirection: Axis.vertical,
                children: pages,
                onPageChanged: (int index) {
                  pagesC.currentPageIndex.value = index;
                },
              ),
            ),
            Align(
                alignment: FractionalOffset.bottomLeft,
                child: Visibility(
                  visible: pagesC.currentPageIndex.value != 4,
                  child: Padding(
                    padding: context.designInsetOnly(left: 185.0, bottom: 50.0),
                    child: ScrollWidget(
                      onClick: pagesC.nextPage,
                      scrollDown: true,
                    ),
                  ),
                )),
            Align(
                alignment: FractionalOffset.topRight,
                child: Visibility(
                  visible: pagesC.currentPageIndex.value == 4,
                  child: Padding(
                    padding: context.designInsetOnly(top: 100.0, right: 100.0),
                    child: ScrollWidget(
                      onClick: () => pagesC.pageJump(0),
                      scrollDown: false,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
