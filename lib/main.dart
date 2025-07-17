import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/controllers/presentation/pages_controller.dart';
import 'package:zakwan_ali_portfolio/controllers/presentation/theme_controller.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/navigation/d_navigation.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/mobile/navigation/m_navigation.dart';
import 'package:zakwan_ali_portfolio/wrapper.dart';

import 'controllers/presentation/contact_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: const FirebaseOptions(apiKey: 'AIzaSyBbWhILR2soDc694lSzroJITJlSrkyodWM',
      authDomain: 'zakwan-ali.firebaseapp.com',
      projectId: 'zakwan-ali',
      storageBucket: 'zakwan-ali.appspot.com',
      messagingSenderId: '210275736364',
      appId: '1:210275736364:web:4c180a13f4b47b7342ea89'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final ThemeController themeController = Get.put(ThemeController(), permanent: true);
  final PagesController pagesController = Get.put(PagesController(), permanent: true);

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themeController.lightTheme,
      darkTheme: themeController.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>const Wrapper()),
        GetPage(name: '/dNav', page: DNavigation.new),
        GetPage(name: '/mNav', page: MNavigation.new),
      ],
      initialBinding: BindingsBuilder((){
        Get.lazyPut(ContactController.new);
      }),
    );
  }
}



