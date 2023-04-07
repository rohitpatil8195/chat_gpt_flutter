
class MessageModel{
  final String message;
  final int chatIndex;
  MessageModel({required this.message,required this.chatIndex});

  factory MessageModel.fromJson(Map<String,dynamic> json)=>MessageModel(
    message: json['message'], chatIndex:json['chatIndex'] ,
  );

  static List<MessageModel> modelsFromSnapshot(List modelsSnapShot){
    return modelsSnapShot.map((data) => MessageModel.fromJson(data)).toList();
  }

}