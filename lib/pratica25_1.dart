import 'package:flutter/material.dart';

void main() => runApp(Aplicativo());

class Aplicativo extends StatelessWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MeuTema().tema(),
      home: Scaffold(
        appBar: AppBar(title: Text("Trabalhando com Temas")),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        body: Center(
          child: Corpo(),
        ),
      ),
    );
  }
}

class MeuTema {
  ThemeData tema() {
    return ThemeData(
      primaryColor: Colors.green[300],
      accentColor: Colors.yellow,
      secondaryHeaderColor: Colors.red,
      fontFamily: 'Georgia',
      buttonColor: Colors.red,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.lime,
        ),
      ),
    );
  }
}

class Corpo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text("Olá!", style: Theme.of(context).textTheme.bodyText1),
        ),
        Container(
          child: RaisedButton(
            child: Text('Ok'),
            onPressed: () {
              print('Clicou no botão!');
            },
          ),
        ),
      ],
    );
  }
}
