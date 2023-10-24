import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double temperature = 0.0;
  double humidity = 0.0;
  double noiseDb = 0.0;
  bool doorOpen = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha casa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.update), // Ícone do botão
            onPressed: () {
              requestValueFromInternet();
            },
          ),
          title: const Text('Dashboard'),
        ),
        body: BedroomScreen(
          temperature: temperature,
          humidity: humidity,
          doorOpen: doorOpen,
          noiseDb: noiseDb,
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }

  Future<void> requestValueFromInternet() async {
    const location = "Jaragua do Sul";
    const apiKey = '2edb2aabf2fd424aa19182701232410';
    final url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$location&aqi=no');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final umid = data['current']['humidity'];
      final temp = data['current']['temp_c'];
      setState(() {
        temperature = temp.toDouble();
        humidity = umid.toDouble();
      });
      print('Temperatura nova');
      print(temperature);
    } else {
      print('Deu ruim');
      throw Exception('Failed to load temperature');
    }
  }
}

final backgroundColor = Colors.grey[200];

class BedroomScreen extends StatelessWidget {
  const BedroomScreen(
      {Key? key,
      required this.temperature,
      required this.humidity,
      required this.doorOpen,
      required this.noiseDb})
      : super(key: key);

  final double temperature;
  final double humidity;
  final double noiseDb;
  final bool doorOpen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Espaço 1
        Container(
          height: 100, // Altura do primeiro bloco de espaço
          color: backgroundColor, // Cor do bloco de espaço
          child: Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.sunny),
                    title: const Text(
                      'Temperatura',
                      style: TextStyle(
                        fontSize: 24, // Adjust the font size as needed
                      ),
                    ),
                    subtitle: Text('${temperature.toString()} ºC'),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Espaço 2
        Container(
          height: 100, // Altura do segundo bloco de espaço
          color: backgroundColor, // Cor do bloco de espaço
          child: Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.water),
                    title: const Text(
                      'Umidade',
                      style: TextStyle(
                        fontSize: 24, // Adjust the font size as needed
                      ),
                    ),
                    subtitle: Text('${humidity.toString()}%'),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Espaço 3
        Container(
          height: 100, // Altura do segundo bloco de espaço
          color: backgroundColor, // Cor do bloco de espaço
          child: Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.water),
                    title: const Text(
                      'Estado da Porta',
                      style: TextStyle(
                        fontSize: 24, // Adjust the font size as needed
                      ),
                    ),
                    subtitle: Text(getDoorStatus(doorOpen)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 100, // Altura do terceiro bloco de espaço
          color: backgroundColor, // Cor do bloco de espaço
          child: Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.noise_aware),
                    title: const Text(
                      'Barulho',
                      style: TextStyle(
                        fontSize: 24, // Adjust the font size as needed
                      ),
                    ),
                    subtitle: Text('${noiseDb.toString()} dB'),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 100, // Altura do terceiro bloco de espaço
          color: backgroundColor, // Cor do bloco de espaço
          child: const Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text(
                      'Jaragua do Sul - SC',
                      style: TextStyle(
                        fontSize: 24, // Adjust the font size as needed
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getDoorStatus(bool isDoorOpen) {
    if (isDoorOpen) {
      return "Aberto";
    } else {
      return "Fechado";
    }
  }
}
