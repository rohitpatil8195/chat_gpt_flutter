
import 'package:api_flutter/constants/constants.dart';
import 'package:api_flutter/services/assets_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:api_flutter/widgets/chat_widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _State();
}

class _State extends State<ChatScreen> {
 final bool _isTyping=true;
 late TextEditingController textEditingController;
  @override
  void initState() {
    // TODO: implement initState
    textEditingController=TextEditingController();
    super.initState();
  }
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){},
              icon:
              const Icon(Icons.more_vert_outlined,),)
        ],
        elevation: 2,
        title: const Text('CHAT GPT'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetManager.openAi),
        ),
        centerTitle: true,
      ),
       // body: Center(child:
       // Image.asset(AssetManager.openAi)
       // ),
       body: SafeArea(
         child: Column(
           children: [
              Flexible(
                child: ListView.builder(
                  itemCount: chatMsg.length,
                    itemBuilder: (chat,index){
                      return  ChatWidgets(
                        msg: chatMsg[index]['msg'].toString(),
                        chatIndex: int.parse(chatMsg[index]['chatIndex'].toString()),
                      );
                    }
                ),
              ),
             _isTyping?const SpinKitThreeBounce(
             color: Colors.white,
             size: 20,
               ):const SizedBox.shrink(),
            const SizedBox(height: 15,),
             Material(
               color:cardColor ,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   children:  [
                     Expanded(child: TextField(
                     onSubmitted: (val){
                       // TODO
                     },
                       style: const TextStyle(color: Colors.white),
                       decoration: const InputDecoration.collapsed(hintText: 'How can i help you?',
                       hintStyle: TextStyle(color: Colors.grey)
                       ),
                     ),
                     ),
                     IconButton(
                         onPressed: (){},
                         icon:const Icon(Icons.send,color: Colors.white,
                         )
                     )
                   ],
                 ),
               ),
             )
           ],
         ),
       ),
    );
  }
}
