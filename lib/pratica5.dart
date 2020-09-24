import 'package:flutter/material.dart';

void main() {
  runApp(Column(
    children: <Widget>[
      Expanded(
        child: FittedBox(
          fit: BoxFit.contain, // Permite aumentar o tamanho do logo.
          child: const FlutterLogo(),
        ),
      ),
      Expanded(
        child: FittedBox(
          fit: BoxFit.contain, // Permite aumentar o tamanho do logo.
          child: Image.network('https://picsum.photos/250?image=9'),
        ),
      ),
      Expanded(
        child: Text(
          'Google Flutter.',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    ],
  ));
}
