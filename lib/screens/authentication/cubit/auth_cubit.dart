import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:openuzbekistan/screens/authentication/state/auth_state.dart';
import 'package:openuzbekistan/services/getstorage_service.dart';
import 'package:openuzbekistan/services/jwt_service.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(SignUpState());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future signUp(BuildContext context, String email, String password, String username) async {
    try {
      emit(AuthLoading());
      Response res = await Dio().post(
        'http://192.168.2.193:1337/api/auth/local/register',
        data: {
          "username": username,
          "email": email,
          "password": password
        },
      );
      if (res.statusCode == 200) {
        await GetStorageService.instance.box.write("token", res.data['jwt']);
        await GetStorageService.instance.box
            .write("userID", res.data['user']["id"]);
            debugPrint( GetStorageService.instance.box.read("token").toString());
        // bool isTrue = JwtDecoder.isExpired(res.data["jwt"]);
        JwtService.instance.isExpired =  JwtDecoder.isExpired(res.data["jwt"]);

        debugPrint(JwtService.instance.isExpired.toString());
        print(GetStorageService.instance.box.read("userID"));
        print("royxatdan otdi");

        emit(SignUpState());
      } else {
        print("xato");
      }
    } catch (e) {
      print("xato");
    }
  }

  Future signIn(BuildContext context, String email, String password) async {
    try {
      emit(AuthLoading());
      Response res =
          await Dio().post('http://192.168.2.193:1337/api/auth/local', data: {
        "identifier": email,
        "password": password,
      });
      if (res.statusCode == 200) {
        await GetStorageService.instance.box.write("token", res.data['jwt']);
        await GetStorageService.instance.box
            .write("userID", res.data['user']["id"]);
        print(GetStorageService.instance.box.read("userID"));
      Navigator.pushNamedAndRemoveUntil(context, '/onBoard', (route) => false);
        emit(SignInState());
        print("tizimga kirdi");
      } else {
        print("xato1");
      }
    } catch (e) {
      emit(AuthError(errorText: "xatobor"));
      print("xato2");
    }
  }

  changeState(AuthState state) {
    emit(state);
    emailController.clear();
    passwordController.clear();
  }
}
