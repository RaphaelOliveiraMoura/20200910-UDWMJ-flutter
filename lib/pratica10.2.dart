import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController num01Controller = TextEditingController();
  TextEditingController num02Controller = TextEditingController();
  String resp = "";
  calcular() {
    double peso = double.tryParse(this.num01Controller.text);
    double altura = double.tryParse(this.num02Controller.text);
    altura = altura * altura;
    double imc = peso / altura;

    if (imc < 16) {
      this.resp = '$imc Magreza grave';
    }
    if (imc >= 16 && imc < 17) {
      this.resp = '$imc Magreza moderada';
    }
    if (imc >= 17 && imc < 18.5) {
      this.resp = '$imc Magreza leve';
    }
    if (imc >= 18.5 && imc < 25) {
      this.resp = '$imc Saudavel';
    }
    if (imc >= 25 && imc < 30) {
      this.resp = '$imc Sobrepeso';
    }
    if (imc >= 30 && imc < 35) {
      this.resp = '$imc Obesidade 1';
    }
    if (imc >= 35 && imc < 40) {
      this.resp = '$imc Obesidade 2(Severa)';
    }
    if (imc > 40) {
      this.resp = '$imc Obesidade 3(Morbida)';
    }
    return this.resp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: num01Controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => num01Controller.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o seu peso',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: num02Controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => num01Controller.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe a sua altura',
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              print(calcular());
              setState(calcular);
            },
            child: Text(
              'Calcular',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Text(
            this.resp,
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
