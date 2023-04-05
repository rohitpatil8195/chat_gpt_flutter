
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String myText;
    Color? color;
    TextWidget(  {super.key, required this.myText,this.color,});

  @override
  Widget build(BuildContext context) {
    return  Text(myText,style:  TextStyle(
        color:color?? Colors.white,
      fontSize: 19,
      fontWeight: FontWeight.w700
    ),);
  }
}
