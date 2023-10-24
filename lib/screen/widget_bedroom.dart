import 'package:flutter/material.dart';

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
            color: Colors.red, // Cor do bloco de espaço
            child: const Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.hotel),
                      title: Text(
                        'Temperatura',
                        style: TextStyle(
                          fontSize: 24, // Adjust the font size as needed
                        ),
                      ),
                      subtitle: Text('23ºC'),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Espaço 2
          Container(
            height: 100, // Altura do segundo bloco de espaço
            color: Colors.blue, // Cor do bloco de espaço
            child: const Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.hotel),
                      title: Text(
                        'Umidade',
                        style: TextStyle(
                          fontSize: 24, // Adjust the font size as needed
                        ),
                      ),
                      subtitle: Text('90%'),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Espaço 3
          Container(
            height: 100, // Altura do terceiro bloco de espaço
            color: Colors.green, // Cor do bloco de espaço
            child: const Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.hotel),
                    title: Text(
                      'Porta aberta',
                      style: TextStyle(
                        fontSize: 24, // Adjust the font size as needed
                      ),
                    ),
                    subtitle: Text('Sim'),
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: 100, // Altura do terceiro bloco de espaço
            color: Colors.purple, // Cor do bloco de espaço
            child: const Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.hotel),
                    title: Text(
                      'Barulho',
                      style: TextStyle(
                        fontSize: 24, // Adjust the font size as needed
                      ),
                    ),
                    subtitle: Text('64 dB'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
    );
  }
}
