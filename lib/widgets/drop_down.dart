
import 'package:api_flutter/services/api_services.dart';
import 'package:api_flutter/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

 class ModalIsDropDownWidget extends StatefulWidget {
  const ModalIsDropDownWidget({super.key});

   @override
   State<ModalIsDropDownWidget> createState() => _State();
 }
 
 class _State extends State<ModalIsDropDownWidget> {
   String currentModel="babbage";
   @override
   Widget build(BuildContext context) {
     return FutureBuilder(
         future: ApiService.getModels(),
       builder:(context,snapshot){
           if(snapshot.hasError){
             return Center(child: TextWidget(myText: snapshot.error.toString(),),);
           }
           return snapshot.data ==null || snapshot.data!.isEmpty ?
           const SizedBox.shrink() :
           FittedBox(
             child: DropdownButton(
                 dropdownColor: scaffoldBackgroundColor,
                 value: currentModel,
                 items: List<DropdownMenuItem<String>>.generate(
                     snapshot.data!.length, (index) =>
                 DropdownMenuItem(
                     value:snapshot.data![index].id,
                     child: TextWidget(myText: snapshot.data![index].id,))
                 ),
                 onChanged:(value){
               setState(() {
                 currentModel=value.toString();
               });
             }
             ),
           );
       } ,
     )
     ;
   }
 }


