import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/presentation/pages_controller.dart';
import '../../../custom_widgets/defaultPageBody.dart';
import '../../../custom_widgets/defaultPageScaffold.dart';
import '../../../custom_widgets/scroll_widget.dart';

class DContact extends StatelessWidget{
  final PagesController pagesC = Get.find<PagesController>();

  DContact({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultPageScaffold(
      body: Stack(
        children: [
          DefaultPageBody(
            children: const [

            ],
          ),
          Align(alignment: FractionalOffset.topRight,
            child: ScrollWidget(onClick: (){pagesC.pageJump(0);}, scrollDown: false,),)
        ],
      ),
    );
  }

}