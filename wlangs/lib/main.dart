import 'package:flutter/material.dart';
import 'api_service.dart';
import 'word_model.dart';
import 'wordListScreen.dart';
void main() 
{
  runApp(MyApp());
}


class MyApp extends StatelessWidget 

{

  @override 
  Widget build(BuildContext context)
  
  {
    
    return MaterialApp
    (
      
      title: "WLands app",
      home: WordScreen(),

    );

  }

}




