import 'package:flutter/material.dart';

void main() => runApp(MeuAplicativo());

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeiraRota(),
    );
  }
}

class PrimeiraRota extends StatelessWidget {
  TextEditingController temperaturaCelsiusController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Rota'),
      ),
      body: Column(
        children: [
          TextField(
            controller: temperaturaCelsiusController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => temperaturaCelsiusController.clear(),
                icon: Icon(Icons.clear),
              ),
              border: OutlineInputBorder(),
              labelText: 'temperatura em graus Celsius',
            ),
          ),
          RaisedButton(
            child: Text('Ir para a Segunda Rota'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RotaGenerica(double.tryParse(
                        this.temperaturaCelsiusController.text))),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RotaGenerica extends StatelessWidget {
  static const caminhoDaRota = '/rotaGenerica';
  double temperatura;
  RotaGenerica(this.temperatura);
  converter(double celsius) => celsius * 1.8 + 32;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Container(
            child: Text(
              'Graus Celsius: ${this.temperatura.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),
            padding: EdgeInsets.all(70),
            margin: EdgeInsets.all(25),
          ),
          Container(
            child: Text(
              'Graus Fahrenheit: ${this.converter(this.temperatura).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.orange,
              ),
            ),
            padding: EdgeInsets.all(70),
            margin: EdgeInsets.all(25),
          ),
        ]),
      ),
    );
  }
}