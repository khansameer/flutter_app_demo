import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AppUtils.dart';
import 'ColorUtils.dart';

class WidgetUtils{




  static OutlineInputBorder enabledBorder(Color color){
     return OutlineInputBorder(
       borderRadius: BorderRadius.circular(25),
       borderSide: BorderSide(color: color, width: 2),
     );
   }
   static TextStyle textStyleView(Color color){
    return TextStyle(color:color,fontSize: 14,fontFamily: AppUtils.fontSatoshi);
   }
  static TextStyle textStyleView1(Color color,double size){
    return TextStyle(color:color,fontSize: size,fontFamily: AppUtils.fontSatoshi);
  }
  static TextStyle textStyleViewBold(Color color,double size){
    return TextStyle(color:color,fontSize: size,fontFamily: AppUtils.fontSatoshi,fontWeight: FontWeight.bold);
  }
  static TextStyle textStyleViewBold1(Color color,double size){
    return TextStyle(backgroundColor:color,color:color,fontSize: size,fontFamily: AppUtils.fontSatoshi,fontWeight: FontWeight.bold);
  }
   static InputDecoration inputDecoration(Color colortext,IconData iconImage,Color colorImage,String hint){
    return   InputDecoration(

      prefixIcon: Padding(
        padding: EdgeInsets.all(0), // add padding to adjust icon
        child: Icon(iconImage,color: colorImage,),
      ),
      border: WidgetUtils.enabledBorder(Colors.white),
      enabledBorder: WidgetUtils.enabledBorder(ColorUtils.colorButton),
      hintStyle: TextStyle(color:colortext,fontFamily: AppUtils.fontSatoshi,fontSize: 14),
      hintText: hint,
      focusedBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(25.0),
      ),

    );
   }
}