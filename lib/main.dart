import 'package:flutter/material.dart';
import 'contato.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: ListaPage(),
    );
  }
}

class ListaPage extends StatefulWidget {
  ListaPage({Key? key}) : super(key: key);

  @override
  ListaPageState createState() => ListaPageState();
}

class ListaPageState extends State<ListaPage> {
  List<Contato> listaFavoritos = [];
  final List<Contato> contatos = [
    Contato('Alice Calisti de Souza', 'alicecalisti@email.com'),
    Contato('Daniel Souza', 'danielsouza@email.com'),
    Contato('Terezinha Calisti', 'terezinha.calisti@email.com')
  ];

  @override
  Widget build(BuildContext context) {
    int qtdFavoritos = listaFavoritos.length;
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos Favoritos $qtdFavoritos'),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (BuildContext context, int index) {
          final favorito = listaFavoritos.contains(contatos[index]);
          return ListTile(
            title: Text(contatos[index].nomecompleto),
            subtitle: Text(contatos[index].email),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  if (favorito) {
                    listaFavoritos.remove(contatos[index]);
                  } else {
                    listaFavoritos.add(contatos[index]);
                  }
                });
              },
              icon: favorito
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
            ),
          );
        },
      ),
    );
  }
}
