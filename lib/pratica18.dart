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

class RotaGenerica extends StatelessWidget {
  final String titulo;
  final Color cor;
  RotaGenerica(this.titulo, this.cor);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.titulo}'),
      ),
      body: Container(
        color: this.cor,
        child: Center(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(70),
                  child: Text(
                    '${this.titulo}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 30),
                  )),
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

class PrimeiraRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Rota'),
      ),
      drawer: Container(
        color: Colors.amber,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              accountName: Text("Ana"),
              accountEmail: Text("ana@ana.com.br"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.video_call),
              title: Text("Rota 02"),
              subtitle: Text("Siga para a Rota 02."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RotaGenerica("Segunda rota", Colors.black)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.archive),
              title: Text("Rota 03"),
              subtitle: Text("Siga para a Rota 03"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RotaGenerica("Terceira rota", Colors.purple[900])),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Voltar"),
              subtitle: Text("Voltar para a tela principal"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('Voltar para a Rota 01.');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: const Text('Corpo'),
      ),
    );
  }
}