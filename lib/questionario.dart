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
  final void Function() responder;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: [
        Questao(
          texto: perguntas[perguntaSelecionada]['texto'].toString(),
        ),
        ...respostas
            .map((t) => Resposta(texto: t, quandoPressionado: responder))
            .toList(),
      ],
    );
  }
}
