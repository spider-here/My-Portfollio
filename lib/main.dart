import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/controllers/presentation/pages_controller.dart';
import 'package:zakwan_ali_portfolio/presentation/creatives/app_theme.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/navigation/d_navigation.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/mobile/navigation/m_navigation.dart';
import 'package:zakwan_ali_portfolio/wrapper.dart';

import 'controllers/presentation/contact_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBbWhILR2soDc694lSzroJITJlSrkyodWM',
          authDomain: 'zakwan-ali.firebaseapp.com',
          projectId: 'zakwan-ali',
          storageBucket: 'zakwan-ali.appspot.com',
          messagingSenderId: '210275736364',
          appId: '1:210275736364:web:4c180a13f4b47b7342ea89'));
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
      getPages: [
        GetPage(name: '/', page: () => const Wrapper()),
        GetPage(name: '/dNav', page: DNavigation.new),
        GetPage(name: '/mNav', page: MNavigation.new),
      ],
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<PagesController>(PagesController.new);
        Get.lazyPut<ContactController>(ContactController.new);
      }),
    );
  }
}
