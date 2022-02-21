import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

/*atalhos:

- https://docs.flutter.dev/
- material.io
- https://medium.com/flutter-community/flutter-code-organization-de3a4c219149 organizar o codigo
- criar Directory pra separar o codigo, botao direito no lib->new->directory
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
      theme: ThemeData(
        primaryColor: Colors.green[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurple[100],
          textTheme: ButtonTextTheme.primary,
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple[100]),
      ),
      //Widget que envolve varios widgets que sao necessarios para os apps de material design
      home: ListaTransferencias(),

    );
  }
}

