import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'questionario.dart';
import 'resultado.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0.0;
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

  void _responder(double pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarApp() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('QuizApp'),
        ),
        titleTextStyle: TextStyle(
          fontFamily: GoogleFonts.acme().fontFamily,
          fontSize: 25,
          color: Colors.white,
        ),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              responder: _responder)
          : Resultado(
              pontuacao: _pontuacaoTotal,
              reiniciarApp: _reiniciarApp,
            ),
    );
  }
}
