import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:openuzbekistan/config/init/navigation/navigator.dart';
import 'package:openuzbekistan/config/routes/page_routes.dart';
import 'package:openuzbekistan/config/themes/main_theme.dart';
import 'package:openuzbekistan/screens/home/cubit/home_cubit.dart';
import 'package:openuzbekistan/services/getstorage_service.dart';
import 'package:openuzbekistan/services/jwt_service.dart';

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
      initialRoute: '/signup',
      // initialRoute: GetStorageService.instance.box.read("token") != null && JwtDecoder.isExpired(GetStorageService.instance.box.read("token")) != true ? '/homeview': '/signup',
      onGenerateRoute: MyRoute.instance.onGenerateRoute,
    );
  }
}
