import 'package:flutter/material.dart';


void main(){
  runApp(myApp());
}

// StatefulWidget não muda de esatdo
class myApp extends StatefulWidget{
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp>{
  final List<Map<String, dynamic>> perguntas= [
    {
      'pergunta': 'Qual é a capital do Brasil?',
      'opcoes': ['São Paulo', 'Brasília', 'Rio de Janeiro'],
      'respostaCorreta': 'Brasília'
    }
  ];
  //inicializar os valores do quiz
   int perguntaAtual= 0; 
   int pontos = 0; 
   String? mensagem;
   bool quizFinalizado = false;

   //função que verifica a reposta
   void verificarResposta(String respostaEscolhida) {
    String respostaCorreta = perguntas[perguntaAtual]['respostaCorreta'];

    setState(() {
      if (respostaEscolhida == respostaCorreta){
        pontos++;
        mensagem = 'Resposta certa +1';
      }
      else{
        mensagem = 'Resposta errada!';
      }
    });
   }

   // esperar 2 segundos e passa para a próxima pergunta
   future.delayed(Duration(seconds: 2), (){
    SetState((){
      mensagem = null;
      if(perguntaAtual < perguntas.length - 1){
        perguntaAtual++;
      }
      else {
        quizFinalizado = true;
      }
    });
   });

   //método pra reiniciar o quiz
   void reiniciarQuiz(){
    setState((){
      perguntaAtual = 0;
      pontos = 0;
      quizFinalizado = false;
      mensagem = null;
    });
   }
  

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme:ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text("Meu app")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20), 
              Text(texto, style:TextStyle(fontSize: 45,color:Colors.blue)),
              SizedBox(height: 20),
              ElevatedButton(onPressed: alterarTexto, 
              child: Text("Aperta-me")
              )
            ],
          )
        ),
      )
      );
  }
}
