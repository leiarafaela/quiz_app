import 'package:flutter/material.dart';

import '../resultado.dart';
import '../questionario.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'pergunta': 'Qual empresa criou o Flutter?',
      'respostas': [
        {'alternativa': 'Microsoft', 'pontuacao': 0},
        {'alternativa': 'Google', 'pontuacao': 2.5},
        {'alternativa': 'AWS', 'pontuacao': 0},
        {'alternativa': 'Apple', 'pontuacao': 0},
      ]
    },
    {
      'pergunta': 'Em que ano o Flutter foi lançado?',
      'respostas': [
        {'alternativa': '2010', 'pontuacao': 0},
        {'alternativa': '2015', 'pontuacao': 0},
        {'alternativa': '2017', 'pontuacao': 2.5},
        {'alternativa': '2019', 'pontuacao': 0},
      ]
    },
    {
      'pergunta': 'Qual linguagem de programação é utilizado com o Flutter?',
      'respostas': [
        {'alternativa': 'JavaScript', 'pontuacao': 0},
        {'alternativa': 'Python', 'pontuacao': 0},
        {'alternativa': 'Dart', 'pontuacao': 2.5},
        {'alternativa': 'C#', 'pontuacao': 0},
      ]
    },
    {
      'pergunta': 'O Flutter é multiplataforma?',
      'respostas': [
        {'alternativa': 'Não, suporta apenas Android', 'pontuacao': 0},
        {'alternativa': 'Não, suporta apenas iOS', 'pontuacao': 0},
        {
          'alternativa': 'Sim, suporta  o Android, iOS entre outros',
          'pontuacao': 2.5
        },
        {'alternativa': 'Não, suporta apenas Web', 'pontuacao': 0},
      ]
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : const Resultado(),
      ),
    );
  }
}
