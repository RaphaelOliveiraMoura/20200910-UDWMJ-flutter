import 'package:flutter/material.dart';

main() => runApp(
      MaterialApp(
        home: PrimeiraRota(),
        debugShowCheckedModeBanner: false,
      ),
    );

class ProdutoMenu {
  String url, nome;
  ProdutoMenu({this.url, this.nome});
  static List<ProdutoMenu> menu() {
    return [
      ProdutoMenu(
        url: 'https://picsum.photos/250?image=9',
        nome: 'Notebook',
      ),
      ProdutoMenu(
        url: '',
        //'https://images.pexels.com/photos/213780/pexels-photo213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        nome: 'Bolo',
      ),
      ProdutoMenu(
        url: '',
        //'https://images.pexels.com/photos/213798/pexels-photo213798.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        nome: 'Torre e aerogerador',
      ),
    ];
  }
}

class Produto {
  int id;
  String url, nome, descricao;
  double preco;
  Produto({this.id, this.url, this.nome, this.descricao, this.preco});
}

class PrimeiraRota extends StatefulWidget {
  @override
  PrimeiraRotaState createState() => PrimeiraRotaState();
}

class PrimeiraRotaState extends State<PrimeiraRota> {
  final List<Produto> produtos = <Produto>[];

  void adicionarProdutoNaLista(Produto produto) {
    setState(
      () {
        produtos.insert(0, produto);
      },
    );
  }

  void removerProdutoNaLista(int indice) {
    setState(
      () {
        this.produtos.removeAt(indice);
      },
    );
  }

  void editaProdutoNaLista(Produto produto, int indice) {
    this.produtos[indice].nome = produto.nome;
    this.produtos[indice].descricao = produto.descricao;
    this.produtos[indice].preco = produto.preco;
  }

  confirmarExclusao(BuildContext context, int indice) {
    Widget cancelamento = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget confirmacao = FlatButton(
      child: Text("Excluir"),
      onPressed: () {
        this.removerProdutoNaLista(indice);
        Navigator.of(context).pop();
      },
    );
    AlertDialog alerta = AlertDialog(
      title: Row(
        children: [
          Icon(Icons.add_alert),
          Text("Exclusão!"),
        ],
      ),
      content: Text("Deseja realmente excluir o produto?"),
      actions: [
        cancelamento,
        confirmacao,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: new EdgeInsets.only(left: 25, top: 2.5, right: 25),
        itemCount: produtos.length,
        itemBuilder: (BuildContext context, int indice) {
          return Container(
            height: 80,
            margin: EdgeInsets.all(2),
            color: (indice % 2) == 0 ? Colors.blue[50] : Colors.grey[200],
            child: ListTile(
              leading: Image(
                image: NetworkImage(this.produtos[indice].url),
                height: 50,
                width: 70,
              ),
              title: Text('${this.produtos[indice].nome}'),
              subtitle: Text(
                'R\$ ${this.produtos[indice].preco.toStringAsFixed(2)}',
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
                      builder: (context) =>
                          EditaProduto(this.produtos[indice])),
                ).then((editado) {
                  setState(() {
                    editaProdutoNaLista(editado, indice);
                  });
                });
              },
              onLongPress: () {
                this.confirmarExclusao(context, indice);
              },
            ),
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

class EditaProduto extends StatelessWidget {
  Produto produto;
  ProdutoMenu produtoSelecionado;

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController precoController = TextEditingController();

  EditaProduto(Produto produto) {
    this.produto = produto;
    this.nomeController.text = produto.nome;
    this.descricaoController.text = produto.descricao;
    this.precoController.text = '${produto.preco}';
  }

  editar(BuildContext context, int indice) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Produto'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: new EdgeInsets.only(left: 25, right: 25),
        children: [
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
            padding: const EdgeInsets.fromLTRB(100, 50, 100, 50),
            child: RaisedButton(
              child: Icon(Icons.edit),
              onPressed: () {
                this.produto.nome = this.nomeController.text;

                this.produto.descricao = descricaoController.text;

                this.produto.preco = double.tryParse(precoController.text);
                Navigator.pop(context, produto);
              },
            ),
          ),
        ],
      ),
    );
  }
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

  /*O método initState() gera o estado inicial do widget
 quando um objeto da classe for instanciado.*/
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Produto'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: new EdgeInsets.only(left: 25, right: 25),
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
            padding: const EdgeInsets.fromLTRB(100, 50, 100, 50),
            child: RaisedButton(
              child: Icon(Icons.add),
              onPressed: () {
                Produto produto = Produto(
                  url: this.produtoSelecionado.url,
                  nome: this.nomeController.text,
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
