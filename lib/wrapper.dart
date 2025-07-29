import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/desktop/navigation/d_navigation.dart';
import 'package:zakwan_ali_portfolio/presentation/pages/mobile/navigation/m_navigation.dart';

class Wrapper extends StatelessWidget{
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(context.isLandscape){
        return DNavigation();
      }
      else{
        return MNavigation();
      }
    });
  }
}