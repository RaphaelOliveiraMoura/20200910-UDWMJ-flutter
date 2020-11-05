import 'package:flutter/material.dart';
import 'detalhes_imagem.dart';

class Item extends StatelessWidget {
  final String imagem;
  final String titulo;
  final String subtitulo;
  final String descricao;
  Item(this.imagem, this.titulo, this.subtitulo, this.descricao);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.all(8.0),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetalhesImagem(this.titulo, this.subtitulo, this.descricao)),
        );
      },
      child: Image.network(this.imagem),
    );
  }
}
