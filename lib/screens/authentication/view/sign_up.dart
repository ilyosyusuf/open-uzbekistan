import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openuzbekistan/core/extensions/context_extension.dart';
import 'package:openuzbekistan/screens/authentication/cubit/auth_cubit.dart';
import 'package:openuzbekistan/screens/authentication/state/auth_state.dart';
import 'package:openuzbekistan/widgets/elevatedbutton_widget.dart';
import 'package:openuzbekistan/widgets/text_form_widget.dart';

class SignUpPage extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool checkValue = false;
  bool isShown = true;
  @override
  Widget build(BuildContext context) {
    return myScaffold(context);
  }

  Scaffold myScaffold(BuildContext context) {
    var data = context.watch<AuthCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: context.h * 0.25,
                ),
                Form(
                  child: Column(
                    children: [
                      MyTextField.textField(
                          text: "Enter Username",
                          controller: data.nameController,
                          prefixIcon: Icon(Icons.phone)),
                      const SizedBox(
                        height: 30.0,
                      ),
                      MyTextField.textField(
                          text: "Enter Email",
                          controller: data.emailController,
                          prefixIcon: Icon(Icons.email)),
                      const SizedBox(
                        height: 30.0,
                      ),
                      MyTextField.textField(
                          text: "Enter Password",
                          controller: data.passwordController,
                          prefixIcon: Icon(Icons.password),
                          iconButton: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove_red_eye))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ButtonWidgets(
                    height: context.h * 0.07,
                    child: Text("Sign Up"),
                    onPressed: () {
                      context.read<AuthCubit>().changeState(ProfileState());
                    }),
                const SizedBox(height: 65),
              ],
            ),
          ),
          Spacer(),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Allready have an account?",
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(
                onPressed: () {
                  context.read<AuthCubit>().changeState(SignInState());
                },
                child: Text("Sign In"),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
