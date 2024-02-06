import 'package:flutter/cupertino.dart';
import 'package:zakwan_ali_portfolio/pages/desktop/d_navigation.dart';
import 'package:zakwan_ali_portfolio/pages/mobile/m_navigation.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth >= 600){
        return DNavigation();
      }
      else{
        return MNavigation();
      }
    });
  }
  
}