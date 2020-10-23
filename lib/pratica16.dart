import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: PrimeiraRota(),
      ),
    );

class Preco {
  double precoEtanol;
  double precoGasolina;
  Preco(this.precoEtanol, this.precoGasolina);

  razao() => precoEtanol / precoGasolina;
  resultado() => '${precoEtanol.toStringAsFixed(2)} / ${precoGasolina.toStringAsFixed(2)} = ${razao().toStringAsFixed(2)}';
  melhorCombustivel() => razao() < 0.7 ? 'Abasteça com Etanol !' :  'Abasteça com Gasolina !';
}

class PrimeiraRota extends StatefulWidget {
  PrimeiraRotaState createState() {
    return PrimeiraRotaState();
  }
}

class PrimeiraRotaState extends State<PrimeiraRota> {
  final TextEditingController precoEtanol = TextEditingController();
  final TextEditingController precoGasolina = TextEditingController();
  
  Preco preco;
  String resultado = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeira Rota"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: precoEtanol,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => precoEtanol.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o preço do etanol',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: precoGasolina,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => precoGasolina.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o preço da gasolina',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              preco = Preco(double.tryParse(precoEtanol.text), double.tryParse(precoGasolina.text));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SegundaRota(preco))).then((resposta) {
                  setState(() {
                    resultado = resposta;
                  });
                });
            },
            child: Text('Ir para a Segunda Rota'),
          ),
           Text(
              '${resultado}',
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
                fontWeight: FontWeight.bold
              ),
            ),
        ],
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  final Preco preco;
  SegundaRota(this.preco);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Rota'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${preco.razao()}',
              style: TextStyle(
                fontSize: 40,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${preco.melhorCombustivel()}',
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
                fontWeight: FontWeight.bold
              ),
            ),
            ElevatedButton(
              child: Text('Ir para a Primeira Rota'),
              onPressed: () {
                Navigator.pop(context, preco.melhorCombustivel());
              },
            ),
          ],
        ),
      ),
    );
  }
}
