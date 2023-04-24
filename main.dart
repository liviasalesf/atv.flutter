import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){
  runApp(ComponenteInicial());
}

class ComponenteInicial extends StatefulWidget{

  @override

  State<ComponenteInicial> createState() => _ComponenteInicialState();
}

class _ComponenteInicialState extends State<ComponenteInicial>{
   var contador= 0;

   final perguntas= [
    "cor favo?",
    "hob favo?",
    "animal favo?",
    "comida favo?"
    ];
   
  void eventoBotao(){
    setState((){
      contador: contador++ ;
    });
    print(contador);

  }
Widget build(BuildContext context){
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Perguntas e respostas"),
      ),
      body: Column(
        children: [
          Text(perguntas[contador]),
          ElevatedButton(
            onPressed: eventoBotao,
           child: Text("Enviar")
           ),
           ElevatedButton(
            onPressed: (){
              print ("outra função");
            },
           child: Text("Cancelar")),
            ElevatedButton(
              onPressed: () => print ("função arrow"),
           child: Text("Salvar")),
           Column(
            children: [
              Text("Aprendendo"),
              Text("Programação"),
              Text("Flutter"),
            ],
           )
        ],
       )
       
    )
  );
}


}