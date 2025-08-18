import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/controllers/presentation/pages_controller.dart';
import 'package:zakwan_ali_portfolio/presentation/creatives/app_theme.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/navigation/d_navigation.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/mobile/navigation/m_navigation.dart';
import 'package:zakwan_ali_portfolio/wrapper.dart';

import 'controllers/service/contact_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      initialRoute: '/',
      getPages: <GetPage<dynamic>>[
        GetPage<dynamic>(name: '/', page: () => const Wrapper()),
        GetPage<dynamic>(name: '/dNav', page: DNavigation.new),
        GetPage<dynamic>(name: '/mNav', page: MNavigation.new),
      ],
      initialBinding: BindingsBuilder<dynamic>(() {
        Get.lazyPut<PagesController>(PagesController.new);
        Get.lazyPut<ContactController>(ContactController.new);
      }),
    );
  }
}
