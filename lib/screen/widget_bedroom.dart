import 'package:flutter/material.dart';
import 'package:bedroom_online/screen/widget_temperatura.dart';

final backgroundColor = Colors.grey[200];

class BedroomScreen extends StatelessWidget {
  const BedroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.update), // Ícone do botão direito
            onPressed: () {
              // Adicione a ação desejada aqui
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.add), // Ícone do botão
          onPressed: () {
            //toggleState(); // Chama a função para mudar o estado
          },
        ),
        title: const Text('Dashboard'),
      ),
      body: Column(
        children: [
          // Espaço 1
          Container(
            height: 100, // Altura do primeiro bloco de espaço
            color: Colors.white, // Cor do bloco de espaço
            child: Center(
              child: Text('Espaço 1'),
            ),
          ),

          // Espaço 2
          Container(
            height: 100, // Altura do segundo bloco de espaço
            color: Colors.blue, // Cor do bloco de espaço
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 80,
                    color: Colors.red,
                    // Conteúdo do bloco 1
                  ),
                  SizedBox(width: 20), // Espaçamento entre os blocos
                  Container(
                    width: 100,
                    height: 80,
                    color: Colors.yellow,
                    // Conteúdo do bloco 2
                  ),
                ],
              ),
            ),
          ),

          // Espaço 3
          Container(
            height: 100, // Altura do terceiro bloco de espaço
            color: Colors.green, // Cor do bloco de espaço
            child: Center(
              child: Text('Espaço 3'),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
    );
  }
}
