
import 'package:flutter/material.dart';
import '../constants/constants.dart';

 class ModalIsDropDownWidget extends StatefulWidget {
  const ModalIsDropDownWidget({super.key});

   @override
   State<ModalIsDropDownWidget> createState() => _State();
 }
 
 class _State extends State<ModalIsDropDownWidget> {
   String currentModel="Model1";
   @override
   Widget build(BuildContext context) {
     return  DropdownButton(
       dropdownColor: scaffoldBackgroundColor,
        value: currentModel,
         items: getModelsItem, onChanged:(value){
           setState(() {
             currentModel=value.toString();
           });
     }
     )
     ;
   }
 }
 