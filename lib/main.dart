import 'package:flutter/material.dart';

import 'package:componentes/src/routes/routes.dart';

//import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/pages/avatar_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes',
      debugShowCheckedModeBanner: false,
      //home: HomePageTemp()
      //home: HomePage()
      initialRoute: '/',
      routes: getAplicationRoutes(),
      onGenerateRoute: ( settings ){

        print('ruta llamada: ${settings.name}');

        return MaterialPageRoute(
          builder: (context) => AvatarPage()
        );

      },
    );
  }
}