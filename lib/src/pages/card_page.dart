import 'package:flutter/material.dart';


class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards'),),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1(){

    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text('Esta es la descripción de la tarjeta del tipo 1 hkjghgbfjkngb'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );

  }

  Widget _cardTipo2(){

    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://onbeing.org/wp-content/uploads/2017/08/2017-John-ODonohue-lead-1.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(microseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          //Image(
          //  image: NetworkImage('https://onbeing.org/wp-content/uploads/2017/08/2017-John-ODonohue-lead-1.jpg'),
          //),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Texto de la imagen')
          ),
        ],
      ),
    );

  }

}