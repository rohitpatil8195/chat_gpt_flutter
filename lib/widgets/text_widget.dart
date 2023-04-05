
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String myText;
    Color? color;
    double? fontSizeCustom;
    TextWidget(  {super.key, required this.myText,this.color,this.fontSizeCustom});

  @override
  Widget build(BuildContext context) {
    return  Text(myText,style:  TextStyle(
        color:color?? Colors.white,
      fontSize: fontSizeCustom ?? 19,
      fontWeight: FontWeight.w700
    ),);
  }
}
