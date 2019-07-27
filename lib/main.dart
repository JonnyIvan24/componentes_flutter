import 'package:flutter/material.dart';

//import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/pages/Home_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
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
      routes: <String, WidgetBuilder>{
        '/'     : (BuildContext context) => HomePage(),
        'alert' : (BuildContext context) => AlertPage(),
        'avatar': (BuildContext context) => AvatarPage(),
      },
    );
  }
}