import 'package:flutter/material.dart';

/*atalhos:

- https://docs.flutter.dev/
- hot reload = recarrega imediatamente as alteracoes, aumenta nivel de velocidade do desenvolvimento
- ctrl + \ = hot reload
- ctrl + d = copia e cola embaixo o mesmo conteudo da linha ou selecionado
- ctrl + alt + L = arrumar codigo
- Shift + F6 = renomear esse campo em todos os lugares que estao utilizando ele
- Shift + F10 = rodar codigo
- Ctrl + espaco = sugestao
- Ctrl + alt + M ou Refactor->Extract->Method= extrai um metado
- Ctrl + N = Navegar
- alt + ins = gera construtor
- stl + enter = cria uma estrutura stateless
- stf + enter = cria uma estrutura stateful
- alt + enter = ira envolver com algo o widget

 */

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Widget que envolve varios widgets que sao necessarios para os apps de material design
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //scaffold é uma classe do flutter que tem varios widgets
        appBar: AppBar(
          title: Text('Criando Transferência'),
        ),
        body: Column(
          children: <Widget>[
            Editor(
              controlador: controladorCampoNumeroConta,
              dica: '0000',
              rotulo: 'Número da Conta',
            ),
            Editor(
                controlador: controladorCampoValor,
                rotulo: ('Valor'),
                dica: ('0.00'),
                icone: Icons.monetization_on),
            ElevatedButton(
              //botao na tela
              child: Text('Confirmar'),
              onPressed: () => criaTransferencia(context),
            )
          ],
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
      debugPrint('Criando transferencia');
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada); //vai notificar nossa lista
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;

  const Editor(
      {Key? key,
      required this.controlador,
      required this.rotulo,
      required this.dica,
      this.icone})
      : super(key: key);

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

class ListaTransferencias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferencias'),
        backgroundColor: Colors.green,
      ),
      //scaffold nao usa o Child como padrao, mas sim o body
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 9398)),
          ItemTransferencia(Transferencia(200.0, 9398)),
          ItemTransferencia(Transferencia(300.0, 9398)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            //push empurra pra tela route rota que vai ser direcionada a navegacao
            //MaterialPageRoute argumentos pra navegar na tela que queremos
            return FormularioTransferencia(); //vai pra esse widget, acessar o formulario
          }));
          future.then((transferenciaRecebida) {
            //future atento as notificacoes que vier do navigator, e quando receber vai pro THEN e diz que recebeu, e ai faz o que quisermos
            debugPrint('chegou no then do future');
            debugPrint('$transferenciaRecebida');
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  ItemTransferencia(
      this.transferencia); //indica no construtor que vamos receber uma transferencia diretamente pro atributo que criamos

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(transferencia.valor.toString()),
      subtitle: Text(transferencia.numeroConta.toString()),
    ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  } //no construtor esses dados serao exigidos pro usuario

}
