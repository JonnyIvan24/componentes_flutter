import 'dart:async';

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
  //sirve para indicar cuando se estan cargando los datos
  bool _isLoading = false;

  // es cuando se inicializa al state
  @override
  void initState() {
    super.initState();
    _agrtegar10();

    _scrollController.addListener(() {

      // si la pasision actual del scroll es igual al maximo de su longitud (estar en el ultimo pixel)
      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ){
        // agregamos 10 imagenes mas
        //_agrtegar10();
        fetchData();
      }

    });

  }

  // es cuando la pagina deja de existir
  @override
  void dispose() {
    super.dispose();
    // es importante borrar o destruir los listeners o controladores de las listas para evitar llenar la memoria
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Listas'),),
       body: Stack(
         children: <Widget>[
           _crearLista(),
           _crearLoading(),
         ],
       ),
    );
  }

  Widget _crearLista() {

    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
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
      ),
    );

  }

  Future<Null> obtenerPagina1() async {

    final duration = new Duration( seconds: 2 );
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agrtegar10();
    });

    return Future.delayed(duration);

  }

  void _agrtegar10(){

    for(var i = 1; i <=10; i++){
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});

  }

  Future<Null> fetchData() async {

    _isLoading = true;
    setState(() { });
    final duration = new Duration( seconds: 2);
    return new Timer(duration, respuestaHTTP);

  }

  void respuestaHTTP() {

    _isLoading = false;
    // le damos una animacion al momento que se tenga la respuesta HTTP simulada
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 400)
    );
    _agrtegar10();

  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );
    }else {
      return Container();
    }
  }

}