import 'package:flutter/material.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title:Text("App da Evelanna"),
          ),
          body: Center(
            child: Text("nada por enquanto",
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.amber),),
          )
      ),
    );
  }
}