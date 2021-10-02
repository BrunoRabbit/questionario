import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;
  final void Function() fn;
  Resposta(
    this.resposta,
    this.fn,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
        child: Text(resposta),
        onPressed: fn,
      ),
    );
  }
}
