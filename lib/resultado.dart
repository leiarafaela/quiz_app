import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  Resultado({
    super.key,
    required this.pontuacao,
    required this.reiniciarApp,
  });

  final double pontuacao;
  final void Function() reiniciarApp;

  String get fraseResultado {
    if (pontuacao == 10.0) {
      return 'Parabéns, sua nota é $pontuacao!';
    } else if (pontuacao < 10.0 && pontuacao > 6) {
      return 'Muito bom! Sua nota é $pontuacao!';
    } else {
      return 'Sua nota é $pontuacao!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: reiniciarApp,
          child: Text('Reiniciar'),
        )
      ],
    );
  }
}
