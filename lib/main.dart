import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor De Moneda',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey,
        primaryColor: Colors.blue,
      ),
      home: const MyHomePage(title: 'Conversor De Moneda'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double dollarAmount = 0;
  double pesosColombianos = 0;


  void convertToPesosColombianosDollar() {
    setState(() {
      pesosColombianos = dollarAmount * 3600;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Conversor de Moneda',
              style:
              TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            const Text(
              'Dólares a Pesos Colombianos:',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            TextField(
              onChanged: (text) {
                dollarAmount = double.parse(text);
              },
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: convertToPesosColombianosDollar,
              child: Text('Convertir'),
            ),
            SizedBox(height: 20),
            Text(
              'Resultado: $pesosColombianos Pesos Colombianos',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

