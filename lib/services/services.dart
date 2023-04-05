import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widgets/drop_down.dart';
import '../widgets/text_widget.dart';

class Services{
  static Future showModalSheet({required BuildContext context})async{
  await showModalBottomSheet(
        backgroundColor: scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        context: context, builder: (context){
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            TextWidget( myText:'Choose Model:',fontSizeCustom:15),
             const SizedBox(width: 10,),
            const Flexible(child: ModalIsDropDownWidget())
          ],
        ),
      );
    });
  }
}