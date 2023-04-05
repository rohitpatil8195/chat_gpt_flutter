
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String myText;

  const TextWidget({super.key, required this.myText});

  @override
  Widget build(BuildContext context) {
    return  Text(myText,style: const TextStyle(
        color: Colors.white,
      fontSize: 19,
      fontWeight: FontWeight.w700
    ),);
  }
}
