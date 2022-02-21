import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;

  const Editor({
    required this.controlador,
    required this.rotulo,
    required this.dica,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      //alt + enter = add padding
      padding: const EdgeInsets.all(16.0),
      //margin nas laterais, o "all" faz com que seja pra todos os lados
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          //verificar se o icone for diferente de nulo, se for verdade manda o icone senao manda referencia nula
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
