import 'package:flutter/material.dart';

import 'package:componentes/src/pages/Home_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:componentes/src/pages/listView_page.dart';


Map<String, WidgetBuilder> getAplicationRoutes(){

  return <String, WidgetBuilder>{
    '/'     : (BuildContext context) => HomePage(),
    'alert' : (BuildContext context) => AlertPage(),
    // otra manera de configurar una ruta
    AvatarPage.pageName  : (BuildContext context) => AvatarPage(),
    'card'  : (BuildContext context) => CardPage(),
    'animatedContainer'   : (BuildContext context) => AnimatedContainerPage(),
    'inputs' : (BuildContext context) => InputPage(),
    'slider' : (BuildContext context) => SliderPage(),
    'list' : (BuildContext context) => ListPage(),
  };

}