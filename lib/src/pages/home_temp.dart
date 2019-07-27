import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItems()
      ),
    );
  }

  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

    for (String opt in opciones){

      final tempWidget = ListTile(
        title: Text(opt),
      );

      // al poner .. lo que hace es tomar el objeto anterior para seguir dando instrucciones algo parecido a...
      // lista.add(tempWidget)
      // lista.add(Divider());
      lista..add(tempWidget)
            ..add(Divider());
    }
    
    return lista;
  }

}
