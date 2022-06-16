import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openuzbekistan/screens/authentication/cubit/auth_cubit.dart';
import 'package:openuzbekistan/screens/authentication/state/auth_state.dart';
import 'package:openuzbekistan/screens/authentication/view/profile_page.dart';
import 'package:openuzbekistan/screens/authentication/view/sign_in.dart';
import 'package:openuzbekistan/screens/authentication/view/sign_up.dart';

class MainSign extends StatelessWidget {
  const MainSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: myScaffold()
    );
  }

  Scaffold myScaffold() => Scaffold(
    resizeToAvoidBottomInset: false,
    body: BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state){},
      builder: (context, state){
        if(state is SignUpState){
          return SignUpPage(); 
        } else if(state is SignInState){
          return SignInPage();
        } else if(state is ProfileState){
          return ProfilePage();
        }  else{
          return Container();
        }
      } 
      )
  );
}