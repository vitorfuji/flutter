import 'package:flutter/material.dart';

import '../../models/transferencia.dart';
import 'formulario.dart';

const tituloAppBar = 'Transferencias';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> transferencias = [];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    //esse build vai sempre atualizar o conteudo
    return Scaffold(
      appBar: AppBar(
        title: Text(tituloAppBar),
      ),
      //scaffold nao usa o Child como padrao, mas sim o body
      body: ListView.builder(
        //funcao capaz de manter solucao em lista de uma maneira dinamica, armazenando todos os itens
        itemCount: widget.transferencias.length, //quantidade de itens
        itemBuilder: (context, indice) {
          //funcao de callback
          final transferencia = widget.transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            //push empurra pra tela route rota que vai ser direcionada a navegacao
            //MaterialPageRoute argumentos pra navegar na tela que queremos
            return FormularioTransferencia(); //vai pra esse widget, acessar o formulario
          })).then(
            (transferenciaRecebida) => atualiza(transferenciaRecebida),
          );
        },
      ),
    );
  }

  void atualiza(transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        //callback que colocamos tudo que queremos executar, vai refletir visualmente, e depois vai chamar o build novamente
        widget.transferencias.add(transferenciaRecebida);
      });
    }
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
