import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:api_flutter/constants/constants.dart';
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
    //   jsonResponse['data'].map((v)=>  print(v));
    // // models.add(jsonResponse['data'].toString());
    //  print(jsonResponse);
     List temp=[];
     // dynamic val= jsonResponse['data'].map((v)=>v['id']);
     // temp.add(val);
       for(var i in jsonResponse['data']){
         temp.add(i);
       }
     // print(temp);
      return ModelsModel.modelsFromSnapshot(temp);
    }catch(e){
      print('Error:$e');
    }
    return null;
  }
}