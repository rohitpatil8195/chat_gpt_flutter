
 class ModelsModel{
   final String id;
   final int created;
   final String root;

   ModelsModel({required this.id,required this.created,required this.root});
   factory ModelsModel.fromJson(Map<String,dynamic> json)=>ModelsModel(
     id:  json['id'],root:json['root'],created:json['created'],
   );

  static List<ModelsModel> modelsFromSnapshot(List modelsSnapShot){
     return modelsSnapShot.map((data) => ModelsModel.fromJson(data)).toList();
  }
  }