import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Fichas de Alunos'),
      ),
      body: FichasScreen(),
    ),
  ));
}

class FichasScreen extends StatelessWidget {
  final List<Aluno> alunos = [
    Aluno(
      imagem:
          'https://png.pngtree.com/png-clipart/20190115/ourmid/pngtree-hand-drawn-cartoon-moe-meatball-head-little-girl-png-image_349422.jpg',
      nome: 'Alice Oliveira',
      matricula: gerarMatricula(),
      escola: 'CEFET',
      periodo: '2023 - 1º semestre',
    ),
    Aluno(
      imagem:
          'https://png.pngtree.com/png-vector/20190114/ourmid/pngtree-elephant-elephant-cartoon-elephant-cartoon-animals-png-image_330254.jpg',
      nome: 'Pedro Souza',
      matricula: gerarMatricula(),
      escola: 'Roberto Carneiro',
      periodo: '2023 - 2º semestre',
    ),
    Aluno(
      imagem:
          'https://png.pngtree.com/png-clipart/20230702/ourmid/pngtree-drak-gray-cat-with-duck-rubber-ring-png-image_7399983.png',
      nome: 'Laura Costa',
      matricula: gerarMatricula(),
      escola: 'Integral',
      periodo: '2023 - 1º semestre',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: alunos.length,
      itemBuilder: (context, index) {
        return FichaWidget(aluno: alunos[index]);
      },
    );
  }
}

class FichaWidget extends StatelessWidget {
  final Aluno aluno;

  FichaWidget({required this.aluno});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Image.network(
            aluno.imagem,
            width: 100,
            height: 100,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nome: ${aluno.nome}'),
              Text('Matrícula: ${aluno.matricula.toString()}'),
              Text('Escola: ${aluno.escola}'),
              Text('Período: ${aluno.periodo}'),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Detalhes do Aluno'),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Nome: ${aluno.nome}'),
                            Text('Matrícula: ${aluno.matricula.toString()}'),
                            Text('Escola: ${aluno.escola}'),
                            Text('Período: ${aluno.periodo}'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Fechar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Ver detalhes'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Aluno {
  final String imagem;
  final String nome;
  final int matricula;
  final String escola;
  final String periodo;

  Aluno({
    required this.imagem,
    required this.nome,
    required this.matricula,
    required this.escola,
    required this.periodo,
  });
}

// Função para gerar um número aleatório de matrícula
int gerarMatricula() {
  final random = Random();
  return random.nextInt(900000) + 100000;
}