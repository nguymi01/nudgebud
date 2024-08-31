import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/pages/sign_up_page/sign_up_form/photo_form/bloc/profile_photo_form_bloc.dart';
import 'package:flutterdemo/base/route.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/widgets/curstom_button.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhotoForm extends StatelessWidget {
  const ProfilePhotoForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfilePhotoFormBloc(),
      child: const ProfilePhotoFormView(),
    );
  }
}

class ProfilePhotoFormView extends StatelessWidget {
  const ProfilePhotoFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColor.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSize.getWidth(context, 16),
            vertical: AppSize.getHeight(context, 16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Profile Photo',
                  style: TextStyle(
                      fontSize: AppSize.getFontSize(context, 40),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: AppSize.getHeight(context, 20)),
                // Image.asset('assets/images/profile_photo_placeholder.png',
                //     height: 150),
                SizedBox(height: AppSize.getHeight(context, 64)),
                Text(
                    'Please upload a profile photo of yourself. This photo will represent your profile while using the app.',
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: AppSize.getFontSize(context, 16))),
                SizedBox(height: AppSize.getHeight(context, 30)),
                BlocBuilder<ProfilePhotoFormBloc, ProfilePhotoFormState>(
                  buildWhen: (previous, current) =>
                      current is ProfilePhotoFormLoading ||
                      current is ProfilePhotoSelected ||
                      current is ProfilePhotoFormInitial ||
                      (previous is ProfilePhotoFormLoading &&
                          current is! ProfilePhotoFormLoading),
                  builder: (context, state) {
                    if (state is ProfilePhotoFormInitial) {
                      return Column(
                        children: [
                          Container(
                            width: AppSize.getWidth(context, 128),
                            height: AppSize.getHeight(context, 105),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.camera_alt_rounded,
                                  size: AppSize.getWidth(context, 80),
                                  color: Colors.black),
                              onPressed: () {
                                context
                                    .read<ProfilePhotoFormBloc>()
                                    .add(ProfilePhotoFormEventSelectPhoto());
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Upload Photo',
                            style: TextStyle(
                              fontSize: AppSize.getFontSize(context, 16),
                            ),
                          ),
                        ],
                      );
                    }
                    if (state is ProfilePhotoFormLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProfilePhotoSelected) {
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 100,
                            backgroundImage: FileImage(File(state.image!.path)),
                          ),
                          SizedBox(height: AppSize.getHeight(context, 16)),
                          GestureDetector(
                            onTap: () {
                              print('Hello');
                              context
                                  .read<ProfilePhotoFormBloc>()
                                  .add(ProfilePhotoFormDeletePhoto());
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                  size: AppSize.getHeight(context, 20),
                                ),
                                SizedBox(width: AppSize.getWidth(context, 4)),
                                Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize:
                                          AppSize.getFontSize(context, 16)),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSize.getHeight(context, 16)),
              child: Center(
                  child: CustomButton(
                onClick: () {
                  // TODO: Add logic to handle next button press
                  Navigator.pushNamed(context, RoutesName.signupLocationForm);
                },
                text: 'Next',
                color: AppColor.buttonBlue,
                width: 275,
                height: 48,
              )),
            )
          ],
        ),
      ),
    );
  }
}
