import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openuzbekistan/core/components/box_full_decoration.dart';
import 'package:openuzbekistan/core/constants/colors/color_const.dart';
import 'package:openuzbekistan/core/extensions/context_extension.dart';
import 'package:openuzbekistan/screens/home/cubit/home_cubit.dart';
import 'package:openuzbekistan/screens/home/state/home_state.dart';
import 'package:openuzbekistan/widgets/categories_widget.dart';
import 'package:openuzbekistan/widgets/text_widget.dart';

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
      backgroundColor: ColorConst.kPrimaryColor,
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          if (state is HomeComplete) {
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    color: ColorConst.white,
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    height: context.h * 0.08,
                    child: Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(
                          width: context.w * 0.05,
                        ),
                        TextWidget.textWidget(text: "User's Name", size: 20.0)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget.textWidget(
                            text: "Discover",
                            size: 40,
                          ),
                          TextWidget.textWidget(
                            text: "New Destination",
                            size: 40,
                          ),
                          SizedBox(height: context.h * 0.05),
                          CupertinoSearchTextField(),
                          SizedBox(height: context.h * 0.05),
                          TextWidget.textWidget(text: "Category", size: 20.0),
                          CategoriesWidget(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
