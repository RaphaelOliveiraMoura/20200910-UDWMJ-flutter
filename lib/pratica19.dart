import 'package:flutter/material.dart';

void main() {
  runApp(MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeiraRota(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PrimeiraRota extends StatefulWidget {
  @override
  PrimeiraRotaState createState() => PrimeiraRotaState();
}

class PrimeiraRotaState extends State<PrimeiraRota> {
  Transporte transporte = transportes[0];
  void selecionar(Transporte transporteEscolhido) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RotaGenerica(transporteEscolhido)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.video_label),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SegundaRota()),
            );
          },
          tooltip: 'Coleção de Vídeos',
        ),
        title: Text('Primeira Rota'),
        actions: <Widget>[
          IconButton(
            icon: Icon(transportes[0].icone),
            onPressed: () {
              selecionar(transportes[0]);
            },
          ),
          IconButton(
            icon: Icon(transportes[1].icone),
            onPressed: () {
              selecionar(transportes[1]);
            },
          ),
          PopupMenuButton<Transporte>(
            onSelected: selecionar,
            itemBuilder: (BuildContext context) {
              return transportes.skip(2).map(
                (Transporte transporte) {
                  return PopupMenuItem<Transporte>(
                    value: transporte,
                    child: Text(transporte.titulo),
                  );
                },
              ).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Cartao(transporte: this.transporte, cardSize: MainAxisSize.max),
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Rota"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Voltar para a Primeira Rota'),
        ),
      ),
    );
  }
}

class RotaGenerica extends StatelessWidget {
  final Transporte transporte;
  RotaGenerica(this.transporte);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.transporte.titulo}'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Cartao(transporte: this.transporte, cardSize: MainAxisSize.min),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                  ),
                  padding: EdgeInsets.all(35.50),
                  child: Text(
                    'Voltar para a primeira tela',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Transporte {
  final String titulo;
  final IconData icone;
  const Transporte({this.titulo, this.icone});
}

const List<Transporte> transportes = <Transporte>[
  Transporte(titulo: 'Carro', icone: Icons.directions_car),
  Transporte(titulo: 'Bicicleta', icone: Icons.directions_bike),
  Transporte(titulo: 'Barco', icone: Icons.directions_boat),
  Transporte(titulo: 'Ônibus', icone: Icons.directions_bus),
  Transporte(titulo: 'Trem', icone: Icons.directions_railway),
];

class Cartao extends StatelessWidget {
  final Transporte transporte;
  final MainAxisSize cardSize;
  Cartao({this.transporte, this.cardSize});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(100),
        child: Column(
            mainAxisSize: this.cardSize,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                this.transporte.icone,
                size: 128,
                color: Colors.grey[500],
              ),
              Text(
                this.transporte.titulo,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
