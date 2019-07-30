import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      // configuración de idiomas para la app
       localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // idiomas soportados en la app
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('es', 'MX'), // español mexico
      ],
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