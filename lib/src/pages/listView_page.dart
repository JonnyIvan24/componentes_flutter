import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {

  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  // es un controlador del scroll de la lista
  // sirve para manejar y configurar el scroll de la lista
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;

  // es cuando se inicializa al state
  @override
  void initState() {
    super.initState();
    _agrtegar10();

    _scrollController.addListener(() {

      // si la pasision actual del scroll es igual al maximo de su longitud (estar en el ultimo pixel)
      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ){
        // agregamos 10 imagenes mas
        _agrtegar10();
      }

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Listas'),),
       body: _crearLista(),
    );
  }

  Widget _crearLista() {

    return ListView.builder(
      // asignamos el controlador a la lista
      controller: _scrollController,
      // indicamos con cuantos elementos tiene la lista
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int index) {

        final imagen = _listaNumeros[index];

        return FadeInImage(
          image: NetworkImage('https://picsum.photos/id/$imagen/500/300'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );

      },
    );

  }

  void _agrtegar10(){

    for(var i = 1; i <=10; i++){
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {
      
    });

  }

}