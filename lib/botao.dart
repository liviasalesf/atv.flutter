
import 'package:flutter/material.dart';

class Botao extends StatelessWidget{

  String texto;

  Botao(this.texto);

  @override
  Widget build(BuildContext context) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.all(30),
     child: ElevatedButton(
      onPressed:() {},
       child: Text(texto),
       style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(50,50)
        )
    ),
   ),
  );
 }
}