import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/constant.dart';
import 'package:flutterdemo/base/pages/sign_up_page/sign_up_form/gender_form/gender_form_bloc.dart';
import 'package:flutterdemo/base/route.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/main.dart';
import 'package:flutterdemo/widgets/curstom_button.dart';

class GenderForm extends StatefulWidget {
  const GenderForm({super.key});

  @override
  State<GenderForm> createState() => _GenderFormState();
}

class _GenderFormState extends State<GenderForm> {
  GenderFormBloc bloc = GenderFormBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenderFormBloc, GenderFormState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is GenderFormInitial) {
          return mainView(context, '');
        } else if (state is GenderFormStateChosen) {
          return mainView(context, state.gender);
        } else {
          return mainView(context, '');
        }
      },
    );
  }

  Widget mainView(BuildContext context, String gender) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.blue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppSize.getWidth(context, 16)),
          child: form(context, gender),
        ),
      ),
    );
  }

  Widget form(BuildContext context, String gender) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppSize.getWidth(context, 8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gender',
                style: TextStyle(
                    fontSize: AppSize.getFontSize(context, 40),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: AppSize.getHeight(context, 16),
              ),
              Center(
                child: Text(
                  "Please select your gender:",
                  style: TextStyle(fontSize: AppSize.getFontSize(context, 16)),
                ),
              ),
              SizedBox(
                height: AppSize.getHeight(context, 16),
              ),
              Center(
                child: Column(
                  children: [
                    CustomButton(
                      onClick: () {
                        bloc.add(GenderFormEventClickButton('Female'));
                      },
                      text: 'Female',
                      width: 288,
                      radius: 16,
                      color: gender == 'Female'
                          ? AppColor.buttonBlue
                          : AppColor.gray,
                    ),
                    SizedBox(
                      height: AppSize.getHeight(context, 16),
                    ),
                    CustomButton(
                      onClick: () {
                        bloc.add(GenderFormEventClickButton('Male'));
                      },
                      text: 'Male',
                      width: 288,
                      radius: 16,
                      color: gender == 'Male'
                          ? AppColor.buttonBlue
                          : AppColor.gray,
                    ),
                    SizedBox(
                      height: AppSize.getHeight(context, 16),
                    ),
                    CustomButton(
                      onClick: () {
                        bloc.add(
                            GenderFormEventClickButton('Transgender Female'));
                      },
                      text: 'Transgender Female',
                      width: 288,
                      radius: 16,
                      color: gender == 'Transgender Female'
                          ? AppColor.buttonBlue
                          : AppColor.gray,
                    ),
                    SizedBox(
                      height: AppSize.getHeight(context, 16),
                    ),
                    CustomButton(
                      onClick: () {
                        bloc.add(
                            GenderFormEventClickButton('Transgender Male'));
                      },
                      text: 'Transgender Male',
                      width: 288,
                      radius: 16,
                      color: gender == 'Transgender Male'
                          ? AppColor.buttonBlue
                          : AppColor.gray,
                    ),
                    SizedBox(
                      height: AppSize.getHeight(context, 16),
                    ),
                    CustomButton(
                      onClick: () {
                        bloc.add(GenderFormEventClickButton('Intersex'));
                      },
                      text: 'Intersex',
                      width: 288,
                      radius: 16,
                      color: gender == 'Intersex'
                          ? AppColor.buttonBlue
                          : AppColor.gray,
                    ),
                    SizedBox(
                      height: AppSize.getHeight(context, 16),
                    ),
                    CustomButton(
                      onClick: () {
                        bloc.add(
                            GenderFormEventClickButton('Prefer not to say'));
                      },
                      text: 'Prefer not to say',
                      width: 288,
                      radius: 16,
                      color: gender == 'Prefer not to say'
                          ? AppColor.buttonBlue
                          : AppColor.gray,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: AppSize.getHeight(context, 16)),
          child: Center(
              child: CustomButton(
            color: gender == "" ? AppColor.gray : AppColor.buttonBlue,
            onClick: gender == ""
                ? () {}
                : () {
                    prefs.setString(Constant.gender, gender);
                    Navigator.pushNamed(context, RoutesName.signUpBirthdayForm);
                  },
            text: 'Next',
            width: 275,
            height: 48,
          )),
        )
      ],
    );
  }
}
