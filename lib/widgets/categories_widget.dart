import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openuzbekistan/config/init/navigation/navigator.dart';
import 'package:openuzbekistan/core/components/box_full_decoration.dart';
import 'package:openuzbekistan/core/constants/colors/color_const.dart';
import 'package:openuzbekistan/core/extensions/context_extension.dart';
import 'package:openuzbekistan/screens/home/cubit/home_cubit.dart';
import 'package:openuzbekistan/widgets/text_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var data = HomeCubit.dataList;
    return Container(
      height: context.h * 0.2,
      alignment: Alignment.center,
      child: ListView.builder(
          itemCount: HomeCubit.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Column(
              children: [
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: context.w * 0.18,
                      height: context.w * 0.18,
                      decoration: BoxAllDecoration.decor(ColorConst.white),
                    ),
                  ),
                  onTap: () {
                    // NavigationService.instance.pushNamedAndRemoveUntil('/detailsview', )
                    Navigator.pushNamed(context, '/detailsview',
                        arguments: data[0]);
                  },
                ),
                TextWidget.textWidget(text: HomeCubit.categories[i])
              ],
            );
          }),
    );
  }
}
