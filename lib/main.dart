import 'package:api_flutter/provider/models_provider.dart';
import 'package:api_flutter/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (_)=>ModelsProvider())
      ],
      child: MaterialApp(
        title: 'Flutter consume api',
        theme: ThemeData(
           scaffoldBackgroundColor:scaffoldBackgroundColor ,
            appBarTheme:  AppBarTheme(
              color: cardColor,
            )
        ),
        home: const ChatScreen(),
      ),
    );
  }
}


