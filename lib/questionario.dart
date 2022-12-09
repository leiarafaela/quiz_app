import 'package:flutter/material.dart';

import '../resposta.dart';
import '../questao.dart';

class Questionario extends StatelessWidget {
  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(double) responder;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Questao(
          texto: perguntas[perguntaSelecionada]['pergunta'].toString(),
        ),
        ...respostas.map((resp) {
          return Resposta(
            texto: resp['alternativa'].toString(),
            quandoPressionado: () =>
                responder(double.parse(resp['pontuacao'].toString())),
          );
        })
      ],
    );
  }
}
