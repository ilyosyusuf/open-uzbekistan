import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openuzbekistan/screens/home/state/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeComplete());

  static List<String> categories = ["mountains"];

  Future getData() async {
    try {
      Response res = await Dio()
          .get("http://192.168.83.2:1337/api/${categories[0]}?populate=*");
      if (res.statusCode == HttpStatus.ok) {
        print(res.data['data'][0]['attributes']['picture']['data'][0]['attributes']['url']);
      } else {
        print("Serveerda xato bor");
      }
    } catch (e) {
      print(e);
    }
  }
}
