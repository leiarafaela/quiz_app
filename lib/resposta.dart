import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  const Resposta({
    super.key,
    required this.texto,
    required this.quandoPressionado,
  });

  final String texto;
  final void Function() quandoPressionado;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
        ),
        onPressed: quandoPressionado,
        child: Text(
          texto,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
