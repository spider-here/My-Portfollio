import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/presentation/pages_controller.dart';
import '../../../custom_widgets/default_page_body.dart';
import '../../../custom_widgets/default_page_scaffold.dart';
import '../../../custom_widgets/page_title.dart';
import '../../../custom_widgets/services_item.dart';

class DServices extends StatelessWidget {
  final PagesController pagesC = Get.find<PagesController>();

  DServices({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPageScaffold(
      body: DefaultPageBody(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 100.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  PageTitle(context: context, text: 'Services I offer'),
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0),
                  ),
                  Expanded(
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: ServicesItem(
                            title: 'Mobile App Development',
                            subtitle: 'Flutter/Dart',
                            info: 'Flutter simplifies mobile app development by offering a unified development platform for both Android and iOS. Its streamlined workflow and intuitive UI framework empowers to build visually stunning and feature-rich applications. Let\'s craft your next mobile app together and bring your ideas to life!',
                            image: const AssetImage('images/mobile1.png'),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 25.0),
                        ),
                        Expanded(
                          child: ServicesItem(
                            title: 'Web App Development',
                            subtitle: 'Flutter/Dart',
                            info: 'Flutter extends its versatility to web development, crafting dynamic and engaging web applications. With Flutter\'s adaptability and performance, businesses can enhance their online presence and user engagement across platforms. Elevate your online presence with a custom Flutter web app tailored to your needs!',
                            image: const AssetImage('images/web1.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
