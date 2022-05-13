import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/AppUtils.dart';
import '../utils/ColorUtils.dart';
import '../utils/WidgetUtils.dart';
import '../login/LoginScreen.dart';

class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashState();
  }
  
}
class SplashState extends State<Splash>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gotoLogin();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AppUtils.chnageStatusBar(ColorUtils.colorBg);
    return Scaffold(
      backgroundColor: ColorUtils.colorBg,
      body: Center(
        child: Text(AppUtils.welcomeMessage,style: WidgetUtils.textStyleViewBold(Colors.white, 20)),
      ),
    );
  }


  gotoLogin(){
    Timer(Duration(seconds: 5),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())));
  }
}