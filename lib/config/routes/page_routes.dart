import 'package:flutter/material.dart';

class MyRoute {
  static final MyRoute _instance = MyRoute._init();
  static MyRoute get instance => _instance;
  MyRoute._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/homeview':
        return _pages();
    }
  }

  _pages(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}
