import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';

import 'package:componentes/src/pages/alert_page.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Componentes'),
        ),
        body: _lista(),
      ),
    );
  }

  Widget _lista() {

    // print(menuProvider.opciones);

    //menuProvider.cargarData().then((opciones){
    //  print('_lista');
    //  print(opciones);
    //});



    //return ListView(
    //  children: _listaItems(),
    //);

    /*
    FutureBuilder sirve para cargar datos de manera asincrona esperando a un Future de algun provider que tengamos
    en este caso es menuProvider
    */
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {

        return ListView(
          children: _listaItems( snapshot.data, context ),
        );

      },
    );

  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {

    final List<Widget> opciones = [];

    data.forEach( (opt) {

      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon( opt['icon'] ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){
          // se necesita el context para saber en que parte de la aplicación se va añadir la nueva pantalla
          // el route es para poder saber la ruta y que pantalla se va abrir
          //final route = MaterialPageRoute(
          //  builder: (context) => AlertPage()
          //);
          //Navigator.push(context, route);

          Navigator.pushNamed(context, opt['ruta']);

        },
      );

      opciones..add(widgetTemp)
              ..add(Divider());

    });

    return opciones;

  }

}
