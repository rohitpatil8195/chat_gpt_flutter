import 'dart:convert';
import 'dart:io';
import 'package:api_flutter/modals/message_model.dart';
import 'package:api_flutter/modals/models_model.dart';
import 'package:http/http.dart' as http;
import '../constants/api_consts.dart';


class ApiService{
  static Future<List<ModelsModel>?> getModels()async {
    try{
     var response=await http.get(Uri.parse('$BASE_URL/models'),
      headers: {
         'Authorization':'Bearer $API_KEY',
        "Content-Type": 'application/json'
          }
      );
     Map jsonResponse=jsonDecode(response.body);
     if(jsonResponse['error']!=null){
       print('json Error response: ${jsonResponse['error']['message']}');
       throw HttpException(jsonResponse['error']['message']);
     }
     List temp=[];
       for(var i in jsonResponse['data']){
         // print('<><> $i');
         temp.add(i);
       }

      return ModelsModel.modelsFromSnapshot(temp);
    }catch(e){
      print('Error:$e');
    }
    return null;
  }


  static Future<List<MessageModel>?> sendMsg(
      // { required String message,required String modelId}
          {  String? message,
            int? indexId
        }
      )async {
    final body={
      // "model": "gpt-3.5-turbo",
      // "prompt": 'how can i use chatGPT',
      // 'max_tokens':10
      "enable_google_results": false,
      "enable_memory": false,
      "input_text": message
    };
    try{
      var response=await http.post(Uri.parse(BASE_URL1),
          headers: {
            'X-API-KEY': API_KEY1,
            "Content-Type": 'application/json'
          },
        body:jsonEncode(body)
      );
      print(response.body);
      Map jsonResponse=jsonDecode(response.body);
      if(jsonResponse['detail']!=null){
        print('json Error response: ${jsonResponse['detail']}');
        throw HttpException(jsonResponse['detail']);
      }
      print('jsonResponse=== $jsonResponse');
      List temp=[];
      // for(var i in jsonResponse['message']){
      //   temp.add(jsonResponse['message']);
      // }
      indexId=1;
       Object obj={'message':jsonResponse['message'],'chatIndex':indexId,};

      // temp.add(jsonResponse['message']);
      // temp.add(charIndex);
      temp.add(obj);
       print('$temp TEMP>');
      // MessageModel.fromJson(message:'dsd',charIndex);
      return MessageModel.modelsFromSnapshot(temp);
    //  String Msg=jsonResponse['message'];
     // return MessageModel.modelsFromSnapshot(Msg);
    }catch(e){
      print('Error:$e');
    }
    return null;
  }
}