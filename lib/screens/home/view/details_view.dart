import 'package:flutter/material.dart';
import 'package:openuzbekistan/core/constants/colors/color_const.dart';
import 'package:openuzbekistan/core/extensions/context_extension.dart';
import 'package:openuzbekistan/screens/home/cubit/home_cubit.dart';
import 'package:openuzbekistan/widgets/text_widget.dart';

class DetailsView extends StatelessWidget {
  Map<String, dynamic> data;
  DetailsView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConst.kPrimaryColor,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: ColorConst.white,
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                height: context.h * 0.08,
                child: Row(
                  children: [
                    SizedBox(
                      width: context.w * 0.05,
                    ),
                    TextWidget.textWidget(
                        text: HomeCubit.categories[0], size: 20.0)
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: data['data'].length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ClipRRect(
                        child: Container(
                          child: Image.network(
                            'uploads/chimgan_4b0fad4bf8.jpg'
                              // '${data['data'][i]['attributes']['picture']['data'][0]['attributes']['url']}',
                              ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
        );
  }
}
