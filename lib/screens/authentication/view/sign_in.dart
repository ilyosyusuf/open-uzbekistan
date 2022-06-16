import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openuzbekistan/core/extensions/context_extension.dart';
import 'package:openuzbekistan/screens/authentication/cubit/auth_cubit.dart';
import 'package:openuzbekistan/screens/authentication/state/auth_state.dart';
import 'package:openuzbekistan/widgets/elevatedbutton_widget.dart';
import 'package:openuzbekistan/widgets/text_form_widget.dart';

class SignInPage extends StatelessWidget {
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
                  height: context.h * 0.32,
                ),
                Form(
                  child: Column(
                    children: [
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
                    child: Text("Sign In"),
                    onPressed: () {
                      context.read<AuthCubit>().signIn(
                          context,
                          data.emailController.text,
                          data.passwordController.text);
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
                  "Don't exist an account?",
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                    onPressed: () {
                      // NavigationService.instance.pushNamedAndRemoveUntil('/signup')
                      context.read<AuthCubit>().changeState(SignUpState());
                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, '/signup', (route) => false);
                    },
                    child: Text("Register"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
