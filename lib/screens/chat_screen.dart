
import 'package:api_flutter/constants/constants.dart';
import 'package:api_flutter/modals/message_model.dart';
import 'package:api_flutter/provider/models_provider.dart';
import 'package:api_flutter/services/assets_management.dart';
import 'package:api_flutter/services/services.dart';
import 'package:api_flutter/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:api_flutter/widgets/chat_widgets.dart';
import '../services/api_services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _State();
}

class _State extends State<ChatScreen> {
  bool _isTyping=false;
 late TextEditingController textEditingController;
 late FocusNode focusNode;
 late String question;
  @override
  void initState() {
    // TODO: implement initState
    textEditingController=TextEditingController();
    focusNode=FocusNode();
    super.initState();
  }
   @override
   void dispose(){
    textEditingController.dispose();
    focusNode.dispose();
     super.dispose();
   }
  List<MessageModel> msgList=[];
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()async{
          await Services.showModalSheet(context: context);
          try{
            await ApiService.getModels();
          }catch(e){
            print('Error: $e');
           }
          },
              icon:
              const Icon(Icons.more_vert_outlined,),)
        ],
        elevation: 2,
        title: const Text('Open AI'),
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
                  itemCount: msgList.length,
                    itemBuilder: (chat,index){
                      return  ChatWidgets(
                        msg: msgList[index].message,
                        chatIndex: int.parse(msgList[index].chatIndex.toString()),
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
                       focusNode: focusNode,
                       controller: textEditingController,
                     onChanged: (val){
                       setState(() {
                         question=val;
                       });
                     },
                       style: const TextStyle(color: Colors.white),
                       decoration: const InputDecoration.collapsed(hintText: 'How can i help you?',
                       hintStyle: TextStyle(color: Colors.grey)
                       ),
                     ),
                     ),
                     IconButton(
                         onPressed: ()async{
                          await sendMsgFct(modelsProvider: ModelsProvider());
                         },
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

  Future<void> sendMsgFct({required ModelsProvider modelsProvider})async{
    setState(() {
      _isTyping=true;
    });
    try{
      final lst=  await ApiService.sendMsg(message: question.toString());
      setState(() {
    msgList=lst!;
      });
      print('$msgList lst');
      setState(() {
        _isTyping=false;
        msgList.add(MessageModel(message: textEditingController.text, chatIndex:0 ));
        textEditingController.clear();
        focusNode.unfocus();
      });
     // final lst1=
     // msgList=await ApiService.sendMsg(message:question,indexId:0);
     // final lst2=ApiService.sendMsg(message: question.toString());

      // msgList.addAll((await ApiService.sendMsg(
      //    message: textEditingController.text,
      // ));

    }catch(e){
      print('Error: $e');
      setState(() {
        _isTyping=false;
      });
    }
  }
}
