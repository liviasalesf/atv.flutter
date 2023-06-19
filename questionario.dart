import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget{

  final List<Map<String, Object>> perguntas;
  final int perguntaAtual;
  final void Function() responder;

  Questionario({
    required this.perguntas,
    required this.perguntaAtual,
    required this.responder
  });
  bool get temPergunta{
    return perguntaAtual < perguntas.length;
  }

  Widget build(BuildContext context){
    List<Widget> respostas =[];

    if(temPergunta){
      for (var resposta in perguntas[perguntaAtual].cast()["respostas"]){
        respostas.add(
          Resposta(resposta, responder)
        );
      }
    }
    return Column(children: <Widget>[
      temPergunta
      ? Questao(perguntas[perguntaAtual]["texto"].toString())
      : Questao("Terminou"),

      temPergunta ? Column(
        children: [
          ...respostas,
        ],
      ) : Text("Resultado")
    ],);
  }
}