import 'package:flutter/material.dart';
import 'package:openuzbekistan/config/init/navigation/navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Uzbekistan',
      theme: ThemeData(
      ),
      navigatorKey: NavigationService.instance.navigatorKey,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
