
import 'package:api_flutter/constants/constants.dart';
import 'package:api_flutter/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:api_flutter/services/assets_management.dart';

class ChatWidgets extends StatelessWidget {

 final String msg;
 final int chatIndex;

  const ChatWidgets({super.key, required this.msg, required this.chatIndex});
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Material(
          color: chatIndex==0?scaffoldBackgroundColor:cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Image.asset(
                chatIndex==0?AssetManager.userImage:AssetManager.chatLogo,
                height: 30,width: 30,),
             const SizedBox(width: 10,),
                Expanded(child:  TextWidget(myText: msg,)),
                chatIndex==0 ?const SizedBox.shrink()
                    :
                    Row(children:const [
                        Icon(Icons.thumb_up_alt_outlined,color: Colors.white,),
                      SizedBox(width: 10,),
                      Icon(Icons.thumb_down_alt_outlined,color: Colors.white,)
                    ],)
              ],),
          ),
        )
      ],
    );
  }
}
