
import 'package:api_flutter/services/api_services.dart';
import 'package:flutter/material.dart';
import '../modals/models_model.dart';

class ModelsProvider with ChangeNotifier{
  List<ModelsModel> modelsList=[];
 String currentModel='babbage';
  List<ModelsModel> get getModelsList{
    return modelsList;
  }

  String get getCurrentModel{
    return currentModel;
  }

  void setCurrentModel(String newModel){
    currentModel=newModel;
    notifyListeners();
  }

  Future<List<ModelsModel>> getAllModels()async{
   modelsList=(await ApiService.getModels())!;
    return modelsList ;
  }

}