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
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: quandoPressionado,
        child: Text(texto),
      ),
    );
  }
}
