import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../custom_widgets/services_item.dart';

class MServices extends StatelessWidget {

  const MServices({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.width/2,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: <Widget>[
          ServicesItem(
            title: 'Mobile App Development',
            subtitle: 'Flutter/Dart',
            info: 'Flutter simplifies mobile app development by offering a unified development platform for both Android and iOS. Its streamlined workflow and intuitive UI framework empowers to build visually stunning and feature-rich applications. Let\'s craft your next mobile app together and bring your ideas to life!',
            image: const AssetImage('images/mobile1.png'),
          ),
          ServicesItem(
            title: 'Web App Development',
            subtitle: 'Flutter/Dart',
            info: 'Flutter extends its versatility to web development, crafting dynamic and engaging web applications. With Flutter\'s adaptability and performance, businesses can enhance their online presence and user engagement across platforms. Elevate your online presence with a custom Flutter web app tailored to your needs!',
            image: const AssetImage('images/web1.png'),
          ),
        ],
      ),
    );
  }
}
