import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {

  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _mail = '';
  String _fecha = '';

  // el TextEditingController nos sirve para crear un controlador que este al pendiente de las propiedades de un input
  // así podemos cambiar las caracteristicas como tamaño o valor del input, en el momento que este corriendo nuestra app
  // para este caso sera para el de fecha
  TextEditingController _inputEditDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs de texto'),),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  _crearInput() {

    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es un nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor) =>setState(() {
        _nombre = valor;          
        }),
    );

  }

  Widget _crearEmail(){

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor) =>setState(() {
        _mail = valor;          
        }),
    );

  }

  Widget _crearPassword(){

    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor) =>setState(() {
        _mail = valor;          
        }),
    );

  }

  Widget _crearFecha( BuildContext context ) {

    return TextField(
      enableInteractiveSelection: false,
      // asignación del controlador
      controller: _inputEditDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        // quita el focus o no deja que haya un focus en el input
        // esto nos sirve para disparar el showDatePicker y no que de seleccionado el input
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);

      },
    );

  }

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      // hasta que fecha del pasado podemos seleccionar
      firstDate: new DateTime(2018),
      // hasta a que fecha a futuro podemos seleccionar
      lastDate: new DateTime(2025)
    );

    // validamos que el showDatePicker se haya seleccionado una fecha
    if ( picked != null ){
      setState(() {
       _fecha = picked.toString();
       // cambiamos el valor del texto del input
       _inputEditDateController.text = _fecha;
      });
    }

  }

  Widget _crearPersona() {

    return ListTile(
      title: Text('Nombre es $_nombre'),
      subtitle: Text('Email es $_mail'),
    );

  }

}
