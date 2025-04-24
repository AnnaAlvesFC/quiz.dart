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
      'pergunta': 'Nossa turma de DS é qual da ordem de inicialização do curso?',
      'opcoes': ['Segunda', 'Primeira', 'Terceira'],
      'respostaCorreta': 'Primeira'
    },
    {
      'pergunta': 'Atualmente temos quantos alunos?',
      'opcoes': ['41', '43', '45'],
      'respostaCorreta': '41'
    },
    {
      'pergunta': 'Quem é o professor mais legal e gente boa até agora? ',
      'opcoes': ['Lea', 'Evaldo', 'Paulo'],
      'respostaCorreta': 'Evaldo'
    },
    {
      'pergunta': 'Não somos conhecidos por: ',
      'opcoes': ['Ser bons no vôlei e no futebol', 'Ter as piores notas', 'Ter pessoas inteligentes'],
      'respostaCorreta': 'Ter as piores notas'
    },
    {
      'pergunta': 'Qual é o nome da bebê da nossa tecnica?',
      'opcoes': ['Helena', 'Raquel', 'Alice'],
      'respostaCorreta': 'Helena'
    },
    {
      'pergunta': 'Qual dessas linguagens não aprendemos no curso?',
      'opcoes': ['Dart', 'R', 'MySQL', 'Python'],
      'respostaCorreta': 'R'
    },
    {
      'pergunta': 'Qual professor abaixo não ensina curso técnico em DS?',
      'opcoes': ['Lea', 'Tiago', 'Evaldo', 'Paulo'],
      'respostaCorreta': 'Tiago'
    },
    {
      'pergunta': 'Qual dessa materias não são direcionada para o curso técnico em DS?',
      'opcoes': ['Planejamento de Carreira', 'Sistemas Operacionais', 'Programaçao Web', 'Banco de Dados'],
      'respostaCorreta': 'Sistemas Operacionais'
    },
    {
      'pergunta': 'Quando começa o estágio do DS?',
      'opcoes': ['Agosto', 'Junho', 'Setembro','Novembro'],
      'respostaCorreta': 'Agosto'
    },
    {
      'pergunta': 'Qual desses nomes não está no cardeninho? ',
      'opcoes': ['Evelyn M', 'Luiza E', 'A. Vivian', 'Anna Clara'],
      'respostaCorreta': 'Anna Clara'
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
    Future.delayed(Duration(seconds: 2), (){
    setState((){
      mensagem = null;
      if(perguntaAtual < perguntas.length - 1){
        perguntaAtual++;
      }
      else {
        quizFinalizado = true;
      }
    });
   })
   ;
   }

   // esperar 2 segundos e passa para a próxima pergunta
   

   //método pra reiniciar o quiz
   void reiniciarQuiz(){
    setState((){
      perguntaAtual = 0;
      pontos = 0;
      quizFinalizado = false;
      mensagem = null;
    });
   }
  
  //

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme:ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 141, 204, 240),
        appBar: AppBar(title: Text("Quiz o DS3!!", style: TextStyle(color: Colors.black)), centerTitle: true, backgroundColor: const Color.fromARGB(255, 255, 255, 255),),
        body: Center(
          child: quizFinalizado ?
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Parabéns você finalizou o quiz do DS3!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 29),
              ),
              SizedBox(height: 20),
              Text(
                "Sua pontuação: $pontos/${perguntas.length}"
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed:reiniciarQuiz,
                child: Text("Recomeçar"),
                style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 156, 215, 241),
                      foregroundColor: Colors.black
                    )
                ),
            ],
          ): Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("https://static.vecteezy.com/ti/vetor-gratis/p1/38473746-inicial-carta-ds-logotipo-ou-sd-logotipo-projeto-modelo-vetor.jpg", width: 150,height: 150,),
              SizedBox(height: 20,),
              Text(
                perguntas[perguntaAtual] ['pergunta'],
                textAlign: TextAlign.center
              ), 
              SizedBox(height: 20),
              ...perguntas[perguntaAtual]['opcoes'].map<Widget>((opcao){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical:4.0),
                  child: ElevatedButton(
                    onPressed: mensagem == null ? () => verificarResposta(opcao): null,
                    child: Text(opcao),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 156, 215, 241),
                      foregroundColor: Colors.black
                    )
                   ) 
                  );
              }).toList(),
              SizedBox(height: 20),
              if (mensagem != null)
                Text(mensagem!),
              SizedBox(height: 20),
              Text("Pontuação: $pontos")
            ],
          )
          )
        ),
    );
  }
}
