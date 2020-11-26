import 'package:flutter/material.dart';

main() => runApp(
      MaterialApp(
        home: PrimeiraRota(),
        debugShowCheckedModeBanner: false,
      ),
    );

class ProdutoMenu {
  String nome;
  String url;
  ProdutoMenu({this.url, this.nome});
  static List<ProdutoMenu> menu() {
    return [
      ProdutoMenu(
        nome: 'Notebook',
        url: 'https://picsum.photos/250?image=9',
      ),
      ProdutoMenu(
        url: 'https://picsum.photos/250?image=9',
        nome: 'Bolo',
      ),
      ProdutoMenu(
        url: 'https://picsum.photos/250?image=9',
        nome: 'Torre e aerogerador',
      ),
    ];
  }
}

class Produto {
  String url, nome, descricao;
  double preco;

  Produto({
    this.url,
    this.nome,
    this.descricao,
    this.preco,
  });
}

class PrimeiraRota extends StatefulWidget {
  @override
  PrimeiraRotaState createState() => PrimeiraRotaState();
}

class PrimeiraRotaState extends State<PrimeiraRota> {
  ProdutoMenu produtoMenu;
  final List<Produto> produtos = <Produto>[];
  void adicionarProdutoNaLista(Produto produto) {
    setState(
      () {
        produtos.insert(0, produto);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
      ),
      body: new ListView.builder(
        reverse: true,
        shrinkWrap: true,
        padding: EdgeInsets.all(8),
        itemCount: produtos.length,
        itemBuilder: (BuildContext context, int indice) {
          return Column(
            children: [
              Container(
                height: 80,
                margin: EdgeInsets.all(2),
                color: (indice % 2) == 0 ? Colors.blue[50] : Colors.grey[200],
                child: ListTile(
                  leading: Image(
                      image: NetworkImage('https://picsum.photos/250?image=9')),
                  title: Text(
                    '${produtos[indice].nome}',
                  ),
                  subtitle: Text(
                    'R\$ ${produtos[indice].preco.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.purple[900],
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TerceiraRota(
                              nome: this.produtos[indice].nome,
                              descricao: produtos[indice].descricao,
                              url: 'https://picsum.photos/250?image=9',
                              preco: produtos[indice].preco)),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SegundaRota()),
          ).then((novoProduto) {
            adicionarProdutoNaLista(novoProduto);
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple[900],
      ),
    );
  }
}

List<DropdownMenuItem<ProdutoMenu>> montarListaProdutosMenu(List menu) {
  List<DropdownMenuItem<ProdutoMenu>> listaProdutosMenu = List();

  for (ProdutoMenu produtoMenu in menu) {
    listaProdutosMenu.add(
      DropdownMenuItem(
        value: produtoMenu,
        child: Text(produtoMenu.nome),
      ),
    );
  }
  return listaProdutosMenu;
}

class SegundaRota extends StatefulWidget {
  SegundaRotaState createState() {
    return SegundaRotaState();
  }
}

class SegundaRotaState extends State<SegundaRota> {
  ProdutoMenu produtoSelecionado;
  List<DropdownMenuItem<ProdutoMenu>> listaProdutosMenu;

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  @override
  void initState() {
    listaProdutosMenu = montarListaProdutosMenu(ProdutoMenu.menu());
    produtoSelecionado = listaProdutosMenu[0].value;
    super.initState();
  }

  aoSelecionarProduto(ProdutoMenu produtoSelecionado) {
    setState(
      () {
        this.produtoSelecionado = produtoSelecionado;
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Produto'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: DropdownButton(
              value: this.produtoSelecionado,
              items: this.listaProdutosMenu,
              onChanged: this.aoSelecionarProduto,
              icon: Icon(Icons.arrow_downward),
              isExpanded: true,
              iconSize: 24,
              elevation: 16,
              style: TextStyle(fontSize: 16, color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: nomeController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => precoController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'nome',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: descricaoController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => precoController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'descrição',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: precoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => precoController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'preço',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(130, 30, 130, 100),
            child: RaisedButton(
              child: Icon(Icons.add),
              onPressed: () {
                Produto produto = Produto(
                  nome: this.produtoSelecionado.nome,
                  descricao: this.descricaoController.text,
                  preco: double.tryParse(precoController.text),
                );
                Navigator.pop(context, produto);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TerceiraRota extends StatelessWidget {
  final String nome;
  final String descricao;
  final double preco;
  final String url;

  TerceiraRota({this.nome, this.descricao, this.preco, this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(' Produto'),
        ),
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                '${this.nome}',
                style: TextStyle(color: Colors.deepPurple, fontSize: 25),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(4),
                child: Image(
                    image: NetworkImage('${this.url}'),
                    height: 200,
                    width: 200)),
            Padding(
                padding: EdgeInsets.all(4), child: Text('${this.descricao}')),
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'R\$ ${this.preco.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Voltar para a Primeira Rota'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        )));
  }
}
