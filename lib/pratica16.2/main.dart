import 'package:flutter/material.dart';
import 'item.dart';

void main() => runApp(
      MaterialApp(
          home: Home(),
          theme: ThemeData(
            primaryColor: Colors.green,
          )),
    );

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álbum"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Item(
                "https://images.pexels.com/photos/213781/pexels-photo-213781.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                "Nova York",
                "EUA",
                "Descrição"),
            Item(
                "https://images.pexels.com/photos/213782/pexels-photo-213782.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                "Nova York2",
                "EUA2",
                "Descrição2"),
            Item(
                "https://images.pexels.com/photos/213783/pexels-photo-213783.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                "Nova York3",
                "EUA3",
                "Descrição3"),
            Item(
                "https://images.pexels.com/photos/213784/pexels-photo-213784.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                "Nova York4",
                "EUA4",
                "Descrição4"),
            Item(
                "https://images.pexels.com/photos/213785/pexels-photo-213785.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                "Nova York5",
                "EUA5",
                "Descrição5"),
            Item(
                "https://images.pexels.com/photos/213786/pexels-photo-213786.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                "Nova York6",
                "EUA6",
                "Descrição6"),
            Item(
                "https://images.pexels.com/photos/213787/pexels-photo-213787.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                "Nova York7",
                "EUA7",
                "Descrição7"),
            Item(
                "https://images.pexels.com/photos/213788/pexels-photo-213788.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                "Nova York8",
                "EUA8",
                "Descrição8"),
            Item(
                "https://images.pexels.com/photos/213789/pexels-photo-213789.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                "Nova York9",
                "EUA9",
                "Descrição9"),
          ],
        ),
      ),
    );
  }
}
