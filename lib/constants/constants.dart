import 'package:api_flutter/widgets/text_widget.dart';
import 'package:flutter/material.dart';

Color scaffoldBackgroundColor= const Color(0xFF343541);
Color cardColor=const Color(0xFF444654);
// List<String> models=[
//   'Model1',
//   'Model2',
//   'Model3',
//   'Model4',
//   'Model5',
//   'Model6',
//   'Model7',
// ];
//   List<DropdownMenuItem<String>>? get getModelsItem{
//     List<DropdownMenuItem<String>> modelsItem=List<DropdownMenuItem<String>>.generate(models.length,
//           (index) =>
//               DropdownMenuItem(value: models[index],
//                   child:TextWidget(myText: models[index],)),);
//     return modelsItem;
//   }

final chatMsg=[
  {
    "msg":"hello there",
     "chatIndex":0
  },
  {
    "msg":"hello abc",
    "chatIndex":1
  },
  {
    "msg":"hi there",
    "chatIndex":0
  },
  {
    "msg":"im good",
    "chatIndex":1
  },
  {
    "msg":"what about you",
    "chatIndex":0
  },
];