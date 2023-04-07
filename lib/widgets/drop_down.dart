
import 'package:api_flutter/provider/models_provider.dart';
import 'package:api_flutter/services/api_services.dart';
import 'package:api_flutter/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:provider/provider.dart';

import '../modals/models_model.dart';
 class ModalIsDropDownWidget extends StatefulWidget {
  const ModalIsDropDownWidget({super.key});

   @override
   State<ModalIsDropDownWidget> createState() => _State();
 }
 
 class _State extends State<ModalIsDropDownWidget> {
   String? currentModel;
   @override
   Widget build(BuildContext context) {
     final modelProvider=Provider.of<ModelsProvider>(context,listen: false);
     var currentModel=modelProvider.getCurrentModel;
     return FutureBuilder<List<ModelsModel>>(
         future: modelProvider.getAllModels(),
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
               modelProvider.setCurrentModel(value.toString());
             }
             ),
           );
       } ,
     )
     ;
   }
 }


