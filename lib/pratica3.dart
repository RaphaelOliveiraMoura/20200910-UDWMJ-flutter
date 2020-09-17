import 'package:flutter/material.dart';

void main() {
  String nome = "Guilherme";
  String dia = "quinta-feira";
  runApp(
    Center(
      child: RichText(
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Olá, ",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.white,
          ), //TextStyle.

          children: <TextSpan>[
            TextSpan(
              text: '$nome',
              style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                  backgroundColor: Colors.green,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            TextSpan(
              text: '!',
            ),
            TextSpan(
              text: '\nHoje é $dia!',
              style: TextStyle(
                  color: Colors.red,
                  decorationColor: Colors.red,
                  backgroundColor: Colors.yellow),
            ),
            TextSpan(
              text: '\nBom dia!',
            ),
          ],
        ),
      ),
    ),
  );
}
