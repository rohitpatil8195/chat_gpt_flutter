
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
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
    // return AnimatedTextKit(
    //    totalRepeatCount: 1,
    //   animatedTexts:
    // [
    //   TypewriterAnimatedText(
    //   myText,
    //   textStyle:  TextStyle(
    //       color:color?? Colors.white,
    //       fontSize: fontSizeCustom ?? 19,
    //       fontWeight: FontWeight.w700
    //   )
    //   )
    // ],
    // );
  }
}

