import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';
import 'package:zakwan_ali_portfolio/controllers/theme_controller.dart';
import 'package:zakwan_ali_portfolio/creatives/colors.dart';
import 'package:zakwan_ali_portfolio/custom_widgets/tab_button.dart';
import 'package:zakwan_ali_portfolio/custom_widgets/app_icon_button.dart';
import 'package:zakwan_ali_portfolio/pages/desktop/d_about.dart';
import 'package:zakwan_ali_portfolio/pages/desktop/d_contact.dart';
import 'package:zakwan_ali_portfolio/pages/desktop/d_portfolio.dart';
import 'package:zakwan_ali_portfolio/pages/desktop/d_services.dart';

import '../../controllers/pages_controller.dart';
import 'd_home.dart';

class DNavigation extends StatelessWidget {
  final PagesController pagesC = Get.put(PagesController());
  final ThemeController themeController = Get.put(ThemeController());
  final List<Widget> pages = [
    DHome(),
    DAbout(),
    DServices(),
    DPortfolio(),
    DContact()
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 100.0),
          child: Text('Zakwan Ali'),
        ),
        titleTextStyle: Theme.of(context).textTheme.titleSmall,
        toolbarHeight: size.height / 8,
        actions: [
          TabButton(onClick: (){pagesC.pageJump(0);}, text: 'Home', index: 0, selectedIndex: pagesC.currentPageIndex,),
          TabButton(onClick: (){pagesC.pageJump(1);}, text: 'About', index: 1, selectedIndex: pagesC.currentPageIndex,),
          TabButton(onClick: (){pagesC.pageJump(2);}, text: 'Services', index: 2, selectedIndex: pagesC.currentPageIndex,),
          TabButton(onClick: (){pagesC.pageJump(3);}, text: 'Portfolio', index: 3, selectedIndex: pagesC.currentPageIndex,),
          TabButton(onClick: (){pagesC.pageJump(4);}, text: 'Contact', index: 4, selectedIndex: pagesC.currentPageIndex,),
          AppIconButton(onClick: (){themeController.changeTheme();}, icon: themeController.dark.isTrue? Icon(Icons.wb_sunny_outlined) : Icon(Icons.nightlight_outlined),),
          Padding(padding: EdgeInsets.only(right: 100.0)),
        ],
      ),
      body: PageView(
        controller: pagesC.pageController,
        scrollDirection: Axis.vertical,
        pageSnapping: false,
        children: pages,
        onPageChanged: (index) {
          pagesC.currentPageIndex.value = index;
        },
      ),
    );
  }
}


