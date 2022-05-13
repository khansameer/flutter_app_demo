import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ColorUtils.dart';

class AppUtils {
  static String fontSatoshi="Satoshi";
  static String fontTelma="Telma";
  static String signIN="Sign In";
  static String showEmailError="Please enter email id";
  static String showInvalidEmailError="Please enter a valid email address";
  static String showPasswordError="Please enter password!";
  static String passwordValidationMessage="Password should contain more than 8 characters!";
  static String login="Login";
  static String successfullyLoginMessage="You are successfully logged in";
  static String welcomeMessage="Welcome";
  static String doneMessage="Done";

  static AppBar toolbarwithText(BuildContext context,String title)
  {
    return AppBar(

      backgroundColor: ColorUtils.colorBg,
      elevation: 0,
      leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),
          onPressed: (){Navigator.pop(context,true);}
      ),
      centerTitle: true,
      title: Text(title.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w800,fontFamily: AppUtils.fontSatoshi),),
      automaticallyImplyLeading: true,

    );
  }
  static  chnageStatusBar(Color colorCode){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:colorCode,
      systemNavigationBarColor: colorCode,
      statusBarBrightness: Brightness.dark,
    ));
  }

  static showErrorMessage(BuildContext context,String msg)
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));

  }





}