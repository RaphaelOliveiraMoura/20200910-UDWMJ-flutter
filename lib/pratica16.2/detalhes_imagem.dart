import 'package:flutter/material.dart';

class DetalhesImagem extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String descricao;
  DetalhesImagem(this.titulo, this.subtitulo, this.descricao);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: AppBar(
        title: Text(this.titulo),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text(
                "${this.titulo},${this.subtitulo}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 40,
                ),
              ),
              margin: EdgeInsets.all(80),
            ),
            Container(
              child: Text(
                this.descricao,
              ),
              margin: EdgeInsets.all(80),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
