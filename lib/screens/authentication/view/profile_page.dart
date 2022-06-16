import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openuzbekistan/config/init/navigation/navigator.dart';
import 'package:openuzbekistan/core/constants/colors/color_const.dart';
import 'package:openuzbekistan/core/extensions/context_extension.dart';
import 'package:openuzbekistan/screens/authentication/cubit/auth_cubit.dart';
import 'package:openuzbekistan/widgets/elevatedbutton_widget.dart';
import 'package:openuzbekistan/widgets/text_form_widget.dart';
import 'package:openuzbekistan/widgets/text_widget.dart';

class ProfilePage extends StatelessWidget {
  XFile? image;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var data = context.watch<AuthCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: ColorConst.kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: context.w,
              height: context.h * 0.07,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 25),
              color: Colors.white,
              child: const Text(
                "Fill Your Profile",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.88,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatefulBuilder(
                      builder: ((context, setState) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              SizedBox(
                                child: data.image != null
                                    ? CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        backgroundImage:
                                            FileImage(File(data.image!.path)),
                                            )
                                    : CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        backgroundImage: AssetImage(
                                            'assets/images/userimage.png')),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: CircleAvatar(
                                  child: IconButton(
                                    onPressed: () async {
                                      context.read<AuthCubit>().fromGallery();
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                        SizedBox(height: context.h * 0.04),
                    MyTextField.textField(
                        text: "Nickname", controller: data.nameController),
                        SizedBox(height: context.h * 0.04),
                    MyTextField.textField(
                        maxLines: 8,
                        text: "Bio", controller: data.nameController),
                    Spacer(),
                    ButtonWidgets(
                      height: context.h * 0.07,
                      child: TextWidget.textWidget(text: "Save", color: ColorConst.white), onPressed: (){
                        context.read<AuthCubit>().fillProfile(data.nameController.text, data.bioController.text, File(data.image!.path));
                      NavigationService.instance.pushNamedAndRemoveUntil('/homeview');
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
