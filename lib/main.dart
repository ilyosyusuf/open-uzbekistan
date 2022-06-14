import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:openuzbekistan/config/init/navigation/navigator.dart';
import 'package:openuzbekistan/config/routes/page_routes.dart';
import 'package:openuzbekistan/config/themes/main_theme.dart';
import 'package:openuzbekistan/screens/home/cubit/home_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Open Uzbekistan',
      theme: MainTheme.apptheme,
      navigatorKey: NavigationService.instance.navigatorKey,
      initialRoute: '/homeview',
      onGenerateRoute: MyRoute.instance.onGenerateRoute,
    );
  }
}
