import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transferencia.dart';

const tituloAppBar = ('Criando Transferência');

const rotuloCampoValor = ('Valor');
const dicaCampoValor = '0.00';

const rotuloCampoNumeroConta = 'Número da Conta';
const dicaCampoNumeroConta = '0000';

const textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState(); //aqui vai precisar retornar formulariotransferenciastate
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //consome interface
    return Scaffold(
        //scaffold é uma classe do flutter que tem varios widgets
        appBar: AppBar(
          title: Text(tituloAppBar),
        ),
        body: SingleChildScrollView(
          //outro widget que vai dar comportamento de scroll
          child: Column(
            children: <Widget>[
              Editor(
                controlador: controladorCampoNumeroConta,
                dica: dicaCampoNumeroConta,
                rotulo: rotuloCampoNumeroConta,
              ),
              Editor(
                  controlador: controladorCampoValor,
                  rotulo: rotuloCampoValor,
                  dica: rotuloCampoValor,
                  icone: Icons.monetization_on),
              ElevatedButton(
                //botao na tela
                child: Text(textoBotaoConfirmar),
                onPressed: () => criaTransferencia(context),
              ),
            ],
          ),
        ));
  }

  void criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(
        controladorCampoNumeroConta.text); //tentar converter para int
    final double? valor = double.tryParse(
        controladorCampoValor.text); //tentar converter para double
    if (numeroConta != null && valor != null) {
      //verificacao se for nulo fará a transferencia
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada); //vai notificar nossa lista
    }
  }
}
