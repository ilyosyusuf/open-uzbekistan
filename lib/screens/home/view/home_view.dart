import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openuzbekistan/screens/home/cubit/home_cubit.dart';
import 'package:openuzbekistan/screens/home/state/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) {
        var data = HomeCubit();
        data.getData();
        return data;
      }),
      child: myScaffold(),
    );
  }

  Scaffold myScaffold() {
    return Scaffold(
        body: BlocConsumer<HomeCubit, HomeState>(
      listener: ((context, state) {}),
      builder: (context, state) {
        if (state is HomeComplete) {
          return Column(
            children: [
              
            ],
          );
        } else{
          return Container();
        }
      },
    ));
  }
}
