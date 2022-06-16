import 'package:flutter/material.dart';
import 'package:openuzbekistan/screens/authentication/view/main_sign.dart';
import 'package:openuzbekistan/screens/authentication/view/profile_page.dart';
import 'package:openuzbekistan/screens/authentication/view/sign_in.dart';
import 'package:openuzbekistan/screens/authentication/view/sign_up.dart';
import 'package:openuzbekistan/screens/home/view/details_view.dart';
import 'package:openuzbekistan/screens/home/view/home_view.dart';

class MyRoute {
  static final MyRoute _instance = MyRoute._init();
  static MyRoute get instance => _instance;
  MyRoute._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/homeview':
        return _pages(HomeView());
      case '/mainsign':
        return _pages(MainSign());
      case '/signup':
        return _pages(SignUpPage());
      case '/signin':
        return _pages(SignInPage());
              case '/profile':
        return _pages(ProfilePage());
      case '/detailsview':
        return _pages(DetailsView(data: args as Map<String, dynamic>));
    }
  }

  _pages(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}
